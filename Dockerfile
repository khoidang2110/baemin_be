# B1: Build môi trường Node.js
FROM node:20

# B2: Tạo folder BE
WORKDIR /app

COPY package*.json ./



RUN yarn install


COPY . .

RUN yarn prisma generate --schema src/prisma/schema.prisma

# RUN yarn run build

EXPOSE 8083

#CMD ["node", "dist/main"]

CMD ["yarn","run", "start"]