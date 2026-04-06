import { client } from "../services/index.service.js";


const croyanceDatamapper = {
    get: async function (id) {
        const sql = `SELECT * FROM croyance WHERE id = $1`;
        const result = await client.query(sql, [id]);
        return result.rows[0];
    },
    getAll: async function () {
        const sql = `SELECT * FROM croyance`;
        const result = await client.query(sql);
        return result.rows;
    },
};

export default  croyanceDatamapper;