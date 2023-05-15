/* eslint-disable prettier/prettier */
import { PrismaClient } from '@prisma/client';
import * as argon from 'argon2';

const prisma = new PrismaClient();
const Roles = prisma.roles;
async function main() {
  const createCategory = await prisma.user.create({
    data: {
      email: 'admin1@gmail.com',
      password: 'admin',
      name: 'admin',
      UserRoles: {
        create: {
          roles: {
            create: {
              roles: "admin"
            },
          }
        }
      }
    },
  });
}
main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
