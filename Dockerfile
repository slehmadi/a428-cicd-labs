FROM node:alpine

WORKDIR /app

COPY . .

RUN npm install

RUN sh ./jenkins/scripts/deliver.sh
