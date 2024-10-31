## Builder
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /App
# Copy everything
COPY . ./
# Restore as distinct layers
RUN dotnet restore
# Build and publish a release
RUN dotnet publish -c Release -o out

## Tests
# FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-stretch-slim
# WORKDIR /App
# COPY --from=build-env /App/out .
# RUN dotnet test /tests/

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-stretch-slim
WORKDIR /App
COPY --from=build-env /App/out .
ENTRYPOINT ["dotnet", "aspnet-core-dotnet-core.dll"]