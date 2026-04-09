using MedSched.Models;
using MedSched.Repositories; // Repository'yi kullanıyoruz
using System.Threading.Tasks;

namespace MedSched.Services
{
    public class UserService : IUserService // Interface'e bağlıyoruz
    {
        private readonly IYourUserRepository _userRepository;

        // Doğrudan DbContext yerine Repository'yi enjekte ediyoruz (Best Practice)
        public UserService(IYourUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public async Task<bool> ResetPasswordAsync(string email, string hashedPassword)
        {
            // Kullanıcıyı repository üzerinden çekiyoruz
            var user = await _userRepository.GetByEmailAsync(email);

            if (user == null)
                return false;

            // Şifreyi güncelleyip repository üzerinden kaydediyoruz
            user.Sifre = hashedPassword;
            return await _userRepository.UpdateUserAsync(user);
        }

        // İleride lazım olacak diğer metodlar (Örnek: Profil güncelleme)
        public async Task<Kullanici?> GetUserByEmailAsync(string email)
        {
            return await _userRepository.GetByEmailAsync(email);
        }
    }
}