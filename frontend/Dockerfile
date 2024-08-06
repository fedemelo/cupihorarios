FROM node:lts-alpine

WORKDIR /app

COPY package.json /app/package.json

COPY . /app

RUN yarn install

RUN yarn build

FROM httpd:2.4-alpine

COPY --from=0 /app/dist /usr/local/apache2/htdocs

EXPOSE 80
