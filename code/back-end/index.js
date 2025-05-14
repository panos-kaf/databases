const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const path = require('path');

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use(cors({
  origin: '*',
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization'],
}));

// Register dynamic /query/:num route
const queryRouter = require('./routes/query');
app.use('/', queryRouter);

app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});