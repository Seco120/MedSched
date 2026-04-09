using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MedSched.Models
{
    [Table("Kullanicilar")] // DbContext içindeki DbSet adınla eşleşmeli
    public class Kullanici
    {
        [Key]
        public int KullaniciId { get; set; }

        [Required(ErrorMessage = "Ad Soyad alanı boş bırakılamaz.")]
        [StringLength(100)]
        public string AdSoyad { get; set; }

        [Required(ErrorMessage = "E-posta adresi zorunludur.")]
        [EmailAddress(ErrorMessage = "Geçersiz e-posta formatı.")]
        [StringLength(150)]
        public string Eposta { get; set; }

        [Required]
        public string Sifre { get; set; } // BCrypt ile hash'lenmiş şifre buraya gelir

        [Required(ErrorMessage = "TC Kimlik No zorunludur.")]
        [StringLength(11, MinimumLength = 11, ErrorMessage = "TC Kimlik No 11 hane olmalıdır.")]
        public string TCKimlikNo { get; set; }

        [Required]
        public string Rol { get; set; } = "User"; // Varsayılan olarak User atadık

        public DateTime OlusturulmaTarihi { get; set; } = DateTime.Now;
    }
}