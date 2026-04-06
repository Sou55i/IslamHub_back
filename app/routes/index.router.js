import hadithRouter  from "./hadith.router.js";
import croyanceRouter from "./croyance.router.js";
import dhikrRouter from "./dhikr.router.js";
import douaaRouter from "./douaa.router.js";
import express from "express";

const router = express.Router();

router.use(hadithRouter);
router.use(croyanceRouter);
router.use(dhikrRouter);
router.use(douaaRouter);



export default router;