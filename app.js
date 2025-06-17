const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  const now = new Date();
  res.send(`<h1>Today is ${now.toDateString()}</h1><h2>Time: ${now.toLocaleTimeString()}</h2>`);
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
