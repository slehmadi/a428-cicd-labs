FROM node:alpine

WORKDIR /app

COPY . .

RUN npm install

ENTRYPOINT ['sh', './jenkins/scripts/deliver.sh &']
