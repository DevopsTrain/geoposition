FROM microsoft/aspnetcore-build:2.0 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM microsoft/aspnetcore:2.0
WORKDIR /app

# Environment Variables NewRelic
ENV CORECLR_ENABLE_PROFILING="1" \
    CORECLR_PROFILER="{36032161-FFC0-4B61-B559-F6C5D41BAE5A}" \
    CORECLR_NEWRELIC_HOME="/usr/local/newrelic-netcore20-agent" \
    CORECLR_PROFILER_PATH="/usr/local/newrelic-netcore20-agent/libNewRelicProfiler.so" \
    NEW_RELIC_LICENSE_KEY="e5f1d0919ddb0cbf6bd76f208239b91096350ddc" \
    NEW_RELIC_APP_NAME="DevopsTrain-GeopositionService"

RUN echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | sudo tee /etc/apt/sources.list.d/newrelic.list
RUN wget -O- https://download.newrelic.com/548C16BF.gpg | sudo apt-key add -
RUN sudo apt-get update
RUN sudo apt-get install newrelic-netcore20-agent

COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "GeopositionService.dll"]