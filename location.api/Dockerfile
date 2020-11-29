#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["location.api/location.api.csproj", "location.api/"]
COPY ["location.core/location.core.csproj", "location.core/"]
COPY ["location.entities/location.entities.csproj", "location.entities/"]
COPY ["location.data/location.data.csproj", "location.data/"]
RUN dotnet restore "location.api/location.api.csproj"
COPY . .
WORKDIR "/src/location.api"
RUN dotnet build "location.api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "location.api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "location.api.dll"]