
/* ----------------------creacion tablas----------------------*/



--tipo_vehiculo--
CREATE TABLE tipo_vehiculo(
    id_tipo_vehiculo INT AUTO_INCREMENT,
    nombre VARCHAR(25),
    PRIMARY KEY(id_tipo_vehiculo)
);



--colores--
CREATE TABLE colores(
    id_colores INT AUTO_INCREMENT,
    nombre VARCHAR(25),
    PRIMARY KEY(id_colores)
);



--marcas--
CREATE TABLE marcas(
    id_marcas INT AUTO_INCREMENT,
    nombre VARCHAR(45),
    PRIMARY KEY(id_marcas)
);



--usuarios--
CREATE TABLE usuarios(
    id_usuarios INT AUTO_INCREMENT,
    nombre VARCHAR(45),
    apellido VARCHAR(45),
    correo VARCHAR(45),
    genero VARCHAR(25),
    numero_documento VARCHAR(25),
    PRIMARY KEY(id_usuarios),
    tipo_documento_id INT
);



--tipo_documento--
CREATE TABLE tipo_documento(
    id_tipo_documento INT AUTO_INCREMENT,
    nombre VARCHAR(45),
    PRIMARY KEY(id_tipo_documento)
);



--vehiculo--
CREATE TABLE vehiculo(
    id_vehiculo INT AUTO_INCREMENT,
    modelo VARCHAR(25),
    placa VARCHAR(10),
    PRIMARY KEY(id_vehiculo),
    tipo_vehiculo_id INT, 
    colores_id INT,
    marcas_id INT,
    usuarios_id INT
);






/*----------------------llenar las tablas----------------------*/
--tipo_vehiculo--
INSERT INTO tipo_vehiculo(nombre) VALUES('carro');
INSERT INTO tipo_vehiculo(nombre) VALUES('moto');


--colores--
INSERT INTO colores(nombre) VALUES('gris');
INSERT INTO colores(nombre) VALUES('negro');


--marcas--
INSERT INTO marcas(nombre) VALUES('TOYOTA');
INSERT INTO marcas(nombre) VALUES('YAMAHA');


--usuarios--
INSERT INTO usuarios(nombre, apellido, correo, genero, numero_documento, tipo_documento_id) VALUES('Juan', 'Martinez', 'juanmartinez@gmail.com', 'masculino', '1290456789', '1');
INSERT INTO usuarios(nombre, apellido, correo, genero, numero_documento, tipo_documento_id) VALUES('Miuel', 'Tobon', 'migueltobon@gmail.com', 'masculino', '1567890345', '2');


--tipo_documento--
INSERT INTO tipo_documento(nombre) VALUES('cedula ciudadania');
INSERT INTO tipo_documento(nombre) VALUES('tarjeta de identidad');


--vehiculo--
INSERT INTO vehiculo(modelo, placa, tipo_vehiculo_id, colores_id, marcas_id, usuarios_id) VALUES('2018', 'HFI306', 1, 1, 1, 1);
INSERT INTO vehiculo(modelo, placa, tipo_vehiculo_id, colores_id, marcas_id, usuarios_id) VALUES('2015', 'RTX789', 2, 2, 2, 2);






/* ----------------------mostrar tablas---------------------- */

SHOW TABLES;

SELECT * FROM tipo_vehiculo;

SELECT * FROM colores;

SELECT * FROM marcas;

SELECT * FROM tipo_documento;

SELECT * FROM usuarios;

SELECT * FROM vehiculo;



SELECT vehiculo.placa, marcas.nombre, colores.nombre, tipo_vehiculo.nombre, usuarios.nombre
FROM vehiculo INNER JOIN marcas INNER JOIN colores INNER JOIN tipo_vehiculo INNER JOIN usuarios 
WHERE vehiculo.marcas_id = marcas.id_marcas AND vehiculo.colores_id = colores.id_colores AND vehiculo.tipo_vehiculo_id = tipo_vehiculo.id_tipo_vehiculo AND vehiculo.usuarios_id = usuarios.id_usuarios 

SELECT usuarios.numero_documento, tipo_documento.nombre
FROM usuarios INNER JOIN tipo_documento
WHERE usuarios.tipo_documento_id = tipo_documento.id_tipo_documento;

SELECT 





/* ----------------------conectar tablas---------------------- */
ALTER TABLE vehiculo ADD FOREIGN KEY(tipo_vehiculo_id) REFERENCES tipo_vehiculo(id_tipo_vehiculo);

ALTER TABLE vehiculo ADD FOREIGN KEY(colores_id) REFERENCES colores(id_colores);

ALTER TABLE vehiculo ADD FOREIGN KEY(marcas_id) REFERENCES marcas(id_marcas);

ALTER TABLE usuarios ADD FOREIGN KEY(tipo_documento_id) REFERENCES tipo_documento(id_tipo_documento);

ALTER TABLE vehiculo ADD FOREIGN KEY(usuarios_id) REFERENCES usuarios(id_usuarios);







/* ----------------------vistas---------------------- */








/* ----------------------eliminar---------------------- */
DROP TABLE tipo_vehiculo

DROP TABLE colores

DROP TABLE marcas

DROP TABLE usuarios

DROP TABLE tipo_documento

DROP TABLE vehiculo








