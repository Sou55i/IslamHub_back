import db from "../models/index.datamapper.js";
import { Error404 } from "../utils/errors/index.utils.js";

const douaaController = {
    getAll: async function (request, response, next) {
        try {
            const douaas = await db.douaa.getAll();
            if (!douaas)
                return next(new Error404('No douaa found'));
            response.json(douaas);
        } catch (error) {
            error.type = "database";
            error.method = request.method;
            error.message = "Error in getting all douaas";
            return next(error);

        }
    },
    get: async function (request, response, next) {
        const { id } = request.params;
        try {
            const douaa = await db.douaa.get(id);
            if (!douaa)
                return next(new Error404('Hadith not found'));
            response.json(douaa);
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

export default douaaController;