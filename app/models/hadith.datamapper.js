import { client } from "../services/index.service.js";


const hadithDatamapper = {
    get: async function (id) {
        const sql = `SELECT * FROM hadith WHERE id = $1`;
        const result = await client.query(sql, [id]);
        return result.rows[0];
    },
    getAll: async function () {
        const sql = `SELECT * FROM hadith`;
        const result = await client.query(sql);
        return result.rows;
    },
};

export default  hadithDatamapper;