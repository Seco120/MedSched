using Microsoft.AspNetCore.Mvc;

namespace MedSched.Controllers
{
    public class HastaneController : Controller
    {
        public IActionResult Index()
        {
            // Session değerlerini değişkenlere alarak tekrarı önleyelim
            var tcNo = HttpContext.Session.GetString("tcKimlikNo");
            var adSoyad = HttpContext.Session.GetString("adSoyad");

            if (string.IsNullOrEmpty(tcNo))
            {
                return RedirectToAction("Index", "Auth");
            }

            // Tarayıcı geri tuşuyla yetkisiz girişi engellemek için ideal
            Response.Headers["Cache-Control"] = "no-cache, no-store, must-revalidate";

            ViewBag.TCKimlikNo = tcNo;
            ViewBag.AdSoyad = adSoyad;

            return View();
        }
    }
}