import fs from 'fs';
import pool from './db.js'; // Asegúrate de que tu conexión esté bien configurada

const runSQLScript = async () => {
  try {
    const sql = fs.readFileSync('/models/setup.sql', 'utf-8');
    await pool.query(sql);
    console.log("🚀 Base de datos creada y datos insertados");
  } catch (error) {
    console.error("❌ Error ejecutando el script SQL:", error);
  } finally {
    process.exit();
  }
};

runSQLScript();
