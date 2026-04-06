import express from "express";

import {croyanceController as hadith} from "../controllers/index.controller.js";

const router = express.Router();


router.get("/croyance/:id", hadith.get);
router.get("/croyances", hadith.getAll);



export default router;