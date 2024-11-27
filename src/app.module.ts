import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
//import { PrismaModule } from './prisma/prisma.module';

// import { AuthModule } from './auth/auth.module';
// import { OrdersModule } from './orders/orders.module';
import { ProductModule } from './product/product.module';
import { AuthModule } from './auth/auth.module';
import { JwtModule } from '@nestjs/jwt';
import { AppController } from './app.controller';
import { AppService } from './app.service';


@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true
    }),
   
    
    ProductModule,
    
    AuthModule, JwtModule.register({
      global:true
    }
     
    )
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
