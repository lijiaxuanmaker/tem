FROM node:20-alpine

WORKDIR /app/server

RUN npm install -g pnpm

COPY server/package.json server/pnpm-lock.yaml ./
RUN pnpm install

COPY server/ ./
RUN pnpm build

CMD ["node", "dist/main.js"]
