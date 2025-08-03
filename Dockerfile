FROM node:22-alpine

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json
COPY package*.json ./

# 安装依赖
RUN npm install

# 复制项目文件
COPY . .

# 构建项目（如有需要，可根据实际情况修改）
# RUN npm run build

# 暴露端口（如你的应用监听3000端口，可修改为实际端口）
EXPOSE 5173

# 启动应用
CMD ["npm", "run", "dev"]