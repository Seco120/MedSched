using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MedSched.Models
{
    [Table("Bolumler")] // Eğer veritabanında tablo adın "Bolumler" ise bunu ekle kanka
    public class Bolum
    {
        [Key]
        public int BolumId { get; set; }

        [Required]
        [StringLength(100)]
        public string BolumAdi { get; set; }

        // İlişkiyi EF'e açıkça belirtiyoruz
        public int HastaneId { get; set; }

        [ForeignKey("HastaneId")]
        public virtual Hastane? Hastane { get; set; }
    }
}