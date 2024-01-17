FROM node:20-alpine as packages
WORKDIR /app
COPY package*.json .
RUN npm ci

FROM node:20-alpine as build
WORKDIR /app
COPY --from=packages /app .
COPY . .
RUN npm run build

FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80