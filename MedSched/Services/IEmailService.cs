using System.Threading.Tasks;

namespace MedSched.Services
{
    public interface IEmailService
    {
        /// <summary>
        /// Genel e-posta gönderme metodu. 
        /// Şifre sıfırlama, bildirim veya onay mailleri için bu kullanılır.
        /// </summary>
        Task<bool> SendEmailAsync(string to, string subject, string body, string logoPath = null);
    }
}