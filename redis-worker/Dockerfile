FROM node:alpine

WORKDIR "/app"

COPY ./package.json ./

RUN apk add yarn && yarn && yarn cache clean

COPY . .

CMD ["yarn", "start"]