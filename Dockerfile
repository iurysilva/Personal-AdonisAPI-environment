FROM node:lts-alpine

RUN mkdir -p /home/node/app

WORKDIR /home/node/app

COPY package.json package-lock.json

RUN apk add --no-cache git

COPY . /home/node/app/

RUN chown -R node:node /home/node

RUN npm ci

USER node

COPY . .

ENTRYPOINT ["node", "ace", "serve", "--watch"]