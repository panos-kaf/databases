const express = require('express');
const dotenv = require('dotenv');
const fs = require('fs');
const path = require('path');
const http = require('http');
const db = require('./db/connection');

const cors = require('cors');

dotenv.config();
const app = express();

//const apiRouter = require('./api/query');

//const apirouter = require('./routes/query')

app.use(express.json());

app.use(cors({
  origin: '*', // Allow all origins
  methods: ['GET', 'POST', 'PUT', 'DELETE'], // Allow specific HTTP methods
  allowedHeaders: ['Content-Type', 'Authorization'], // Allow specific headers
}));

//app.use('/', apiRouter);
/*
app.use((err, req, res, next) => {
    console.error(err.stack);
    const statusCode = err.status || 500;
    const message = err.message || 'Internal Server Error';
    res.status(statusCode).json({ message });
});
*/
app.get('/q01', (req, res) => {
    const queryPath = path.join(__dirname, 'queries', 'q01.sql');
    
    fs.readFile(queryPath, 'utf8', (err, sql) => {
        if (err) {
        console.error('Error reading SQL file:', err);
        return res.status(500).json({ error: 'Internal server error' });
        }
    
        db.query(sql, (err, results) => {
        if (err) {
            console.error('Error executing SQL query:', err);
            return res.status(500).json({ error: 'Internal server error' });
        }
    
        res.json(results);
        });
    });
    });

app.get('/q02', (req, res) => {
  const queryPath = path.join(__dirname, 'queries', 'q02.sql');
  
  fs.readFile(queryPath, 'utf8', (err, sql) => {
    if (err) {
      console.error('Error reading SQL file:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    db.query(sql, (err, results) => {
      if (err) {
        console.error('Error executing SQL query:', err);
        return res.status(500).json({ error: 'Internal server error' });
      }

      res.json(results);
    });
  });
});

app.get('/q03', (req, res) => {
  const queryPath = path.join(__dirname, 'queries', 'q03.sql');
  
  fs.readFile(queryPath, 'utf8', (err, sql) => {
    if (err) {
      console.error('Error reading SQL file:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    db.query(sql, (err, results) => {
      if (err) {
        console.error('Error executing SQL query:', err);
        return res.status(500).json({ error: 'Internal server error' });
      }

      res.json(results);
    });
  });
}
);
app.get('/q04', (req, res) => {
  const queryPath = path.join(__dirname, 'queries', 'q04.sql');
  
  fs.readFile(queryPath, 'utf8', (err, sql) => {
    if (err) {
      console.error('Error reading SQL file:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    db.query(sql, (err, results) => {
      if (err) {
        console.error('Error executing SQL query:', err);
        return res.status(500).json({ error: 'Internal server error' });
      }

      res.json(results);
    });
  });
});
app.get('/q05', (req, res) => {
  const queryPath = path.join(__dirname, 'queries', 'q05.sql');
  
  fs.readFile(queryPath, 'utf8', (err, sql) => {
    if (err) {
      console.error('Error reading SQL file:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    db.query(sql, (err, results) => {
      if (err) {
        console.error('Error executing SQL query:', err);
        return res.status(500).json({ error: 'Internal server error' });
      }

      res.json(results);
    });
  });
});
app.get('/q06', (req, res) => {
  const queryPath = path.join(__dirname, 'queries', 'q06.sql');
  
  fs.readFile(queryPath, 'utf8', (err, sql) => {
    if (err) {
      console.error('Error reading SQL file:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    db.query(sql, (err, results) => {
      if (err) {
        console.error('Error executing SQL query:', err);
        return res.status(500).json({ error: 'Internal server error' });
      }

      res.json(results);
    });
  });
});
app.get('/q07', (req, res) => {
  const queryPath = path.join(__dirname, 'queries', 'q07.sql');
  
  fs.readFile(queryPath, 'utf8', (err, sql) => {
    if (err) {
      console.error('Error reading SQL file:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    db.query(sql, (err, results) => {
      if (err) {
        console.error('Error executing SQL query:', err);
        return res.status(500).json({ error: 'Internal server error' });
      }

      res.json(results);
    });
  });
});
app.get('/q08', (req, res) => {
  const queryPath = path.join(__dirname, 'queries', 'q08.sql');
  
  fs.readFile(queryPath, 'utf8', (err, sql) => {
    if (err) {
      console.error('Error reading SQL file:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    db.query(sql, (err, results) => {
      if (err) {
        console.error('Error executing SQL query:', err);
        return res.status(500).json({ error: 'Internal server error' });
      }

      res.json(results);
    });
  });
});
app.get('/q09', (req, res) => {
  const queryPath = path.join(__dirname, 'queries', 'q09.sql');
  
  fs.readFile(queryPath, 'utf8', (err, sql) => {
    if (err) {
      console.error('Error reading SQL file:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    db.query(sql, (err, results) => {
      if (err) {
        console.error('Error executing SQL query:', err);
        return res.status(500).json({ error: 'Internal server error' });
      }

      res.json(results);
    });
  });
});
app.get('/q10', (req, res) => {
  const queryPath = path.join(__dirname, 'queries', 'q10.sql');
  
  fs.readFile(queryPath, 'utf8', (err, sql) => {
    if (err) {
      console.error('Error reading SQL file:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    db.query(sql, (err, results) => {
      if (err) {
        console.error('Error executing SQL query:', err);
        return res.status(500).json({ error: 'Internal server error' });
      }

      res.json(results);
    });
  });
});
app.get('/q11', (req, res) => {
  const queryPath = path.join(__dirname, 'queries', 'q11.sql');
  
  fs.readFile(queryPath, 'utf8', (err, sql) => {
    if (err) {
      console.error('Error reading SQL file:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    db.query(sql, (err, results) => {
      if (err) {
        console.error('Error executing SQL query:', err);
        return res.status(500).json({ error: 'Internal server error' });
      }

      res.json(results);
    });
  });
});
app.get('/q12', (req, res) => {
  const queryPath = path.join(__dirname, 'queries', 'q12.sql');
  
  fs.readFile(queryPath, 'utf8', (err, sql) => {
    if (err) {
      console.error('Error reading SQL file:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    db.query(sql, (err, results) => {
      if (err) {
        console.error('Error executing SQL query:', err);
        return res.status(500).json({ error: 'Internal server error' });
      }

      res.json(results);
    });
  });
});
app.get('/q13', (req, res) => {
  const queryPath = path.join(__dirname, 'queries', 'q13.sql');
  
  fs.readFile(queryPath, 'utf8', (err, sql) => {
    if (err) {
      console.error('Error reading SQL file:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    db.query(sql, (err, results) => {
      if (err) {
        console.error('Error executing SQL query:', err);
        return res.status(500).json({ error: 'Internal server error' });
      }

      res.json(results);
    });
  });
});
app.get('/q14', (req, res) => {
  const queryPath = path.join(__dirname, 'queries', 'q14.sql');
  
  fs.readFile(queryPath, 'utf8', (err, sql) => {
    if (err) {
      console.error('Error reading SQL file:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    db.query(sql, (err, results) => {
      if (err) {
        console.error('Error executing SQL query:', err);
        return res.status(500).json({ error: 'Internal server error' });
      }

      res.json(results);
    });
  });
});
app.get('/q15', (req, res) => {
  const queryPath = path.join(__dirname, 'queries', 'q15.sql');
  
  fs.readFile(queryPath, 'utf8', (err, sql) => {
    if (err) {
      console.error('Error reading SQL file:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    db.query(sql, (err, results) => {
      if (err) {
        console.error('Error executing SQL query:', err);
        return res.status(500).json({ error: 'Internal server error' });
      }

      res.json(results);
    });
  });
});


const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});