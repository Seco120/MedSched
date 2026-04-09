using Microsoft.EntityFrameworkCore;
using MedSched.Models;

namespace MedSched.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }

        public DbSet<Kullanici> Kullanicilar { get; set; }
        public DbSet<Bolum> Bolumler { get; set; }
        public DbSet<Doktor> Doktorlar { get; set; }
        public DbSet<Randevular> Randevular { get; set; }
        public DbSet<Hastane> Hastaneler { get; set; }
        public DbSet<RandevuTarihleri> RandevuTarihleri { get; set; }
        public DbSet<RandevuSaatleri> RandevuSaatleri { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Randevular tablosu için özel ayarlar
            modelBuilder.Entity<Randevular>(entity =>
            {
                // Durum bilgisini string olarak saklıyoruz (Beklemede, Onaylandı, İptal vb.)
                entity.Property(r => r.Durum)
                      .HasMaxLength(50)
                      .HasConversion<string>();

                // SQL Server'da TimeSpan için uygun tip eşleşmesi (Opsiyonel ama garantiye alır)
                entity.Property(r => r.SecilenSaat)
                      .HasColumnType("time");
            });

            // İlişkilerde "Multiple Cascade Paths" hatasını engellemek için 
            // (Bir kullanıcı silindiğinde her şeyin patlamaması için bazı silme kurallarını kısıtlayabiliriz)
            foreach (var relationship in modelBuilder.Model.GetEntityTypes().SelectMany(e => e.GetForeignKeys()))
            {
                relationship.DeleteBehavior = DeleteBehavior.Restrict;
            }

            base.OnModelCreating(modelBuilder);
        }
    }
}