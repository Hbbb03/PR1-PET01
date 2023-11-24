using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using MongoDB.Bson;
using MongoDB.Driver;
using Prueba_1Pet.Data;
using Prueba_1Pet.Models;
using System;

namespace Prueba_1Pet.Controllers
{
    public class CampaniaController : Controller
    {
        private readonly IMongoCollection<Campania> _campaniaCollection;

        public CampaniaController(IMongoDatabase database)
        {
            _campaniaCollection = database.GetCollection<Campania>("Campania");
        }

        public IActionResult Index()
        {
            var campanias = _campaniaCollection.Find(new BsonDocument()).ToList();
            return View(campanias);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(Campania campania, IFormFile imagenFile)
        {
            List<string> errorMessages = new List<string>();

            if (string.IsNullOrEmpty(campania.Nombre))
            {
                errorMessages.Add("El campo Nombre es requerido.");
            }
            else if (campania.Nombre.Length > 100)
            {
                errorMessages.Add("El campo Nombre no puede exceder los 100 caracteres.");
            }



            if (errorMessages.Count == 0)
            {
                campania.Estado = 1;
                campania.FechaActualizacion = DateTime.Now;
                campania.IdCampania = ObjectId.GenerateNewId().ToString();

                if (imagenFile != null && imagenFile.Length > 0)
                {
                    using (var memoryStream = new MemoryStream())
                    {
                        await imagenFile.CopyToAsync(memoryStream);
                        campania.Imagen = memoryStream.ToArray();
                    }
                }

                _campaniaCollection.InsertOne(campania);
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.ErrorMessages = errorMessages;
                return View(campania);
            }
        }


        public byte[] ObtenerClaveDeEncriptacion()
        {
            // Aquí se simula la generación de una clave de encriptación
            // En un escenario real, debes utilizar un método seguro para generar la clave
            // por ejemplo, utilizando la clase Rfc2898DeriveBytes o una biblioteca criptográfica confiable

            // Genera una clave de 32 bytes (256 bits) para AES
            using (var aes = new System.Security.Cryptography.AesCryptoServiceProvider())
            {
                aes.GenerateKey();
                return aes.Key;
            }
        }

        public byte[] ObtenerVectorDeInicializacion()
        {
            // Aquí se simula la generación de un vector de inicialización (IV)
            // En un escenario real, debes utilizar un método seguro para generar el IV

            // Genera un vector de inicialización de 16 bytes (128 bits) para AES
            using (var aes = new System.Security.Cryptography.AesCryptoServiceProvider())
            {
                aes.GenerateIV();
                return aes.IV;
            }
        }


        public IActionResult Edit(string id)
        {
            var campania = _campaniaCollection.Find(c => c.IdCampania == id).FirstOrDefault();
            if (campania == null)
            {
                return NotFound();
            }
            return View(campania);
        }

        [HttpPost]
        public IActionResult Edit(Campania campania)
        {
            _campaniaCollection.ReplaceOne(c => c.IdCampania == campania.IdCampania, campania);
            return RedirectToAction("Index");
        }

        public IActionResult Delete(string id)
        {
            var campania = _campaniaCollection.Find(c => c.IdCampania == id).FirstOrDefault();
            if (campania == null)
            {
                return NotFound();
            }
            return View(campania);
        }

        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(string id)
        {
            _campaniaCollection.DeleteOne(c => c.IdCampania == id);
            return RedirectToAction("Index");
        }
    }
}
