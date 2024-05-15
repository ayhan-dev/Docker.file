# Normal:
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /build
COPY *.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish --no-restore -o app
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /build/app .
ENTRYPOINT ["./aspnetapp"]


# Alpine
FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS build
WORKDIR /build
COPY *.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish --no-restore -o app
FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
WORKDIR /app
COPY --from=build /build/app .
ENTRYPOINT ["./aspnetapp"]
