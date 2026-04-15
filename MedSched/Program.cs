using MedSched.Data;
using MedSched.Services;
using MedSched.Repositories;
using MedSched.Middlewares;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authentication.Cookies;

var builder = WebApplication.CreateBuilder(args);

var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseMySql(connectionString, 
    new MySqlServerVersion(new Version(8, 0, 11)))); 

builder.Services.AddScoped<IYourUserRepository, YourUserRepository>();
builder.Services.AddScoped<IUserService, UserService>(); 
builder.Services.AddScoped<IEmailService, EmailService>();

// 🔹 Session Yapılandırması
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(30);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});

// 🔹 Authentication (Cookie Tabanlı)
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.LoginPath = "/Account/Index"; 
        options.LogoutPath = "/Account/Index";
        options.ExpireTimeSpan = TimeSpan.FromMinutes(60);
    });

builder.Services.AddControllersWithViews();

var app = builder.Build();

// 🔹 HTTP Pipeline Yapılandırması
if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}
else
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

// Render gibi platformlarda SSL işini proxy hallettiği için bazen sorun çıkarabilir, 
// ama şimdilik kalsın, hata alırsan ilk burayı yorum satırına alırsın.
app.UseHttpsRedirection(); 

app.UseStaticFiles();
app.UseRouting();

// 🔹 Sıralama Önemli!
app.UseSession(); 
app.UseAuthentication();
app.UseAuthorization();

// 🔹 Özel Route Tanımları
app.MapControllerRoute(
    name: "iletisim",
    pattern: "iletisim",
    defaults: new { controller = "Contact", action = "Index" }
);

app.MapDefaultControllerRoute();

app.Run();