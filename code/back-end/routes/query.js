const express = require('express');
const fs = require('fs');
const path = require('path');
const db = require('../db/connection');

const router = express.Router();

router.get('/query/:num', (req, res) => {
  let { num } = req.params;

  const queryFile = `q${num.toString().padStart(2, '0')}.sql`;
  const queryPath = path.join(__dirname, '../queries', queryFile);

  fs.readFile(queryPath, 'utf8', (err, sql) => {
    if (err) {
      console.error('Error reading SQL file:', err);
      return res.status(500).json({ error: 'Query not found or invalid' });
    }

    db.query(sql, (err, results) => {
      if (err) {
        console.error('Error executing SQL query:', err);
        return res.status(500).json({ error: 'Error executing SQL' });
      }

      res.json(results);
    });
  });
});

module.exports = router;