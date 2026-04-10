# server/Dockerfile
FROM node:20-alpine

WORKDIR /app

# 安装 pnpm
RUN npm install -g pnpm

# 安装 nest cli
RUN npm install -g @nestjs/cli

# 创建 patches 目录（避免 pnpm 报错）
RUN mkdir -p /app/patches

# 只复制 package.json
COPY package.json ./

# 安装依赖
RUN pnpm install

# 复制源代码
COPY . .

# 构建
RUN pnpm build

# 暴露端口
EXPOSE 3000

# 启动
CMD ["node", "dist/main.js"]
