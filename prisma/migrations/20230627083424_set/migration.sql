-- CreateTable
CREATE TABLE "Snack" (
    "snack_id" TEXT NOT NULL,
    "snack_name" TEXT NOT NULL,
    "flavour_text" TEXT NOT NULL,

    CONSTRAINT "Snack_pkey" PRIMARY KEY ("snack_id")
);

-- CreateTable
CREATE TABLE "Category" (
    "category_id" TEXT NOT NULL,
    "category_name" TEXT NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("category_id")
);

-- CreateTable
CREATE TABLE "SnackCategory" (
    "snack_id" TEXT NOT NULL,
    "category_id" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "SnackCategory_snack_id_key" ON "SnackCategory"("snack_id");

-- CreateIndex
CREATE UNIQUE INDEX "SnackCategory_category_id_key" ON "SnackCategory"("category_id");

-- AddForeignKey
ALTER TABLE "Snack" ADD CONSTRAINT "Snack_snack_id_fkey" FOREIGN KEY ("snack_id") REFERENCES "SnackCategory"("snack_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Category" ADD CONSTRAINT "Category_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "SnackCategory"("category_id") ON DELETE RESTRICT ON UPDATE CASCADE;
