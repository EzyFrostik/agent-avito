dockerfile
FROM node:20-alpine
RUN npm install -g openclaw@latest
WORKDIR /app
CMD ["openclaw", "gateway", "start", "--port", "10000"]
