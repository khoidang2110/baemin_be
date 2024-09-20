# B1: Build môi trường Node.js
FROM node:20

# B2: Tạo folder BE
WORKDIR /app

# B3: Copy file package.json và yarn.lock
COPY package.json yarn.lock ./

# B3.1: Copy folder prisma vào folder prisma trong image
# COPY prisma ./prisma/

# B3.2: Copy source code vào trong image
COPY . .

# B4: Cài đặt các dependency bằng Yarn
RUN yarn install

# B5: Expose port cho bên ngoài kết nối tới
EXPOSE 8080

# B6: Start server trong image
CMD ["yarn", "start:prod"]
