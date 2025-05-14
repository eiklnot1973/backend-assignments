const express = require('express');
const app = express();
const port = 3000;

app.set('views', `${__dirname}/views`);
app.set('view engine', 'pug');

app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => res.render('index.pug'));

app.post('/login', (req, res) => res.send(`username: ${req.body.username}\npassword: ${req.body.password}</h1>`));

app.listen(port, () => console.log(`Server listening on port ${port}!`));