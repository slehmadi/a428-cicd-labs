FROM node:alpine

WORKDIR /app

COPY . .

RUN npm install

RUN ./jenkins/scripts/deliver.sh
