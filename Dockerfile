# B1: Build môi trường Node.js
FROM node:20

# B2: Tạo folder BE
WORKDIR /app

COPY package*.json ./

RUN yarn install

#COPY prisma ./prisma/


COPY . .

RUN yarn prisma generate

RUN yarn run build

EXPOSE 8096

CMD ["yarn", "run","start:prod"]

#CMD ["yarn","run", "start"]