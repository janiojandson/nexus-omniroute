FROM node:22-bookworm-slim

WORKDIR /app

# Instalar dependências nativas para compilação (python3, make, g++, sqlite)
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    make \
    g++ \
    build-essential \
    sqlite3 \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Instalar omniroute globalmente
RUN npm install -g omniroute --omit=dev

EXPOSE 8080
EXPOSE 20128

ENV PORT=8080
ENV NODE_ENV=production

# Usar 'omniroute serve' com as opcoes aceitas pelo CLI
CMD ["sh", "-c", "omniroute serve --port ${PORT:-8080} --no-open --no-tray --log"]
