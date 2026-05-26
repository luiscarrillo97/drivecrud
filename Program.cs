var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "¡Hola Perú! desde la API 🇵🇪");

app.Run();
