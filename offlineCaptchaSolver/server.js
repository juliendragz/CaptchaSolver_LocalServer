const express = require('express');
const fs = require('fs');
const { exec } = require('child_process');

const app = express();
const PORT = 3000;

// Exemple : http://localhost:3000/solve?host=filejoker.net
app.get('/solve', (req, res) => {
    const host = req.query.host;
    if (!host) {
        return res.status(400).send('Missing "host" query parameter');
    }

    const resultFile = '/share/result.txt';
    if (fs.existsSync(resultFile)) {
        fs.unlinkSync(resultFile);
    }

    const command = `node ./ocr.js ${host}`;
    exec(command, (err, stdout, stderr) => {
        if (err) {
            console.error('Erreur OCR:', stderr);
            return res.status(500).send('Erreur OCR');
        }

        fs.readFile(resultFile, 'utf8', (err, data) => {
            if (err) {
                console.error('Erreur lecture result.txt');
                return res.status(500).send('Erreur lecture résultat');
            }
            res.send(data.trim());
        });
    });
});

app.listen(PORT, () => {
    console.log(`CaptchaSolver GET API listening on port ${PORT}`);
});
