using System;
using System.ComponentModel.DataAnnotations;
using System.IO;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson.Serialization.IdGenerators;

namespace Prueba_1Pet.Models
{
    public class Campania
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string IdCampania { get; set; }

        [Required(ErrorMessage = "El campo Nombre es requerido.")]
        [StringLength(100, ErrorMessage = "El campo Nombre no puede exceder los 100 caracteres.")]
        public string Nombre { get; set; }

        [StringLength(500, ErrorMessage = "El campo Descripcion no puede exceder los 500 caracteres.")]
        public string Descripcion { get; set; }

        [Range(0, 1, ErrorMessage = "El campo Estado debe ser 0 o 1.")]
        public int Estado { get; set; }

        
        public byte[]? Imagen { get; set; } = null!;

        [Required(ErrorMessage = "La Organización es requerida.")]
        public string Organizacion { get; set; }

        [Display(Name = "Fecha de Registro")]
        [DataType(DataType.DateTime)]
        public DateTime FechaRegistro { get; set; }

        [Display(Name = "Fecha de Actualización")]
        [DataType(DataType.DateTime)]
        public DateTime FechaActualizacion { get; set; }
    }
}
