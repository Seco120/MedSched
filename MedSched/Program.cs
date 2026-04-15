using MedSched.Data;
using MedSched.Services;
using MedSched.Repositories; // Eksik olabilir, ekledim
using MedSched.Middlewares; // Middleware klasörün
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authentication.Cookies;

var builder = WebApplication.CreateBuilder(args);

// 🔹 Veritabanı (MySQL kullandığını görüyorum, Pomelo paketi yüklü olmalı)
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseMySql(builder.Configuration.GetConnectionString("DefaultConnection"),
    ServerVersion.AutoDetect(builder.Configuration.GetConnectionString("DefaultConnection"))));

// 🔹 DI Container Kayıtları (Burayı mermi gibi dizdik)
builder.Services.AddScoped<IYourUserRepository, YourUserRepository>();
builder.Services.AddScoped<IUserService, UserService>(); // 👈 EKSİKTİ, EKLEDİM!
builder.Services.AddScoped<IEmailService, EmailService>();

// 🔹 Session (Senin Middleware için şart)
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});

// 🔹 Authentication (Cookie tabanlı kalsın, ama Middleware ile uyumlu olmalı)
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.LoginPath = "/Account/Index"; // Middleware ile tutarlı yaptık
        options.LogoutPath = "/Account/Index";
        options.ExpireTimeSpan = TimeSpan.FromMinutes(60);
    });

builder.Services.AddControllersWithViews();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}
else
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();

// 🔹 KRİTİK SIRALAMA!
app.UseSession();

// 🔹 EĞER KENDİ MIDDLEWARE'İNİ KULLANACAKSAN BURAYA EKLE:
// app.UseMiddleware<AuthorizationMiddleware>(); 

app.UseAuthentication();
app.UseAuthorization();

app.MapControllerRoute(
    name: "iletisim",
    pattern: "iletisim",
    defaults: new { controller = "Contact", action = "Index" }
);

app.MapDefaultControllerRoute();

app.Run();