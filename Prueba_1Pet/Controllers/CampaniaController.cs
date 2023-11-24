using Microsoft.AspNetCore.Mvc;
using MongoDB.Bson;
using MongoDB.Driver;
using Prueba_1Pet.Models;

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
    public IActionResult Create(Campania campania)
    {
        _campaniaCollection.InsertOne(campania);
        return RedirectToAction("Index");
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
