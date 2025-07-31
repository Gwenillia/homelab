# 🏡 Gwenillia's Homelab

Self-hosted paradise powered by Docker Compose, clean structure, and a touch of elegance.  
This project includes DNS blocking, media automation, RSS reading, Git hosting, and more — all running on my private infrastructure.


## 🧱 Project Structure

```bash
.
├── core/                     # Core infrastructure services
│   ├── adguard/              # AdGuard Home for DNS blocking
│   ├── homepage/             # Dashboard for all services
│   └── tailscale/            # Secure mesh VPN
│
├── entertainment/            # Media stack
│   ├── radarr/               # Movies
│   ├── sonarr/               # Series
│   ├── bazarr/               # Subtitles
│   ├── prowlarr/             # Indexers
│   ├── jellyfin/             # Media server
│   ├── jellyseerr/           # Media request frontend
│   └── qbittorrent/          # For the community :) 
│
├── flux/                     # Miscellaneous services
│   └── miniflux/             # RSS reader
│
├── git/                      # Git service stack
│   ├── gitea/                # Gitea self-hosted Git service
│   └── gitea-db/             # MySQL or Postgres for Gitea
│
├── docker-compose.core.yml
├── docker-compose.entertainment.yml
├── docker-compose.rss.yml
├── docker-compose.git.yml
├── Makefile
├── .env.example
└── README.md
```

## 🚀 Quickstart
```bash
# 1. Clone the repo
git clone git@gwenillia.dev:Gwen/homelab.git
cd homelab

# 2. Copy the environment config
cp .env.example .env

# 3. Edit the .env file to fit your paths, secrets, and credentials
nano .env  # or use your favorite editor

# 4. Use the Makefile for control
make up         # Start all stacks
make down       # Stop all stacks
make logs       # View logs
make restart    # Restart everything
make clean      # Stop + remove containers, networks, volumes
make ps         # Check what's running

# Start individual groups
make up-core
make up-media
make up-rss
make up-git

# Optional: To launch a specific stack manually
docker compose -f docker-compose.core.yml up -d
docker compose -f docker-compose.entertainment.yml up -d
docker compose -f docker-compose.rss.yml up -d
docker compose -f docker-compose.git.yml up -d
```

## 💾 External Mounts
This setup assumes your media and downloads directories are outside the Git repo for cleanliness and performance:
```bash
# Recommended folder structure outside the homelab repo:
~/media/
~/downloads/
```
| Folder       | Host Path        | Purpose                   |
|--------------|------------------|---------------------------|
| `media/`     | `../media`       | Movies, series, books     |
| `downloads/` | `../downloads`   | Handled by qBittorrent    |

These folders are mounted into containers like jellyfin, radarr, sonarr, etc., via volumes in your Compose files.

## 🧩 Compose Files Overview
| File                         | Description                              |
|------------------------------|------------------------------------------|
| `docker-compose.core.yml`   | Core services: DNS, dashboard, VPN       |
| `docker-compose.entertainment.yml` | Media stack (arr + jellyfin)        |
| `docker-compose.rss.yml`    | RSS feed reader (Miniflux)               |
| `docker-compose.git.yml`    | Gitea + Database                          |
| `Makefile`                  | Different commands to handle everything |
| `.env.example`              | Template for your environment variables  |

## 🔐 Secrets & Configuration
Copy .env.example to .env and fill in:

## 👑 Author
Made with love, discipline, and docker magic by
Gwenillia

