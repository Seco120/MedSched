using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MedSched.Models
{
    [Table("Hastaneler")] // Veritabanındaki tablo adın "Hastaneler" ise bunu ekle kanka
    public class Hastane
    {
        [Key]
        public int HastaneId { get; set; }

        [Required(ErrorMessage = "Hastane adı boş bırakılamaz.")]
        [StringLength(200)]
        public string HastaneAdi { get; set; }

        // Navigation Property: Bu hastaneye bağlı bölümleri listelemek istersen lazım olur
        public virtual ICollection<Bolum>? Bolumler { get; set; }
    }
}