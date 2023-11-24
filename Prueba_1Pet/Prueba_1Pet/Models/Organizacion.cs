using Microsoft.AspNetCore;
using MongoDB.Bson;
using MongoDB.Driver;
using MongoDB.Bson.Serialization.Attributes;
using System.ComponentModel.DataAnnotations;

namespace Prueba_1Pet.Models
{
    public class Organizacion
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string IdOrganizacion { get; set; }

        [Required(ErrorMessage = "El campo Nombre es requerido.")]
        [StringLength(100, ErrorMessage = "El campo Nombre no puede exceder los 100 caracteres.")]
        public string Nombre { get; set; }

        [StringLength(500, ErrorMessage = "El campo Descripcion no puede exceder los 500 caracteres.")]
        public string Descripcion { get; set; }

        [Range(0, 1, ErrorMessage = "El campo Estado debe ser 0 o 1.")]
        public int Estado { get; set; }

        [Display(Name = "Fecha de Registro")]
        [DataType(DataType.DateTime)]
        public DateTime FechaRegistro { get; set; }

        [Display(Name = "Fecha de Actualización")]
        [DataType(DataType.DateTime)]
        public DateTime FechaActualizacion { get; set; }

        public ICollection<Campania>? Campanias { get; set; }


    }
}


