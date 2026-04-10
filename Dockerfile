FROM node:20-alpine

WORKDIR /app

# 安装 pnpm 和 nest cli
RUN npm install -g pnpm @nestjs/cli

# 复制 package 文件
COPY package.json pnpm-lock.yaml ./

# 复制 patches 文件夹
COPY patches ./patches/

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
