FROM node:latest AS build
WORKDIR /app
COPY / ./
COPY package*.json ./

RUN npm install -g @angular/cli && \
  npm install && \
  ng build

COPY . .

FROM nginx:latest
WORKDIR /app
COPY --from=build /app/dist/profit.web /usr/share/nginx/html
