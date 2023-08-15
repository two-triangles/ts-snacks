/*
  Warnings:

  - The primary key for the `Snack` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE "Category" ALTER COLUMN "category_id" DROP DEFAULT;
DROP SEQUENCE "Category_category_id_seq";

-- AlterTable
ALTER TABLE "Snack" DROP CONSTRAINT "Snack_pkey",
ALTER COLUMN "snack_id" DROP DEFAULT,
ALTER COLUMN "snack_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Snack_pkey" PRIMARY KEY ("snack_id");
DROP SEQUENCE "Snack_snack_id_seq";
