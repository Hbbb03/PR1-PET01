using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;
using System.ComponentModel.DataAnnotations;

namespace Prueba_1Pet.Models
{
    public class Usuario
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string IdUsuario { get; set; }

        [Required(ErrorMessage = "El campo Nombre es requerido.")]
        [StringLength(100, ErrorMessage = "El campo Nombre no puede exceder los 100 caracteres.")]
        public string NombreUsuario { get; set; }

        [Required(ErrorMessage = "El campo Contraseña es requerido.")]
        [DataType(DataType.Password)]
        [StringLength(8, ErrorMessage = "La contraseña debe tener al menos 8 caracteres.", MinimumLength = 8)]
        public string Password { get; set; }

        [Required(ErrorMessage = "El campo Repetir contraseña es requerido.")]
        [DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "Las contraseñas no coinciden.")]
        public string RepetirPassword { get; set; }
    }
}
