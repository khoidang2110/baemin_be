import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    // Create CPU load by performing complex calculations
// let result = 0;
// for (let i = 0; i < 1000000; i++) {
//   result += Math.pow(i, 2) * Math.sin(i);
// }

// Create memory load by allocating large arrays
// const memoryLoad: number[] = new Array(1000000).fill(0);
// for (let i = 0; i < memoryLoad.length; i++) {
//   memoryLoad[i] = Math.random();
// }     

return 'zero downtime deployment1 -v1.0 test  99 ';
  }
}