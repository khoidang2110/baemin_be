# B1: Build môi trường Node.js
FROM node:20

# B2: Tạo folder BE
WORKDIR /root/app

# B3: Copy file package.json và yarn.lock
COPY package*.json .

# B4: Cài đặt các dependency bằng Yarn
RUN yarn install

RUN yarn prisma generate --schema src/prisma/schema.prisma

# B3.2: Copy source code vào trong image
COPY . .


RUN yarn run build
# B5: Expose port cho bên ngoài kết nối tới
EXPOSE 8083

# B6: Start server trong image
CMD ["yarn", "dist/src/main"]
