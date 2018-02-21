# Geoposition Microservice

Simple REST microservice that returns the geoposition of a vehicle identified by its VIN.

## API

### Geoposition API

URL: `/api/geoposition/{VIN}`

The length of the provided VIN must be either 7 or 17, otherwise an exception is thrown by the application. Empty VIN is not allowed.

### Status API

Liveness: `/api/status/live`

Readiness: `/api/status/readiness`

## Data

All data returned are dummy data (no database involved).
