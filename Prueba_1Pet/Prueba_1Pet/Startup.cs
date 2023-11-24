using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;
using MongoDB.Driver;
using Prueba_1Pet.ConeccionMongodb;
using Prueba_1Pet.Data;

public class Startup
{
    public Startup(IConfiguration configuration)
    {
        Configuration = configuration;
    }

    public IConfiguration Configuration { get; }

    public void ConfigureServices(IServiceCollection services)
    {
        // Configuración de MongoDB
        services.Configure<MongoDBSettings>(Configuration.GetSection("ConnectionStrings"));
        services.AddSingleton<IMongoClient>(c =>
            new MongoClient(c.GetRequiredService<IOptions<MongoDBSettings>>().Value.ConnectionStrings));
        services.AddScoped<IMongoDatabase>(c => c.GetRequiredService<IMongoClient>().GetDatabase("PetDb"));

        // Resto de las configuraciones
        services.AddControllersWithViews();
    }

    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
        if (env.IsDevelopment())
        {
            app.UseDeveloperExceptionPage();
        }
        else
        {
            app.UseExceptionHandler("/Home/Error");
            app.UseHsts();
        }

        app.UseHttpsRedirection();
        app.UseStaticFiles();

        app.UseRouting();
        app.UseAuthorization();

        app.UseEndpoints(endpoints =>
        {
            endpoints.MapControllerRoute(
                name: "default",
                pattern: "{controller=Usuario}/{action=Index}/{id?}");
        });
    }
}
