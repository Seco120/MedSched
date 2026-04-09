using System.Net;
using System.Net.Mail;
using System.Net.Mime; // Burayı eklemeyi unutma!

namespace MedSched.Services
{
    public class EmailService : IEmailService
    {
        private readonly IConfiguration _configuration;

        public EmailService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<bool> SendEmailAsync(string to, string subject, string body, string logoPath = null)
        {
            var fromEmail = _configuration["EmailSettings:FromEmail"];
            var fromPassword = _configuration["EmailSettings:FromPassword"];
            var host = _configuration["EmailSettings:SmtpServer"];
            var port = int.Parse(_configuration["EmailSettings:Port"] ?? "587");

            using var smtpClient = new SmtpClient(host, port)
            {
                Credentials = new NetworkCredential(fromEmail, fromPassword),
                EnableSsl = true,
                UseDefaultCredentials = false
            };

            using var mailMessage = new MailMessage
            {
                From = new MailAddress(fromEmail, "MedSched"),
                Subject = subject,
                IsBodyHtml = true
            };
            mailMessage.To.Add(to);

            // --- LOGO GÖMME İŞLEMİ ---
            if (!string.IsNullOrEmpty(logoPath) && File.Exists(logoPath))
            {
                // HTML view oluşturuyoruz
                AlternateView htmlView = AlternateView.CreateAlternateViewFromString(body, null, "text/html");

                // Logoyu LinkedResource olarak tanımlıyoruz
                LinkedResource logo = new LinkedResource(logoPath, "image/png");
                logo.ContentId = "medsched_logo"; // HTML içindeki img src='cid:medsched_logo' ile eşleşmeli

                htmlView.LinkedResources.Add(logo);
                mailMessage.AlternateViews.Add(htmlView);
            }
            else
            {
                mailMessage.Body = body;
            }

            try
            {
                await smtpClient.SendMailAsync(mailMessage);
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Mail Hatası: {ex.Message}");
                return false;
            }
        }
    }
}