FROM node:lts-alpine

WORKDIR /app

COPY package.json /app/package.json

COPY . /app

COPY .env /app/.env

RUN npm install

RUN npm run build

FROM httpd:2.4-alpine

COPY --from=0 /app/dist /usr/local/apache2/htdocs

EXPOSE 80
