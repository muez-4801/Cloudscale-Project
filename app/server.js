const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
    res.send('<h1>Welcome to CloudScale! This project was developed by: Moaz, Islam, and Mohamed.</h1>');
});

app.get('/health', (req, res) => {
    res.status(200).json({ status: 'UP', timestamp: new Date() });
});

app.listen(PORT, () => {
    console.log(`Application is running on port ${PORT}`);
});