# Uptime Kuma official build from source

FROM node:18-alpine AS builder

WORKDIR /app

COPY . .

RUN npm install && npm run build

# Final Image
FROM node:18-alpine

WORKDIR /app

COPY --from=builder /app ./

EXPOSE 3001

CMD ["node", "server/server.js"]
