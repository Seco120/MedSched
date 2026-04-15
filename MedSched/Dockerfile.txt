# 1. Build aşaması
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Proje dosyasını kopyala ve restore et
COPY ["MedSched.csproj", "./"]
RUN dotnet restore "MedSched.csproj"

# Tüm dosyaları kopyala ve yayınla
COPY . .
RUN dotnet publish "MedSched.csproj" -c Release -o /app/publish /p:UseAppHost=false

# 2. Çalıştırma aşaması
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

# Render'ın portuna uyum sağlamak için
ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80

ENTRYPOINT ["dotnet", "MedSched.dll"]