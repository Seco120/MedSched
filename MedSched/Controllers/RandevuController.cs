using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MedSched.Data;
using MedSched.Models;

namespace MedSched.Controllers
{
    public class RandevuController : Controller
    {
        private readonly ApplicationDbContext _context;

        public RandevuController(ApplicationDbContext context) => _context = context;

        [HttpPost]
        public IActionResult IptalEtAktifRandevu(int id) 
        {
            var kullaniciId = HttpContext.Session.GetInt32("KullaniciId");
            if (kullaniciId == null)
                return Json(new { success = false, message = "Oturum süresi dolmuş, lütfen tekrar giriş yapın." });

            // MODELİNE GÖRE GÜNCELLENDİ: RandevuId üzerinden ve kullanıcı doğrulamasıyla ara
            var randevu = _context.Randevular
                .FirstOrDefault(r => r.RandevuId == id && r.KullaniciId == kullaniciId);

            if (randevu == null)
            {
                // Debug için mesajı detaylandırdım, hata alırsan ID'yi görebilelim
                return Json(new { success = false, message = $"Hata: {id} numaralı randevu sistemde bulunamadı veya size ait değil." });
            }

            try
            {
                // Randevuyu silmek yerine durumunu "İptal Edildi" yapmak veritabanı sağlığı için daha iyidir
                // Ama sen direkt silmek istiyorsan alttaki Remove kalsın:
                _context.Randevular.Remove(randevu);
                _context.SaveChanges();

                return Json(new { success = true, message = "Randevunuz başarıyla iptal edildi." });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "Veritabanı hatası: " + ex.Message });
            }
        }
        [HttpGet]
        public IActionResult GetTümRandevular()
        {
            var kullaniciId = HttpContext.Session.GetInt32("KullaniciId");
            if (kullaniciId == null)
                return Json(new { success = false, message = "Oturum süresi dolmuş." });

            var bugun = DateTime.Now;

            var randevular = (from r in _context.Randevular.AsNoTracking()
                              join d in _context.Doktorlar on r.DoktorId equals d.DoktorId
                              join b in _context.Bolumler on d.BolumId equals b.BolumId
                              join h in _context.Hastaneler on r.HastaneId equals h.HastaneId
                              where r.KullaniciId == kullaniciId
                              orderby r.SecilenTarih descending, r.SecilenSaat descending
                              select new
                              {
                                  // İŞTE EKSİK OLAN SATIR BURASIYDI:
                                  RandevuId = r.RandevuId,

                                  Tarih = r.SecilenTarih.ToString("yyyy-MM-dd"),
                                  saat = r.SecilenSaat.ToString(@"hh\:mm"),
                                  DoktorAdi = d.DoktorAdi,
                                  Bolum = b.BolumAdi,
                                  Hastane = h.HastaneAdi,
                                  Durum = r.Durum == "Iptal" ? "İptal Edildi" :
                                          (r.SecilenTarih.Date < bugun.Date || (r.SecilenTarih.Date == bugun.Date && r.SecilenSaat < bugun.TimeOfDay)
                                          ? "Geçti" : "Aktif")
                              }).ToList();

            if (randevular.Any())
                return Json(new { success = true, data = randevular });

            return Json(new { success = false, message = "Hiçbir randevu bulunamadı." });
        }
    }
}