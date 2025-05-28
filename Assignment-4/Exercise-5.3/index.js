const express = require('express');
const { runQuery } = require('./database');

const app = express();
const port = 3000;

const getUsernameAndFareById = async (uid) => {
    const sql = 'select users.name as username, sum(round(types.fare_rate * trains.distance / (1000 * 100)) * 100) as fare ' +
                 'from tickets inner join users on tickets.user = users.id and users.id = ? ' +
                 'inner join trains on tickets.train = trains.id ' +
                 'inner join types on trains.type = types.id group by users.id ';
    const results = await runQuery(sql, [uid]);
    return results;
}

const getTrainStatusById = async (tid) => {
    const sql = 'select cast(types.max_seats as int) = count(tickets.id) as is_soldout ' +
                'from tickets inner join trains on tickets.train = trains.id and trains.id = ? ' +
                'inner join types on trains.type = types.id';
    const results = await runQuery(sql, [tid]);
    return results;
}

app.use(express.urlencoded({ extended: true }));

app.get('/fare', async(req, res) => {
    const { uid } = req.query;
    const results = await getUsernameAndFareById(uid);
    results.forEach(result => {
        const { username, fare } = result;
        res.send(`Total fare of ${username} is ${fare} KRW.`);
    });
});

app.get('/train/status', async(req, res) => {
    const { tid } = req.query;
    const results = await getTrainStatusById(tid);
    results.forEach(result => {
        const { is_soldout } = result;
        if (is_soldout) {
            res.send(`Train ${tid} is sold out`);
        } else {
            res.send(`Train ${tid} is not sold out`);
        }
    });
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));