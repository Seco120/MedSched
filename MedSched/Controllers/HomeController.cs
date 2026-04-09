using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;

namespace MedSched.Controllers
{
    public class HomeController : Controller
    {
        // Uygulama ilk açýldýðýnda çalýþan yer
        public IActionResult Index()
        {
            // Kullanýcý oturumu var mý kontrol et
            if (string.IsNullOrEmpty(HttpContext.Session.GetString("tcKimlikNo")))
            {
                // Giriþ yapýlmadýysa Auth/Index (Giriþ Sayfasý)
                return RedirectToAction("Index", "Auth");
            }
            // Giriþ yapýlmýþsa ana sayfaya gönder
            return RedirectToAction("HomePage");
        }

        public IActionResult HomePage()
        {
            var tcKimlikNo = HttpContext.Session.GetString("tcKimlikNo");

            if (string.IsNullOrEmpty(tcKimlikNo))
            {
                return RedirectToAction("Index", "Auth");
            }

            // Güvenlik: Geri tuþuna basýldýðýnda login ekranýna dönmeyi zorunlu kýlar
            Response.Headers["Cache-Control"] = "no-store, no-cache, must-revalidate";

            // View tarafýnda (HTML) kullanýcýyý selamlamak için bilgileri gönderiyoruz
            ViewBag.AdSoyad = HttpContext.Session.GetString("adSoyad");
            ViewBag.TCKimlikNo = tcKimlikNo;

            return View();
        }

        // Hata sayfasý (Varsayýlan .NET yapýsý)
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new MedSched.Models.ErrorViewModel { RequestId = System.Diagnostics.Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}