# Review Session 06/25/2025

This repo contains a project for a Library checkout system. 
The backend is an express server with Prisma and SQLite. 
The frontend is an HTML/CSS/JS app using Vite (There is nothing really happening there)

In order to run the backend:
- Run `npm install` in the backend folder
- While in the backend folder:
  - Create a .env and have it point to your SQLite database
    - Use the `DATABASE_URL` key for Prisma
  - Migrate the database using `npx prisma migrate dev`
    - This will apply all the migrations we have created
    - This will also generate a new prisma client
  - Run `node server.js`