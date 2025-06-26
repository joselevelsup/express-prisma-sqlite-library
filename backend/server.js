const express = require("express");
const { PrismaClient } = require("./generated/prisma");

const prisma = new PrismaClient();

const app = express();

app.use(express.json());

app.get("/books", async function (req, res) {
  const books = await prisma.books.findMany({
    include: {
      bookDetail: true
    }
  })

  res.json({
    success: true,
    books
  })
})

app.post("/books", async function (req, res) {
  if (!req.body.name || !req.body.author || !req.body.barcode || !req.body.yearBookWritten || !req.body.genre || !req.body.pageCount) {
    res.status(400).json({
      message: "Missing some required fields"
    })
  }

  const newBook = await prisma.books.create({
    data: {
      name: req.body.name,
      author: req.body.author,
      barcode: req.body.barcode,
      bookDetail: {
        create: {
          yearBookWritten: req.body.yearBookWritten,
          genre: req.body.genre,
          pageCount: req.body.pageCount
        }
      }
    }
  })

  res.status(201).json({
    success: true,
    book: newBook
  });
})

app.get("/members", async function (req, res) {
  const members = await prisma.members.findMany();

  res.json({
    success: true,
    members
  })
})

app.post("/members", async function (req, res) {
  if(!req.body.cardNumber || !req.body.email || !req.body.age || !req.body.name){
    res.status(400).json({
      message: "Missing required fields"
    });
  }

  const newMember = await prisma.members.create({
    data: {
      cardNumber: req.body.cardNumber,
      email: req.body.email,
      age: req.body.age,
      name: req.body.name
    }
  }) 

  res.status(201).json({
    success: true,
    member: newMember
  })
})

app.get("/checkouts", async function (req, res) {
  const checkouts = await prisma.checkouts.findMany({
    include: {
      member: true,
      book: true
    }
  });

  res.json({
    success: true,
    checkouts
  })
})

app.post("/checkouts", async function (req, res) {
  if(!req.body.memberId || !req.body.bookId){
    res.status(400).json({
      message: "Missing required fields"
    })
  }

  const newCheckout = await prisma.checkouts.create({
    data: {
      memberId: req.body.memberId,
      bookId: req.body.bookId
    }
  });

  res.status(201).json({
    success: true,
    checkout: newCheckout
  });
})

app.listen(8080, function () {
  console.log("Server is listening on port 8080");
})