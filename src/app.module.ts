import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
//import { PrismaModule } from './prisma/prisma.module';

// import { AuthModule } from './auth/auth.module';
// import { OrdersModule } from './orders/orders.module';
import { ProductModule } from './product/product.module';
import { AuthModule } from './auth/auth.module';
import { JwtModule } from '@nestjs/jwt';


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
  controllers: [],
  providers: [],
})
export class AppModule { }
