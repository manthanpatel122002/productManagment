import { Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class PrismaService extends PrismaClient {
  User: any;
  constructor() {
    super({
      datasources: {
        db: {
          url: 'mysql://root:root@localhost:3306/product_managment',
        },
      },
    });
  }
}
