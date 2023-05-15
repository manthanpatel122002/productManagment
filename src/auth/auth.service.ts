import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { AuthDto } from './dto';
import * as argon from 'argon2';

@Injectable({})
export class AuthService {
  constructor(private prisma: PrismaService) {}
  async signup(dto: AuthDto) {
    //genrate the password
    const password = await argon.hash(dto.password);
    //sve the new user in db
    const userdata = await this.prisma.User.create({
      data: {
        email: dto.email,
        password: password,
        name: dto.name,
        UserRoles: {
          create: {
            roles: {
              create: {
                roles: 'admin',
              },
            },
          },
        },
      },
    });

    //return the saved user
    return userdata;
  }

  signin() {
    return { msg: 'i am signed in' };
  }
}
