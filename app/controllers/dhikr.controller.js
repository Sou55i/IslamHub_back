import db from "../models/index.datamapper.js";
import { Error404 } from "../utils/errors/index.utils.js";

const dhikrController = {
    getAll: async function (request, response, next) {
        try {
            const dhikrs = await db.dhikr.getAll();
            if (!dhikrs)
                return next(new Error404('No dhikr found'));
            response.json(dhikrs);
        } catch (error) {
            error.type = "database";
            error.method = request.method;
            error.message = "Error in getting all dhikrs";
            return next(error);

        }
    },
    get: async function (request, response, next) {
        const { id } = request.params;
        try {
            const dhikr = await db.dhikr.get(id);
            if (!dhikr)
                return next(new Error404('Dhikr not found'));
            response.json(dhikr);
        } catch (error) {
            error.type = "database";
            error.method = request.method;
            error.message = "Error in getting dhikr";
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

export default dhikrController;