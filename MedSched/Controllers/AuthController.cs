using MedSched.Data;
using MedSched.Models;
using MedSched.Services;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MedSched.Controllers
{
    public class AuthController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IEmailService _emailService;

        public AuthController(ApplicationDbContext context, IEmailService emailService)
        {
            _context = context;
            _emailService = emailService;
        }

        public IActionResult Index() => View();
        public IActionResult Login() => View();
        public IActionResult Register() => View();

        [HttpPost]
        public async Task<IActionResult> Register(string tcKimlikNo, string fullName, string email, string password)
        {
            if (tcKimlikNo?.Length != 11 || !tcKimlikNo.All(char.IsDigit))
                return Json(new { success = false, error = "TC Kimlik Numarası 11 haneli ve rakamlardan oluşmalıdır!" });

            if (string.IsNullOrWhiteSpace(fullName) || !fullName.All(c => char.IsLetter(c) || char.IsWhiteSpace(c)))
                return Json(new { success = false, error = "Ad Soyad sadece harf içerebilir!" });

            if (await _context.Kullanicilar.AnyAsync(u => u.TCKimlikNo == tcKimlikNo))
                return Json(new { success = false, error = "Bu TC Kimlik Numarası zaten kayıtlı!" });

            if (await _context.Kullanicilar.AnyAsync(u => u.Eposta == email))
                return Json(new { success = false, error = "Bu e-posta adresi zaten kullanılıyor!" });

            var newUser = new Kullanici
            {
                TCKimlikNo = tcKimlikNo,
                AdSoyad = fullName,
                Eposta = email,
                Sifre = BCrypt.Net.BCrypt.HashPassword(password),
                Rol = "Hasta",
                OlusturulmaTarihi = DateTime.Now
            };

            _context.Kullanicilar.Add(newUser);
            await _context.SaveChangesAsync();

            // --- HOŞ GELDİN MAİLİ (LOGOLU) ---
            try
            {
                string logoPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images", "logo.png");
                string subject = "MedSched'e Hoş Geldiniz!";
                string body = $@"
                    <div style='text-align: center; font-family: sans-serif;'>
                        <img src='cid:medsched_logo' width='150' alt='Logo' />
                        <h1 style='color: #2c3e50;'>Merhaba {fullName}!</h1>
                        <p>Kaydınız başarıyla oluşturuldu. Sağlıklı günler dileriz.</p>
                    </div>";

                await _emailService.SendEmailAsync(email, subject, body, logoPath);
            }
            catch { /* Kayıt işlemi mail hatasından etkilenmesin */ }

            return Json(new { success = true });
        }

        [HttpPost]
        public async Task<IActionResult> Login(string tcKimlikNo, string password)
        {
            var user = await _context.Kullanicilar.FirstOrDefaultAsync(u => u.TCKimlikNo == tcKimlikNo);

            if (user == null || !BCrypt.Net.BCrypt.Verify(password, user.Sifre))
            {
                return Json(new { success = false, error = "TC Kimlik No veya şifre hatalı!" });
            }

            HttpContext.Session.SetInt32("KullaniciId", user.KullaniciId);
            HttpContext.Session.SetString("tcKimlikNo", user.TCKimlikNo);
            HttpContext.Session.SetString("adSoyad", user.AdSoyad);

            return Json(new { success = true });
        }

        [HttpPost]
        public async Task<IActionResult> ForgotPassword(string email)
        {
            var user = await _context.Kullanicilar.FirstOrDefaultAsync(u => u.Eposta == email);

            if (user == null)
            {
                return Json(new { success = true, message = "E-posta adresiniz kayıtlıysa sıfırlama maili gönderilmiştir." });
            }

            // --- ŞİFRE SIFIRLAMA MAİLİ (LOGOLU) ---
            string logoPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images", "logo.png");
            string subject = "Şifre Sıfırlama Talebi";
            string resetLink = "https://localhost:7134/Auth/ResetPassword?email=" + email;

            string body = $@"
                <div style='text-align: center; font-family: sans-serif;'>
                    <img src='cid:medsched_logo' width='150' alt='Logo' />
                    <h3 style='color: #2c3e50;'>Şifre Sıfırlama</h3>
                    <p>Şifrenizi sıfırlamak için aşağıdaki butona tıklayın:</p>
                    <a href='{resetLink}' style='display: inline-block; padding: 10px 20px; background-color: #000; color: #fff; text-decoration: none; border-radius: 25px;'>Şifremi Sıfırla</a>
                </div>";

            bool sent = await _emailService.SendEmailAsync(email, subject, body, logoPath);

            if (sent) return Json(new { success = true, message = "Sıfırlama maili gönderildi." });
            return Json(new { success = false, message = "Mail gönderilirken bir hata oluştu!" });
        }

        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            HttpContext.Session.Clear();
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Index", "Auth");
        }

        [HttpPost]
        public async Task<JsonResult> CheckTC(string tcKimlikNo)
        {
            bool exists = await _context.Kullanicilar.AnyAsync(u => u.TCKimlikNo == tcKimlikNo);
            return Json(new { exists });
        }
    }
}