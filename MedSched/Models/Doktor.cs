using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MedSched.Models
{
    [Table("Doktorlar")] // Veritabanındaki tablo adın "Doktorlar" ise bunu ekle kanka
    public class Doktor
    {
        [Key]
        public int DoktorId { get; set; }

        [Required(ErrorMessage = "Doktor adı boş bırakılamaz.")]
        [StringLength(100)]
        public string DoktorAdi { get; set; }

        // Bölüm ile ilişkiyi kuruyoruz
        [Required]
        public int BolumId { get; set; }

        // Navigation Property: Sorgularda d.Bolum.BolumAdi diyebilmek için
        [ForeignKey("BolumId")]
        public virtual Bolum? Bolum { get; set; }
    }
}