import { client } from "../services/index.service.js";


const douaaDatamapper = {
    get: async function (id) {
        const sql = `SELECT * FROM douaa WHERE id = $1`;
        const result = await client.query(sql, [id]);
        return result.rows[0];
    },
    getAll: async function () {
        const sql = `SELECT * FROM douaa`;
        const result = await client.query(sql);
        return result.rows;
    },
};

export default  douaaDatamapper;