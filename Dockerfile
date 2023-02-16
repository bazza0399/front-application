#stage 1
FROM node:16.19.0-alpine3.17 as node
WORKDIR /app
COPY . .
# ENV NODE_OPTIONS=--openssl-legacy-provider
RUN npm install
RUN npm run build --prod
#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/crudtuto-Front /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf
EXPOSE 4200