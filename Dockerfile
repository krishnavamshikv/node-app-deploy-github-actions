FROM node:22-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY main.js .

EXPOSE 8080

CMD ["node" , "main"]

