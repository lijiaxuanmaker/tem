# Dockerfile (项目根目录)
FROM node:20-alpine

WORKDIR /app

# 安装 pnpm
RUN npm install -g pnpm

# 复制 package 文件
COPY package.json pnpm-lock.yaml ./

# 复制 patches（如果需要）
COPY patches ./patches/

# 安装依赖
RUN pnpm install

# 复制源代码
COPY . .

# 只构建 server（不构建前端）
WORKDIR /app/server
RUN pnpm build

# 暴露端口
EXPOSE 3000

# 启动
CMD ["node", "dist/main.js"]
