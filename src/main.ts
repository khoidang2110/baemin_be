// import { NestFactory } from '@nestjs/core';
// import { AppModule } from './app.module';
// import * as express from 'express'
// import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

// async function bootstrap() {
//   const app = await NestFactory.create(AppModule);

//   app.use(express.static("*"))
//   app.enableCors()
  
// //swagger
//  const config = new DocumentBuilder()
// .setTitle('Baemin')
// .build();
// const document = SwaggerModule.createDocument(app, config);
// SwaggerModule.setup("/swagger",app,document)

//   await app.listen(8083);
// }
// bootstrap();

import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import * as express from 'express';
import * as cors from 'cors';

//import rootRoutes from './src/routes/rootRoutes';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // Middleware
  app.use(express.json()); // Middleware để parse body string -> body json
  app.use(express.static(".")); // Middleware để xác định nơi lưu file (dùng để lấy hình hiển thị trên browser)
  
  // CORS
  const allowedOrigins = [
    'https://baemin-fe.vercel.app',
    'http://localhost:3000',
  
  ];

  const corsOptions = {
    origin: (origin, callback) => {
      if (allowedOrigins.includes(origin) || !origin) {
        callback(null, true);
      } else {
        callback(new Error('Not allowed by CORS'));
      }
    },
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization'],
    credentials: true,
  };

  app.use(cors(corsOptions)); // Sử dụng CORS với cấu hình



  // Swagger
  const config = new DocumentBuilder()
    .setTitle('Baemin')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup("/swagger", app, document);

  // Start server
  await app.listen(8083);
  console.log(`BE starting with port 8083`);
}

bootstrap();
