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

EXPOSE 80

# Environment Variables NewRelic
ENV CORECLR_ENABLE_PROFILING="1" \
    CORECLR_PROFILER="{36032161-FFC0-4B61-B559-F6C5D41BAE5A}" \
    CORECLR_NEWRELIC_HOME="/usr/local/newrelic-netcore20-agent" \
    CORECLR_PROFILER_PATH="/usr/local/newrelic-netcore20-agent/libNewRelicProfiler.so" \
    NEW_RELIC_LICENSE_KEY="eu01xx3fe6fa6b6a05c5424c0561906857a035a9" \
    NEW_RELIC_APP_NAME="DevopsTrain-GeopositionService"

RUN apt-get -y update \
    && apt-get -y install gnupg2 \
    && echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | tee /etc/apt/sources.list.d/newrelic.list \
    && curl https://download.newrelic.com/548C16BF.gpg | apt-key add - \
    && apt-get -y update \
    && apt-get -y install newrelic-netcore20-agent

COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "GeopositionService.dll"]