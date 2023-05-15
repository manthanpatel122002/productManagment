/*
  Warnings:

  - You are about to drop the column `userId` on the `Roles` table. All the data in the column will be lost.
  - You are about to drop the `Permissions` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RolePermissions` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `RolePermissions` DROP FOREIGN KEY `RolePermissions_permissionId_fkey`;

-- DropForeignKey
ALTER TABLE `RolePermissions` DROP FOREIGN KEY `RolePermissions_roleId_fkey`;

-- DropForeignKey
ALTER TABLE `Roles` DROP FOREIGN KEY `Roles_userId_fkey`;

-- AlterTable
ALTER TABLE `Roles` DROP COLUMN `userId`;

-- DropTable
DROP TABLE `Permissions`;

-- DropTable
DROP TABLE `RolePermissions`;

-- CreateTable
CREATE TABLE `UserRoles` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `rolesId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `UserRoles` ADD CONSTRAINT `UserRoles_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserRoles` ADD CONSTRAINT `UserRoles_rolesId_fkey` FOREIGN KEY (`rolesId`) REFERENCES `Roles`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
