import mysql from "mysql2/promise";
import dotenv from "dotenv";

dotenv.config();

const db = mysql.createPool({
	host: process.env.MYSQLHOST || "localhost",
	user: process.env.MYSQLUSER || 'root',
	password: process.env.MYSQLPASSWORD || "",
	database: process.env.MYSQLDATABASE || "DBMeta",
	port: process.env.MYSQLPORT || 3306,
});


export default db;
