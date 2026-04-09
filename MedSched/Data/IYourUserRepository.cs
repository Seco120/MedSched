using System.Threading.Tasks;
using MedSched.Models;

namespace MedSched.Repositories
{
    public interface IYourUserRepository
    {
        // Kullanıcıyı e-posta ile bul (Giriş ve Şifre Sıfırlama için)
        Task<Kullanici?> GetByEmailAsync(string email);

        // Kullanıcıyı TC ile bul (Kayıt kontrolü için)
        Task<Kullanici?> GetByTCKimlikNoAsync(string tckimlikno);

        // Kullanıcıyı ID ile bul (Profil detayları için lazım olur)
        Task<Kullanici?> GetByIdAsync(int id);

        // Kullanıcı bilgilerini (şifre dahil) güncelle
        Task<bool> UpdateUserAsync(Kullanici user);

        // Yeni kullanıcı ekle
        Task<bool> AddUserAsync(Kullanici user);
    }
}