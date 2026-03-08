FROM node:20-slim

# Устанавливаем Git и зависимости
RUN apt-get update && apt-get install -y git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Копируем package.json если есть
COPY package*.json ./

# Устанавливаем OpenClaw (первая попытка может упасть, но npm потом доустановит)
RUN npm install -g openclaw@latest || true

# Повторяем установку — после первой неудачной npm должен подхватить registry-версию [citation:1]
RUN npm install -g openclaw@latest

# Открываем порт
EXPOSE 8080

# Запускаем gateway
CMD ["node", "/usr/local/lib/node_modules/openclaw/dist/index.js", "gateway"]
