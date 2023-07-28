FROM node:alpine

WORKDIR /app

COPY . .

RUN npm install

RUN sh ./jenkins/scripts/deliver.sh

RUN sleep 3600

RUN sh ./jenkins/scripts/kill.sh
