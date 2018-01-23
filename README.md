# Geoposition Microservice

Simple REST microservice that returns the geoposition of a vehicle identified by its VIN.

## Usage

URL: `/api/geoposition/{VIN}`

The length of the provided VIN must be either 7 or 17, otherwise an exception is thrown by the application.

## Data

All data returned are dummy data. There is no database involved.
