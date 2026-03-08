FROM node:22-slim

# Устанавливаем Git и зависимости
RUN apt-get update && apt-get install -y git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Копируем package.json если есть
COPY package*.json ./

# Отключаем установку браузера (если не нужен)
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# Кешируем npm глобально
RUN npm config set cache /tmp/npm-cache --global

# Устанавливаем OpenClaw
RUN npm install -g openclaw@latest --no-audit --no-fund --loglevel=error

# Открываем порт
EXPOSE 8080

# Запускаем gateway
CMD ["node", "/usr/local/lib/node_modules/openclaw/dist/index.js", "gateway"]
