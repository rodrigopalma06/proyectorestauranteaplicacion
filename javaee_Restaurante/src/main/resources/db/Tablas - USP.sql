USE master

DROP DATABASE Restaurante

CREATE DATABASE Restaurante

USE Restaurante

--- PLATOS ---

CREATE TABLE Platos (
	id_plato INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
	nom_plato VARCHAR(30) NOT NULL,
	cat_plato VARCHAR(10) NOT NULL,
	precio_plato MONEY NOT NULL,
)

--- MESAS ---

create TABLE Categorias (
	id_cate INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
	nom_cate varchar(20) NOT NULL,
)

insert into Categorias values 
('Postres'),
('Bebidas'),
('Adicionales'),
('Pastas'),
('Sandwiches')

create procedure usp_ListarCategoria
as
SELECT id_cate, nom_cate
	FROM Categorias

--- DISTRITOS ---

CREATE TABLE Distritos (
	id_dist INT  PRIMARY KEY NOT NULL,
	nom_dist VARCHAR(20) NOT NULL
)

--- EMPLEADOS ---

CREATE TABLE Empleados (	
	id_empl INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
	dni_empl INT NOT NULL,
	nom_empl VARCHAR(30) NOT NULL,
	ape_empl VARCHAR (20) NOT NULL,
	id_dist INT NOT NULL FOREIGN KEY REFERENCES Distritos,
	direc_empl VARCHAR(30) NOT NULL,
	tel_empl NUMERIC NOT NULL,
	sexo BIT NOT NULL,
	cargo VARCHAR(15) NOT NULL,	
)

--- CLIENTES ---

CREATE TABLE Clientes (
	id_cli INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
	dni_cli INT NOT NULL,
	nom_cli VARCHAR(30) NOT NULL,
	ape_cli VARCHAR(30) NOT NULL,
	ruc_cli INT NOT NULL,
	tel_cli NUMERIC,
)

--- PEDIDOS ---

CREATE TABLE Pedidos (
	id_pedi INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
	id_cli INT NOT NULL FOREIGN KEY REFERENCES Clientes,
	id_plato INT NOT NULL FOREIGN KEY REFERENCES Platos,	
	cant_plato SMALLINT NOT NULL,
	id_mesa  TINYINT NOT NULL FOREIGN KEY REFERENCES Mesas,
	tipo_pedi BIT NOT NULL,
	esta_pedi BIT NOT NULL,
)



