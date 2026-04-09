using Microsoft.AspNetCore.Mvc;

public class ContactController : Controller
{
    public IActionResult Index()
    {
        // Session değerlerini tek seferde alalım
        var tcNo = HttpContext.Session.GetString("tcKimlikNo");
        var adSoyad = HttpContext.Session.GetString("adSoyad");

        // Oturum kontrolü
        if (string.IsNullOrEmpty(tcNo))
        {
            return RedirectToAction("Index", "Auth");
        }

        // Güvenlik için Cache temizliği
        Response.Headers["Cache-Control"] = "no-cache, no-store, must-revalidate";

        // View'a gönderilecek bilgiler
        ViewBag.AdSoyad = adSoyad;
        ViewBag.TCKimlikNo = tcNo;

        return View();
    }
}