# Nginx forward proxy with self-signed SSL certificate

## Environment variables

`HTTPPORT`: Serve HTTP on this port, default `80`
`HTTPSPORT`: Serve HTTPS on this port, default `443`
`DOMAINNAME`: Public name of the server, default `localhost`
`BACKENDS`: List of proxied backends in the form `LOCATION-1|BACKEND-1 ... LOCATION-N|BACKEND-N`
