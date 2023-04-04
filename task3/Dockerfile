FROM node:16-alpine

WORKDIR /home/ilovedocker/app

#COPY hello.sh ./
COPY packages/package*.json ./
# Флаг --omit=dev означает - "не ставить devDependencies"
# они не нужны нам в продакшен-окружении
RUN npm i 
COPY ./src .

EXPOSE 3032

ENTRYPOINT [ "node", "main.js" ]