# syntax=docker/dockerfile:1
FROM node:16.16.0-alpine3.16 as build

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm ci --production

COPY . .

RUN npm run build

# NGINX Web Server
FROM nginx:1.22.0 as prod

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]