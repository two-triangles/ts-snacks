/*
  Warnings:

  - Added the required column `created_at` to the `Category` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_updated_at` to the `Category` table without a default value. This is not possible if the table is not empty.
  - Added the required column `created_at` to the `Snack` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_updated_at` to the `Snack` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Category" ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "last_updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Snack" ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "last_updated_at" TIMESTAMP(3) NOT NULL;

-- CreateTable
CREATE TABLE "VendingMachine" (
    "machine_id" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "last_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "VendingMachine_pkey" PRIMARY KEY ("machine_id")
);

-- CreateTable
CREATE TABLE "Stock" (
    "stock_id" TEXT NOT NULL,
    "machine_id" TEXT NOT NULL,
    "snack_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "last_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Stock_pkey" PRIMARY KEY ("stock_id")
);

-- AddForeignKey
ALTER TABLE "Stock" ADD CONSTRAINT "Stock_machine_id_fkey" FOREIGN KEY ("machine_id") REFERENCES "VendingMachine"("machine_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Stock" ADD CONSTRAINT "Stock_snack_id_fkey" FOREIGN KEY ("snack_id") REFERENCES "Snack"("snack_id") ON DELETE RESTRICT ON UPDATE CASCADE;
