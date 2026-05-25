# Etapa de compilación usando el SDK de .NET 10
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build-env
WORKDIR /app

# Copiar csproj y restaurar dependencias
COPY *.csproj ./
RUN dotnet restore

# Copiar el resto de los archivos y compilar
COPY . ./
RUN dotnet publish -c Release -o out

# Etapa de ejecución usando el entorno de ASP.NET 10
FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app
COPY --from=build-env /app/out .

# Exponer el puerto que usa Cloud Run
EXPOSE 8080

ENTRYPOINT ["dotnet", "CRUDDRIVE.dll"]