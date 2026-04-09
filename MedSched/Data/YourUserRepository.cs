using Microsoft.EntityFrameworkCore;
using MedSched.Models;
using MedSched.Data;
using MedSched.Repositories; // Namespace kontrolünü unutma kanka

namespace MedSched.Repositories
{
    public class YourUserRepository : IYourUserRepository
    {
        private readonly ApplicationDbContext _context;

        public YourUserRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        // E-posta ile kullanıcı bulma
        public async Task<Kullanici?> GetByEmailAsync(string email)
        {
            return await _context.Kullanicilar
                .FirstOrDefaultAsync(u => u.Eposta == email);
        }

        // TC Kimlik No ile kullanıcı bulma
        public async Task<Kullanici?> GetByTCKimlikNoAsync(string tckimlikno)
        {
            return await _context.Kullanicilar
                .FirstOrDefaultAsync(u => u.TCKimlikNo == tckimlikno);
        }

        // ID ile kullanıcı bulma (Profil sayfaları için kritik)
        public async Task<Kullanici?> GetByIdAsync(int id)
        {
            return await _context.Kullanicilar.FindAsync(id);
        }

        // Kullanıcı güncelleme (Şifre sıfırlama veya profil düzenleme)
        public async Task<bool> UpdateUserAsync(Kullanici user)
        {
            _context.Kullanicilar.Update(user);
            return await _context.SaveChangesAsync() > 0;
        }

        // Yeni kullanıcı kaydı (Registration)
        public async Task<bool> AddUserAsync(Kullanici user)
        {
            await _context.Kullanicilar.AddAsync(user);
            return await _context.SaveChangesAsync() > 0;
        }
    }
}