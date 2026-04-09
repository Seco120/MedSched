using Microsoft.AspNetCore.Mvc;
using MedSched.Models;
using MedSched.Data;
using Microsoft.EntityFrameworkCore;

namespace MedSched.Controllers
{
    public class RandevuAlController : Controller
    {
        private readonly ApplicationDbContext _context;

        public RandevuAlController(ApplicationDbContext context) => _context = context;

        // --- ANA SAYFA ---
        public IActionResult Index()
        {
            var tcKimlikNo = HttpContext.Session.GetString("tcKimlikNo");
            if (string.IsNullOrEmpty(tcKimlikNo)) return RedirectToAction("Index", "Auth");

            Response.Headers["Cache-Control"] = "no-store";

            ViewBag.AdSoyad = HttpContext.Session.GetString("adSoyad");
            ViewBag.TCKimlikNo = tcKimlikNo;

            var viewModel = new RandevuViewModel
            {
                Hastaneler = _context.Hastaneler.AsNoTracking().ToList()
            };

            return View(viewModel);
        }

        // --- AJAX METOTLARI (Hızlı ve JSON) ---

        [HttpGet]
        public async Task<JsonResult> GetBolumler(int hastaneId) =>
            Json(await _context.Bolumler.AsNoTracking()
                .Where(b => b.HastaneId == hastaneId)
                .Select(b => new { id = b.BolumId, adi = b.BolumAdi })
                .ToListAsync());

        [HttpGet]
        public async Task<JsonResult> GetDoktorlar(int bolumId) =>
            Json(await _context.Doktorlar.AsNoTracking()
                .Where(d => d.BolumId == bolumId)
                .Select(d => new { id = d.DoktorId, adi = d.DoktorAdi })
                .ToListAsync());

        // --- SAAT HESAPLAMA MOTORU ---
        [HttpGet]
        public async Task<JsonResult> GetSaatler(int doktorId, string tarih)
        {
            if (!DateTime.TryParse(tarih, out DateTime secilenTarih)) return Json(new List<object>());

            var bugun = DateTime.Now;
            var doluSaatler = await _context.Randevular
                .Where(r => r.DoktorId == doktorId && r.SecilenTarih == secilenTarih.Date)
                .Select(r => r.SecilenSaat)
                .ToListAsync();

            var sonuc = new List<object>();
            // 08:30 - 17:00 arası 30'ar dakikalık döngü
            for (var zaman = new TimeSpan(8, 30, 0); zaman <= new TimeSpan(17, 0, 0); zaman = zaman.Add(TimeSpan.FromMinutes(30)))
            {
                bool dolu = doluSaatler.Contains(zaman);
                bool gecmisMi = (secilenTarih.Date == bugun.Date && zaman <= bugun.TimeOfDay);

                sonuc.Add(new
                {
                    saat = zaman.ToString(@"hh\:mm"),
                    dolu,
                    eskiSaat = gecmisMi,
                    secilebilir = !(dolu || gecmisMi)
                });
            }
            return Json(sonuc);
        }

        // --- RANDEVU OLUŞTURMA ---
        [HttpPost]
        public async Task<IActionResult> Olustur(RandevuViewModel model, string SecilenSaat, string SecilenTarih)
        {
            var kullaniciId = HttpContext.Session.GetInt32("KullaniciId");

            // 1. Validasyon Kontrolü (Tek Noktada)
            if (kullaniciId == null || !DateTime.TryParse(SecilenTarih, out DateTime sTarih) || !TimeSpan.TryParse(SecilenSaat, out TimeSpan sSaat))
            {
                TempData["HataMesaji"] = "Lütfen tüm bilgileri eksiksiz ve doğru giriniz.";
                return RedirectToAction("Index");
            }

            // 2. Çakışma Kontrolü (Async Any)
            if (await _context.Randevular.AnyAsync(r => r.SecilenTarih == sTarih && r.SecilenSaat == sSaat && r.DoktorId == model.DoktorId && r.Durum == "Dolu"))
            {
                TempData["HataMesaji"] = "Bu saat az önce doldu, lütfen başka bir saat seçin.";
                return RedirectToAction("Index");
            }

            // 3. Kayıt İşlemi
            var randevu = new Randevular
            {
                HastaneId = model.HastaneId,
                BolumId = model.BolumId,
                DoktorId = model.DoktorId,
                KullaniciId = kullaniciId.Value,
                SecilenTarih = sTarih,
                SecilenSaat = sSaat,
                Durum = "Dolu"
            };

            _context.Randevular.Add(randevu);
            await _context.SaveChangesAsync();

            TempData["BasariliMesaj"] = "Randevunuz başarıyla oluşturuldu.";
            return RedirectToAction("Index");
        }
    }
}