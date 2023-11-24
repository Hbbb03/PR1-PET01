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

namespace Prueba_1Pet.Controllers
{
    public class OrganizacionController : Controller
    {
        private readonly IMongoCollection<Organizacion> _organizacionCollection;

        public OrganizacionController(IMongoDatabase database)
        {
            _organizacionCollection = database.GetCollection<Organizacion>("Organizacion");
        }

        public IActionResult Index()
        {
            var organizacion = _organizacionCollection.Find(new BsonDocument()).ToList();
            return View(organizacion);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Create(Organizacion organizacion)
        {
            _organizacionCollection.InsertOne(organizacion);
            return RedirectToAction("Index");
        }

        public IActionResult Edit(string id)
        {
            var organizacion = _organizacionCollection.Find(c => c.IdOrganizacion == id).FirstOrDefault();
            if (organizacion == null)
            {
                return NotFound();
            }
            return View(organizacion);
        }

        [HttpPost]
        public IActionResult Edit(Organizacion organizacion)
        {
            _organizacionCollection.ReplaceOne(c => c.IdOrganizacion == organizacion.IdOrganizacion, organizacion);
            return RedirectToAction("Index");
        }

        public IActionResult Delete(string id)
        {
            var organizacion = _organizacionCollection.Find(c => c.IdOrganizacion == id).FirstOrDefault();
            if (organizacion == null)
            {
                return NotFound();
            }
            return View(organizacion);
        }

        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(string id)
        {
            _organizacionCollection.DeleteOne(c => c.IdOrganizacion == id);
            return RedirectToAction("Index");
        }
    }
}
