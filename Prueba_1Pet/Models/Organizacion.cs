using Microsoft.AspNetCore;
using MongoDB.Bson;
using MongoDB.Driver;
using MongoDB.Bson.Serialization.Attributes;

namespace Prueba_1Pet.Models
{
    public class Organizacion
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string IdOrganizacion { get; set; }

        public string Nombre { get;set; }

        public string Descripcion { get; set; }

        public int Estado { get; set; }

        public DateTime FechaRegistro { get; set; }

        public DateTime FechaActualizacion { get; set; }


        public ICollection<Campania>? Campanias { get; set; }



    }
}


