namespace MedSched.Models
{
    public class ErrorViewModel
    {
        // Hata takibi için benzersiz ID
        public string? RequestId { get; set; }

        // ID varsa gösterilsin mi kontrolü
        public bool ShowRequestId => !string.IsNullOrEmpty(RequestId);

        // Ýleride hata mesajýný kullanýcýya göstermek istersen bunu da ekleyebilirsin:
        // public string? ErrorMessage { get; set; }
    }
}