using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MedSched.Models
{
    [Table("RandevuSaatleri")]
    public class RandevuSaatleri
    {
        [Key]
        public int SaatId { get; set; }

        [Required] // Slot yönetimi yapıyorsak saatin kendisi genelde boş olmamalıdır
        public TimeSpan RandevuSaati { get; set; }

        // Tarih tablosuyla ilişki
        [Required]
        public int TarihId { get; set; }

        [ForeignKey("TarihId")]
        public virtual RandevuTarihleri? RandevuTarihi { get; set; }

        // Doktor ile ilişki
        public int? DoktorId { get; set; }

        [ForeignKey("DoktorId")]
        public virtual Doktor? Doktor { get; set; }

        // Opsiyonel: Bu saatin doluluk durumunu burada da tutmak istersen:
        // public bool IsFull { get; set; } = false;
    }
}