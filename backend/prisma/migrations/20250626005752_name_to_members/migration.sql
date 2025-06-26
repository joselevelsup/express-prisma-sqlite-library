/*
  Warnings:

  - Added the required column `name` to the `Members` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Members" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "cardNumber" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "age" INTEGER NOT NULL
);
INSERT INTO "new_Members" ("age", "cardNumber", "email", "id") SELECT "age", "cardNumber", "email", "id" FROM "Members";
DROP TABLE "Members";
ALTER TABLE "new_Members" RENAME TO "Members";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
