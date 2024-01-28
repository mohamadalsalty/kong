# Kong API Gateway with PostgreSQL and HTTPD

This repository contains a Docker Compose setup for running Kong API Gateway with a PostgreSQL database and a simple Apache HTTP server (httpd).

## Prerequisites

Before you begin, ensure you have installed:

- Docker
- Docker Compose

## Getting Started

To get started with this application, first clone the repository to your local machine

## Running the Application

Use the provided Makefile to manage the application.

To start all services, run:

```bash
make up
```

This will start the Kong API Gateway, PostgreSQL, and HTTPD services in the correct order. Once the services are up and running, you can access:

- Kong Admin API at: `http://localhost:8001`
- HTTPD server at: `http://localhost:8080`

To stop and remove the services, run:

```bash
make down
```

## Adding a Route in Kong

Once Kong is running, you can add a route to forward requests to the HTTPD server. Follow these steps:

1. First, add the HTTPD service to Kong:

    ```bash
   curl -i -X POST --url http://localhost:8001/services/ \
        --data 'name=httpd-service' \
        --data 'url=http://httpd:80'
    ```

2. Then, add a route to the HTTPD service:

    ```bash
   curl -i -X POST --url http://localhost:8001/services/httpd-service/routes \
        --data 'paths[]=/test'
    ```

Now, accessing `http://localhost:8000/test` in your browser will forward your request to the HTTPD server through Kong.

## Configuration

The Docker Compose and Makefile are configured to work together. You can edit the `docker-compose.yml` file for service configurations and the `Makefile` for custom commands.
