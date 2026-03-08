FROM node:20-slim

WORKDIR /app

# Установка OpenClaw
RUN npm install -g openclaw@latest

# Открываем порт
EXPOSE 8080

# Запускаем gateway
CMD ["node", "/usr/local/lib/node_modules/openclaw/dist/index.js", "gateway"]
