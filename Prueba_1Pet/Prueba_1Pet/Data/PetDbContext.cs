using Prueba_1Pet.Models;
using System.Collections.Generic;
using System.Reflection.Emit;
using Microsoft.EntityFrameworkCore;//importante

namespace Prueba_1Pet.Data
{
    public class PetDbContext:DbContext
    {
        public PetDbContext(DbContextOptions<PetDbContext> options) : base(options)
        {


        }
        public DbSet<Campania> Campanias { get; set; }
        public DbSet<Organizacion> Organizacions { get; set; }

        
    }
}
