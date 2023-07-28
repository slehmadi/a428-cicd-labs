FROM node:alpine

WORKDIR /app

COPY . .

RUN npm install

CMD ['./jenkins/scripts/deliver.sh']
