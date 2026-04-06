import express from "express";

import {douaaController as douaa} from "../controllers/index.controller.js";

const router = express.Router();


router.get("/douaa/:id", douaa.get);
router.get("/douaas", douaa.getAll);



export default router;