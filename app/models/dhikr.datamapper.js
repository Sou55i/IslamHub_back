import { client } from "../services/index.service.js";


const dhikrDatamapper = {
    get: async function (id) {
        const sql = `SELECT * FROM dhikr WHERE id = $1`;
        const result = await client.query(sql, [id]);
        return result.rows[0];
    },
    getAll: async function () {
        const sql = `SELECT * FROM dhikr`;
        const result = await client.query(sql);
        return result.rows;
    },
};

export default  dhikrDatamapper;