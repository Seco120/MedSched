using Microsoft.AspNetCore.Mvc;
using MedSched.Data;
using MedSched.Models;
using MedSched.Services;
using Microsoft.EntityFrameworkCore;

namespace MedSched.Controllers
{
    public class AccountController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IEmailService _emailService;

        public AccountController(ApplicationDbContext context, IEmailService emailService)
        {
            _context = context;
            _emailService = emailService;
        }

        [HttpPost]
        public IActionResult Login(string tcKimlikNo, string password)
        {
            var user = _context.Kullanicilar.AsNoTracking().FirstOrDefault(u => u.TCKimlikNo == tcKimlikNo);

            if (user == null || !BCrypt.Net.BCrypt.Verify(password, user.Sifre))
                return Json(new { success = false, message = "Geçersiz TC Kimlik No veya şifre." });

            HttpContext.Session.SetString("tcKimlikNo", user.TCKimlikNo);
            HttpContext.Session.SetString("adSoyad", user.AdSoyad);
            HttpContext.Session.SetInt32("KullaniciId", user.KullaniciId); // Diğer controllerlar için kritik!

            return Json(new { success = true, redirectUrl = Url.Action("Index", "Home") });
        }

        [HttpPost]
        public async Task<IActionResult> ForgotPassword(string email)
        {
            var user = await _context.Kullanicilar.FirstOrDefaultAsync(u => u.Eposta == email);
            if (user == null) return BadRequest("Kullanıcı bulunamadı.");

            string newPassword = Guid.NewGuid().ToString().Substring(0, 6); // Daha hızlı şifre üretimi
            user.Sifre = BCrypt.Net.BCrypt.HashPassword(newPassword);
            await _context.SaveChangesAsync();

            string body = $"Yeni şifreniz: {newPassword}\nLütfen giriş yaptıktan sonra değiştirin.";
            bool emailSent = await _emailService.SendEmailAsync(email, "Şifre Sıfırlama", body);

            return emailSent ? Ok("✅ Yeni şifreniz gönderildi.") : StatusCode(500, "E-posta hatası.");
        }

        [HttpGet]
        public IActionResult ProfilAyarlari()
        {
            var tc = HttpContext.Session.GetString("tcKimlikNo");
            if (string.IsNullOrEmpty(tc)) return RedirectToAction("Index", "Auth");

            var kullanici = _context.Kullanicilar.FirstOrDefault(k => k.TCKimlikNo == tc);
            if (kullanici == null) return NotFound();

            // Gereksiz çift kontrolleri kaldırdım, ViewBagleri düzenledim
            Response.Headers["Cache-Control"] = "no-cache, no-store, must-revalidate";
            ViewBag.AdSoyad = kullanici.AdSoyad;
            ViewBag.TCKimlikNo = tc;

            return View(kullanici);
        }

        [HttpPost]
        public IActionResult ProfilAyarlari(Kullanici guncellenmisKullanici)
        {
            var tc = HttpContext.Session.GetString("tcKimlikNo");
            if (string.IsNullOrEmpty(tc)) return RedirectToAction("Index", "Auth");

            var kullanici = _context.Kullanicilar.FirstOrDefault(k => k.TCKimlikNo == tc);
            if (kullanici == null) return NotFound();

            // Email kontrolü
            if (_context.Kullanicilar.Any(k => k.Eposta.ToLower() == guncellenmisKullanici.Eposta.ToLower() && k.TCKimlikNo != tc))
            {
                ViewBag.Hata = "❌ Bu e-posta zaten kayıtlı.";
                return View(kullanici);
            }

            kullanici.AdSoyad = guncellenmisKullanici.AdSoyad;
            kullanici.Eposta = guncellenmisKullanici.Eposta;

            if (!string.IsNullOrWhiteSpace(guncellenmisKullanici.Sifre))
                kullanici.Sifre = BCrypt.Net.BCrypt.HashPassword(guncellenmisKullanici.Sifre);

            _context.SaveChanges();
            HttpContext.Session.SetString("adSoyad", kullanici.AdSoyad);

            TempData["BasariliMesaj"] = "✅ Profil başarıyla güncellendi.";
            return RedirectToAction("ProfilAyarlari");
        }

        [HttpPost]
        public JsonResult CheckEmail(string email)
        {
            var tc = HttpContext.Session.GetString("tcKimlikNo");
            bool exists = _context.Kullanicilar.Any(k => k.Eposta.ToLower() == email.ToLower() && k.TCKimlikNo != tc);
            return Json(new { exists });
        }
    }
}