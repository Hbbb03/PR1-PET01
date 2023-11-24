using Microsoft.AspNetCore.Mvc;
using MongoDB.Bson;
using MongoDB.Driver;
using Prueba_1Pet.Models;

namespace Prueba_1Pet.Controllers
{
    public class UsuarioController : Controller
    {
        private readonly IMongoCollection<Usuario> _campaniaCollection;

        public UsuarioController(IMongoDatabase database)
        {
            _campaniaCollection = database.GetCollection<Usuario>("Usuario");
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
        public IActionResult Create(Usuario campania)
        {
            _campaniaCollection.InsertOne(campania);
            return RedirectToAction("Index");
        }

        public IActionResult Edit(string id)
        {
            var campania = _campaniaCollection.Find(c => c.IdUsuario == id).FirstOrDefault();
            if (campania == null)
            {
                return NotFound();
            }
            return View(campania);
        }

        [HttpPost]
        public IActionResult Index2(Usuario usuario)
        {
            // Aquí debes implementar la lógica de inicio de sesión
            // Comprueba el nombre de usuario y contraseña y realiza la autenticación.

            if (usuario.NombreUsuario == "nombre_de_usuario" && usuario.Password == "contraseña")
            {
                // Autenticación exitosa, redirige a la página de inicio de sesión ("Index2").
                return RedirectToAction("Index");
            }
            else
            {
                // Autenticación fallida, redirige nuevamente a la página de inicio de sesión.
                return RedirectToAction("Index2");
            }
        }



        [HttpPost]
        public IActionResult Edit(Usuario campania)
        {
            _campaniaCollection.ReplaceOne(c => c.IdUsuario == campania.IdUsuario, campania);
            return RedirectToAction("Index");
        }

        public IActionResult Delete(string id)
        {
            var campania = _campaniaCollection.Find(c => c.IdUsuario == id).FirstOrDefault();
            if (campania == null)
            {
                return NotFound();
            }
            return View(campania);
        }

        [HttpPost, ActionName("Delete")]
        public IActionResult DeleteConfirmed(string id)
        {
            _campaniaCollection.DeleteOne(c => c.IdUsuario == id);
            return RedirectToAction("Index");
        }
    }
}

