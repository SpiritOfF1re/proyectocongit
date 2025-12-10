-- 1. Crear la base de datos (Si el proyecto se llama SpiritFire)
CREATE DATABASE IF NOT EXISTS spiritfire_db;

-- 2. Seleccionar la base de datos para usarla
USE spiritfire_db;

-- 3. Crear la tabla de usuarios
-- Necesitamos: ID único, nombre, correo (para el login) y contraseña.
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE, -- El email no se debe repetir
    password VARCHAR(255) NOT NULL,     -- 255 caracteres para guardar la contraseña encriptada luego
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. (Opcional) Insertar un usuario de prueba
-- OJO: En la vida real la contraseña "123456" debe estar encriptada, 
-- pero para probar la conexión básica sirve por ahora.
INSERT INTO usuarios (nombre_usuario, email, password) 
VALUES ('admin', 'admin@spiritfire.com', '123456');