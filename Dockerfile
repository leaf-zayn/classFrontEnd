# 构建镜像
FROM node:lts-alpine as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build:prod
# 运行镜像
FROM nginx:stable-alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g","daemon off;"]