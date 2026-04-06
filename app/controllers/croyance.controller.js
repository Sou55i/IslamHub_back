import db from "../models/index.datamapper.js";
import { Error404 } from "../utils/errors/index.utils.js";

const croyanceController = {
    getAll: async function (request, response, next) {
        try {
            const croyances = await db.croyance.getAll();
            if (!croyances)
                return next(new Error404('No hadith found'));
            response.json(croyances);
        } catch (error) {
            error.type = "database";
            error.method = request.method;
            error.message = "Error in getting all hadiths";
            return next(error);

        }
    },
    get: async function (request, response, next) {
        const { id } = request.params;
        try {
            const croyance = await db.croyance.get(id);
            if (!croyance)
                return next(new Error404('Hadith not found'));
            response.json(croyance);
        } catch (error) {
            error.type = "database";
            error.method = request.method;
            error.message = "Error in getting hadith";
            return next(error);
        }
    },
    /*create: async function (request, response, next) {
        const { name } = request.body;
        try {
            const createdHadith = await db.hadith.create(hadith);
            response.status(201).json(createdHadith);
        } catch (error) {
            error.type = "database";
            error.method = request.method;
            error.message = "Error in creating hadith";
            return next(error);
        }
    },
    update: async function (request, response, next) {
        const { id } = request.params;
        const { name } = request.body;
        try {
            const updatedHadith = await db.hadith.update(id, hadith);
            response.json(updatedHadith);
        } catch (error) {
            error.type = "database";
            error.method = request.method;
            error.message = "Error in updating hadith";
            return next(error);
        }
     */
};

export default croyanceController;