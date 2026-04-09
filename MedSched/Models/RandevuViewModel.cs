using System;
using System.Collections.Generic;

namespace MedSched.Models
{
    public class RandevuViewModel
    {
        // --- Seçilen Değerler (POST anında dolacak olanlar) ---
        public int HastaneId { get; set; }
        public int BolumId { get; set; }
        public int DoktorId { get; set; }
        public int TarihId { get; set; }

        // Kullanıcının seçtiği saat ID'leri (Çoklu seçim ihtimaline karşı List kalması mantıklı)
        public List<int> SecilenSaatler { get; set; } = new List<int>();

        // Oturumdan veya formdan gelen kullanıcı bilgileri
        public string AdSoyad { get; set; }
        public string TCKimlikNo { get; set; }

        // --- Listeler (Sayfa ilk açıldığında veya dropdown dolarken kullanılacaklar) ---
        public List<Hastane> Hastaneler { get; set; } = new List<Hastane>();
        public List<Bolum> Bolumler { get; set; } = new List<Bolum>();
        public List<Doktor> Doktorlar { get; set; } = new List<Doktor>();
        public List<RandevuTarihleri> Tarihler { get; set; } = new List<RandevuTarihleri>();
        public List<RandevuSaatleri> Saatler { get; set; } = new List<RandevuSaatleri>();
    }
}