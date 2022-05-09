FROM node:alpine AS build
WORKDIR /app
COPY . .
RUN npm ci && npm run build

FROM nginx:alpine
COPY /dist /usr/share/nginx/html
EXPOSE 80
