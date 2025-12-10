const dotenv = require('dotenv');
dotenv.config();

const mysql = require('mysql2');

const conexion = mysql.createConnection({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'database',
});

module.exports = conexion;

// Prueba de conexion
conexion.connect(error => {
    if (error) {
        console.error('Error conectando a la base de datos: ', error.message);
        return;
    };
    console.log('Conexión exitosa a la base de datos');

    // Consulta de prueba
    conexion.query('SELECT NOW() AS fecha_actual', (error, results) => {
        if (error) {
            console.error('Error ejecutando la consulta', error.message);
        } else {
            console.log('Resultado de la consulta de prueba', results);
        };
        conexion.end();
    });
});