using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MedSched.Models
{
    [Table("Randevular")] // Veritabanı tablo adınla birebir eşleşmeli
    public class Randevular
    {
        [Key]
        public int RandevuId { get; set; }

        [Required]
        public int KullaniciId { get; set; }

        [Required]
        public int DoktorId { get; set; }

        [Required]
        public int HastaneId { get; set; }

        [Required]
        public int BolumId { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime SecilenTarih { get; set; }

        [Required]
        public TimeSpan SecilenSaat { get; set; } // Kesinlikle TimeSpan, saat hesaplamaları için en doğrusu!

        [Required]
        [StringLength(50)]
        public string Durum { get; set; } = "Dolu"; // Senin Controller "Dolu" kontrolü yapıyordu, varsayılanı ona göre güncelledik

        // --- Navigation Properties (Sorgu Performansı İçin Şart) ---

        [ForeignKey("KullaniciId")]
        public virtual Kullanici? Kullanici { get; set; }

        [ForeignKey("DoktorId")]
        public virtual Doktor? Doktor { get; set; }

        [ForeignKey("HastaneId")]
        public virtual Hastane? Hastane { get; set; }

        [ForeignKey("BolumId")]
        public virtual Bolum? Bolum { get; set; }
    }
}