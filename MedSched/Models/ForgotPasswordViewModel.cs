using System.ComponentModel.DataAnnotations;

namespace MedSched.Models
{
    public class ForgotPasswordViewModel
    {
        [Required(ErrorMessage = "Lütfen kayıtlı e-posta adresinizi giriniz.")]
        [EmailAddress(ErrorMessage = "Geçerli bir e-posta adresi girdiğinizden emin olun.")]
        [Display(Name = "E-Posta Adresi")]
        public string Email { get; set; }
    }
}