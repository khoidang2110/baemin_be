import { Body, Controller, Post ,Query,Res} from '@nestjs/common';
import { AuthService } from './auth.service';
import { ApiBody, ApiQuery } from '@nestjs/swagger';
import { CreateUserDto } from './dto/user.dto';
import loginDTO from './dto/login.dto';


@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}


  @Post('/login')

  @ApiBody({ schema: { 
    type: 'object', 
    properties: { 
      email: { type: 'string' },
      password: { type: 'string' }
    },
  }})
  login(@Body() body: { email: string, password: string }) {
    return this.authService.login(body.email, body.password);
  }
 

  @Post('/sign-up')
  @ApiBody({description:"thong tin dang ky",type:CreateUserDto})
  async signUp(@Body() body: CreateUserDto, @Res() response): Promise<any> {
    try {
      let data = await this.authService.signUp(body);
      response.status(data.status).json(data);
    } catch (error) {
      response.status(500).json({ status: 500, message: error.message });
    }
  }

  @Post('/get-user-info')
  @ApiQuery({ name: 'token', type: 'string', required: false, description: 'Token of the user' })
  async getUserInfo(@Query('token') token: string) {
    return this.authService.getUserInfo(token);
  } 
}
