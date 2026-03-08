dockerfile
FROM node:20-slim

WORKDIR /app

# Установка OpenClaw
RUN npm install -g openclaw@latest

# Открываем порт
EXPOSE 8080

# ВАЖНО: запускаем именно gateway, иначе контейнер упадет [citation:5]
CMD ["node", "/usr/local/lib/node_modules/openclaw/dist/index.js", "gateway"]
