import "dotenv/config";
import pg from "pg";

const { Pool } = pg;

// Deux modes de connexion :
//  - Production (Render + Supabase) : via DATABASE_URL + SSL obligatoire.
//  - Local : si DATABASE_URL est absent, `pg` lit automatiquement les
//    variables PGHOST / PGUSER / PGPASSWORD / PGDATABASE (sans SSL).
const connectionString = process.env.DATABASE_URL;

const pool = new Pool(
  connectionString
    ? { connectionString, ssl: { rejectUnauthorized: false } }
    : {} // fallback local : variables PG* classiques
);

// Un pool peut émettre une erreur sur un client inactif (coupure réseau, etc.)
// sans que ce soit fatal : on log au lieu de laisser le process crasher.
pool.on("error", (err) => {
  console.error("Erreur inattendue du pool PostgreSQL :", err.message);
});

export default pool;
