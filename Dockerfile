FROM node:alpine

WORKDIR /app

COPY . .

RUN npm install

ENTRYPOINT ['./jenkins/scripts/deliver.sh']
