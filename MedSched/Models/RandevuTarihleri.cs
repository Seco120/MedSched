using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MedSched.Models
{
    [Table("RandevuTarihleri")]
    public class RandevuTarihleri
    {
        [Key]
        public int TarihId { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public DateTime RandevuTarihi { get; set; }

        // Navigation Property: Bu tarihe bağlı saatleri (slotları) getirmek için
        public virtual ICollection<RandevuSaatleri>? Saatler { get; set; }
    }
}