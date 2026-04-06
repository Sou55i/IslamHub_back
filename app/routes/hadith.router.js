import express from "express";

import {hadithController as hadith} from "../controllers/index.controller.js";

const router = express.Router();


router.get("/hadith/:id", hadith.get);
router.get("/hadiths", hadith.getAll);



export default router;