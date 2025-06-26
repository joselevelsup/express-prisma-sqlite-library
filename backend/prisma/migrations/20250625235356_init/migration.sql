-- CreateTable
CREATE TABLE "Books" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "author" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "barcode" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Members" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "cardNumber" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "age" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "BookDetails" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "yearBookWritten" INTEGER NOT NULL,
    "genre" TEXT NOT NULL,
    "pageCount" INTEGER NOT NULL,
    "bookId" INTEGER NOT NULL,
    CONSTRAINT "BookDetails_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES "Books" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Checkouts" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "bookId" INTEGER NOT NULL,
    "memberId" INTEGER NOT NULL,
    "dateCheckedOut" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "Checkouts_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES "Books" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Checkouts_memberId_fkey" FOREIGN KEY ("memberId") REFERENCES "Members" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "BookDetails_bookId_key" ON "BookDetails"("bookId");
