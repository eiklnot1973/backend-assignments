const express = require('express');
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true }));

app.get('/factorial', (req, res) => {
    const { number } = req.query;
    res.redirect(`/factorial/${number}`);
});
app.get('/factorial/:number', (req, res) => {
    const number = parseInt(req.params.number, 10);
    let product = 1;
    for (let i = 1; i <= number; i++) {
        product *= i;
    }
    res.send(`${product}`);
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));