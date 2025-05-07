const fs = require('fs');
const path = require('path');
const util = require('util');

const readdir = util.promisify(fs.readdir);
const stat = util.promisify(fs.stat);

const dirPath = './test';

const printJsFilenames = async fullDirPath => {
    try {
        let dirnames = [];
        const files = await readdir(fullDirPath);
        for (const file of files) {
            try {
                const fullPath = path.join(fullDirPath, file);
                const fileStat = await stat(fullPath);
                if (fileStat.isDirectory()) {
                    dirnames.push(fullPath);
                } else if (path.extname(file) === '.js') {
                    console.log(fullPath);
                }
            } catch (err) {
                console.error(err);
            }
        }
        for (const dirname of dirnames) {
            await printJsFilenames(dirname);
        }
    } catch (err) {
        console.error(err);
    }
};

printJsFilenames(dirPath);