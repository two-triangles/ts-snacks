/*
  Warnings:

  - You are about to drop the `SnackCategory` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `category_id` to the `Snack` table without a default value. This is not possible if the table is not empty.
  - Added the required column `price` to the `Snack` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Category" DROP CONSTRAINT "Category_category_id_fkey";

-- DropForeignKey
ALTER TABLE "Snack" DROP CONSTRAINT "Snack_snack_id_fkey";

-- AlterTable
ALTER TABLE "Snack" ADD COLUMN     "category_id" INTEGER NOT NULL,
ADD COLUMN     "price" INTEGER NOT NULL;

-- DropTable
DROP TABLE "SnackCategory";

-- AddForeignKey
ALTER TABLE "Snack" ADD CONSTRAINT "Snack_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "Category"("category_id") ON DELETE RESTRICT ON UPDATE CASCADE;
