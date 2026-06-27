const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// /health endpoint for Kubernetes probes
app.get('/health', (req, res) => {
    res.status(200).send('OK');
});

// Main Page with styled HTML
app.get('/', (req, res) => {
    res.send(`
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CloudScale Deployment</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #0f172a 0%, #1e1b4b 100%);
                color: #f8fafc;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .card {
                background: rgba(30, 41, 59, 0.7);
                border: 2px solid #3b82f6;
                border-radius: 16px;
                padding: 40px;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
                backdrop-filter: blur(10px);
                text-align: center;
                max-width: 500px;
                width: 90%;
            }
            h1 {
                color: #3b82f6;
                margin-bottom: 10px;
                font-size: 2.5rem;
                text-transform: uppercase;
                letter-spacing: 2px;
            }
            .status-badge {
                background-color: #10b981;
                color: white;
                padding: 6px 16px;
                border-radius: 50px;
                font-size: 0.9rem;
                display: inline-block;
                margin-bottom: 25px;
                font-weight: bold;
                box-shadow: 0 0 15px rgba(16, 185, 129, 0.4);
            }
            p {
                font-size: 1.2rem;
                line-height: 1.6;
                color: #cbd5e1;
                margin: 10px 0;
            }
            .team-list {
                margin-top: 15px;
                padding: 0;
                list-style: none;
            }
            .team-member {
                color: #f59e0b;
                font-weight: bold;
                font-size: 1.3rem;
                margin: 5px 0;
            }
        </style>
    </head>
    <body>
        <div class="card">
            <h1>CloudScale Project</h1>
            <div class="status-badge">● AKS Cluster Live</div>
            <p>Welcome to our successfully automated CI/CD project!</p>
            <p>Deployed with ❤️ by Engineers:</p>
            <ul class="team-list">
                <li class="team-member">Mohamed</li>
                <li class="team-member">Islam</li>
                <li class="team-member">Muez</li>
            </ul>
        </div>
    </body>
    </html>
    `);
});

app.listen(PORT, () => {
    console.log('Server is running on port ' + PORT);
});
