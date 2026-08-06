import 'dotenv/config';
import express from "express";
import cors from "cors";
import helmet from "helmet";
import rateLimit from "express-rate-limit";
import router from "./app/routes/index.router.js";
import { errorsHandler } from "./app/middlewares/index.middleware.js";
import logger from "morgan";
import fs from "fs";
import error404 from "./app/middlewares/error.404.js";

const app = express();

// Trust first proxy (Render, nginx, etc.) so rate-limiter uses real client IP
app.set('trust proxy', 1);

app.use(helmet());

const allowedOrigins = process.env.ALLOWED_ORIGINS
  ? process.env.ALLOWED_ORIGINS.split(',').map((o) => o.trim())
  : ['http://localhost:5173', 'http://localhost:3000'];

app.use(cors({
  origin: allowedOrigins,
  credentials: true,
}));

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 100,
  standardHeaders: true,
  legacyHeaders: false,
  message: { error: 'Too many requests, please try again later.' },
});

app.use(limiter);
app.use(express.json({ limit: '10kb' }));
app.use(express.urlencoded({ extended: true, limit: '10kb' }));
app.use(express.static("public"));

// Logs : en production (Render), stdout est capturé automatiquement.
// En local uniquement, on écrit aussi dans logs/access.log (dossier gitignoré,
// donc absent sur Render — il faut le créer avant d'y écrire).
if (process.env.NODE_ENV === 'production') {
  app.use(logger('combined'));
} else {
  app.use(logger('dev'));
  fs.mkdirSync('./logs', { recursive: true });
  app.use(
    logger('common', {
      stream: fs.createWriteStream('./logs/access.log', { flags: 'a' }),
    })
  );
}

app.get('/health', (_req, res) => res.json({ status: 'ok' }));

app.use('/api', router);
app.use(errorsHandler);
app.all("*", error404);

export default app;
