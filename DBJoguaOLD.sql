CREATE TABLE trabajador(
	id_trabajador INT PRIMARY KEY,
	nombre VARCHAR(25),
	apellidos VARCHAR(50),
	telefono VARCHAR(15),
	direccion VARCHAR(90),
	Fecha_nac date,
	cargo VARCHAR(50)
) ENGINE=InnoDB;

CREATE TABLE users(
	nickname varchar(25) PRIMARY KEY,
	pass varchar(25) not null,
	id_trabajador int not null,
	foreign key (id_trabajador) references trabajador (id_trabajador)
	on delete cascade on update cascade
)ENGINE InnoDB;


CREATE TABLE IF NOT EXISTS clientes(
	id_cliente int primary key,
	nombre varchar(25),
	paterno varchar(25),
	materno varchar(25),
	tel varchar(15),
	cel varchar(15),
	correo varchar (30),
	direccion varchar (100),
	fecha_alta date
)ENGINE InnoDb;

CREATE TABLE IF NOT EXISTS servicios(
	Clave VARCHAR(25) PRIMARY KEY,
	nombre VARCHAR(25) NOT NULL,
	descripcion VARCHAR(25) NOT NULL
)ENGINE InnoDB;

CREATE TABLE IF NOT EXISTS trabajos(
	id_trabajo INT PRIMARY KEY,
	id_cliente INT NOT NULL,
	id_trabajador INT NOT NULL,
	Clave VARCHAR(25) NOT NULL,
	fecha_ini DATE,
	precio REAL,
	estado VARCHAR(25),
	anticipo REAL,
	fecha_term DATE,
	FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (id_trabajador) REFERENCES trabajador (id_trabajador)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (Clave) REFERENCES servicios (Clave)
	ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE InnoDB;


CREATE TABLE IF NOT EXISTS pagos(
	id_pago INT PRIMARY KEY,
	id_trabajo INT NOT null,
	monto REAL(10,2),
	fecha DATE,
	FOREIGN KEY (id_trabajo) REFERENCES trabajos (id_trabajo)
	ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE InnoDB;


mysql> CREATE TABLE personas2 (
    -> id INT AUTO_INCREMENT PRIMARY KEY,
    -> nombre VARCHAR(40),
    -> fecha DATE)
    -> ENGINE=InnoDB;
Query OK, 0 rows affected (0.13 sec)

mysql> CREATE TABLE telefonos2 (
    -> numero CHAR(12),
    -> id INT NOT NULL,
    -> KEY (id), (2)
    -> FOREIGN KEY (id) REFERENCES personas2 (id)
    -> ON DELETE CASCADE ON UPDATE CASCADE) (3)
    -> ENGINE=InnoDB;
Query OK, 0 rows affected (0.13 sec)