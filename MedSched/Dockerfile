FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Render'ın klasör yapısına göre yolu burası
COPY ["MedSched/MedSched.csproj", "MedSched/"]
RUN dotnet restore "MedSched/MedSched.csproj"

COPY . .
WORKDIR "/src/MedSched"
RUN dotnet publish "MedSched.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80

ENTRYPOINT ["dotnet", "MedSched.dll"]