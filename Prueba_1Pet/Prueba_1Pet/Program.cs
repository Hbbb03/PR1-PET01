using MongoDB.Driver;
using Microsoft.Extensions.Options;
using Prueba_1Pet.ConeccionMongodb;
using Prueba_1Pet.Data;
using System.Configuration;

var builder = WebApplication.CreateBuilder(args);


// Configura la conexión a MongoDB en el método Main
var configuration = new ConfigurationBuilder()
    .AddJsonFile("appsettings.json")
    .Build();

// Configura MongoDBSettings a partir de appsettings.json
var mongoDbSettings = new MongoDBSettings();
configuration.GetSection("ConnectionStrings").Bind(mongoDbSettings);

// Registra el cliente de MongoDB
builder.Services.AddSingleton<IMongoClient>(sp =>
{
    return new MongoClient(mongoDbSettings.ConnectionStrings);
});


// Registra el contexto de MongoDB
builder.Services.AddScoped<IMongoDatabase>(sp =>
{
    var client = sp.GetRequiredService<IMongoClient>();
    return client.GetDatabase("PetDb");
});




// Add services to the container.
builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
