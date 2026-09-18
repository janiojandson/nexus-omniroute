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

EXPOSE 20128

ENV PORT=20128
ENV HOST=0.0.0.0
ENV NODE_ENV=production

CMD ["omniroute", "--port", "20128", "--host", "0.0.0.0"]
