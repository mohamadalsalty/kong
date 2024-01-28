
COMPOSE = docker compose

all: up

# Target to start up the services
up:
	@$(COMPOSE) up -d

down:
	@$(COMPOSE) down

.PHONY: up down

