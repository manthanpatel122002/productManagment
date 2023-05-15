/*
  Warnings:

  - Added the required column `roles` to the `Roles` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Roles` ADD COLUMN `roles` VARCHAR(191) NOT NULL;
