using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;

namespace MedSched.Middlewares
{
    public class AuthorizationMiddleware
    {
        private readonly RequestDelegate _next;

        public AuthorizationMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext httpContext)
        {
            var path = httpContext.Request.Path.Value?.ToLower();
            var tcKimlikNo = httpContext.Session.GetString("tcKimlikNo");

            // 1. İstisna Yollar: Giriş sayfası, Kayıt sayfası ve Statik dosyaları (CSS/JS) muaf tutalım
            // Aksi takdirde login sayfası bile açılmaz!
            if (path.StartsWith("/account") || path.StartsWith("/home") || path.Contains("/lib/") || path.Contains("/css/"))
            {
                await _next(httpContext);
                return;
            }

            // 2. Session Kontrolü
            if (string.IsNullOrEmpty(tcKimlikNo))
            {
                // Giriş yapılmamışsa yönlendir
                httpContext.Response.Redirect("/Account/Index");
                return;
            }

            await _next(httpContext);
        }
    }
}