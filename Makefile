# Define default compose files
COMPOSE_FILES = -f docker-compose.core.yml \
                -f docker-compose.entertainment.yml \
                -f docker-compose.rss.yml \
                -f docker-compose.git.yml \
								-f docker-compose.arcanews.yml

# 🟢 Start all services
up:
	docker compose $(COMPOSE_FILES) up -d

# 🔴 Stop and remove all containers, networks, volumes
down:
	docker compose $(COMPOSE_FILES) down

# 📜 Tail logs for all services
logs:
	docker compose $(COMPOSE_FILES) logs -f

# 🔁 Restart all containers
restart:
	docker compose $(COMPOSE_FILES) restart

# 🧩 Start individual stacks
up-core:
	docker compose -f docker-compose.core.yml up -d

up-entertainment:
	docker compose -f docker-compose.entertainment.yml up -d

up-rss:
	docker compose -f docker-compose.rss.yml up -d

up-git:
	docker compose -f docker-compose.git.yml up -d

# 🧹 Clean up everything (containers, networks, volumes, images)
clean:
	docker compose $(COMPOSE_FILES) down --volumes --remove-orphans

# 🧪 Check running services
ps:
	docker compose $(COMPOSE_FILES) ps
