using System.Threading.Tasks;
using MedSched.Models;

namespace MedSched.Services
{
    public interface IUserService
    {
        /// <summary>
        /// Kullanıcının şifresini güvenli bir şekilde sıfırlar.
        /// </summary>
        /// <param name="email">Sıfırlanacak e-posta adresi</param>
        /// <param name="hashedPassword">Yeni hash'lenmiş şifre</param>
        /// <returns>Başarılı ise true döner.</returns>
        Task<bool> ResetPasswordAsync(string email, string hashedPassword);

        /// <summary>
        /// E-posta adresine göre kullanıcı bilgilerini getirir.
        /// </summary>
        Task<Kullanici?> GetUserByEmailAsync(string email);

        // İleride profil güncelleme, hesap silme vb. buraya eklenecek
    }
}