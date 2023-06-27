/*
  Warnings:

  - The primary key for the `Category` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `category_id` column on the `Category` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `Snack` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `snack_id` column on the `Snack` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `snack_id` on the `SnackCategory` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `category_id` on the `SnackCategory` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- DropForeignKey
ALTER TABLE "Category" DROP CONSTRAINT "Category_category_id_fkey";

-- DropForeignKey
ALTER TABLE "Snack" DROP CONSTRAINT "Snack_snack_id_fkey";

-- AlterTable
ALTER TABLE "Category" DROP CONSTRAINT "Category_pkey",
DROP COLUMN "category_id",
ADD COLUMN     "category_id" SERIAL NOT NULL,
ADD CONSTRAINT "Category_pkey" PRIMARY KEY ("category_id");

-- AlterTable
ALTER TABLE "Snack" DROP CONSTRAINT "Snack_pkey",
DROP COLUMN "snack_id",
ADD COLUMN     "snack_id" SERIAL NOT NULL,
ADD CONSTRAINT "Snack_pkey" PRIMARY KEY ("snack_id");

-- AlterTable
ALTER TABLE "SnackCategory" DROP COLUMN "snack_id",
ADD COLUMN     "snack_id" INTEGER NOT NULL,
DROP COLUMN "category_id",
ADD COLUMN     "category_id" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "SnackCategory_snack_id_key" ON "SnackCategory"("snack_id");

-- CreateIndex
CREATE UNIQUE INDEX "SnackCategory_category_id_key" ON "SnackCategory"("category_id");

-- AddForeignKey
ALTER TABLE "Snack" ADD CONSTRAINT "Snack_snack_id_fkey" FOREIGN KEY ("snack_id") REFERENCES "SnackCategory"("snack_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Category" ADD CONSTRAINT "Category_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "SnackCategory"("category_id") ON DELETE RESTRICT ON UPDATE CASCADE;
