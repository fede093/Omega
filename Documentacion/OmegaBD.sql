USE master;
go
create database Omega
go
Use [Omega]
go

CREATE TABLE Genero
(
Cod_Genero int PRIMARY KEY NOT NULL IDENTITY (1,1),
Nombre nvarchar(50) NOT NULL
)
go

CREATE TABLE Pais
(
Cod_Pais int PRIMARY KEY NOT NULL IDENTITY (1,1),
Nombre nvarchar(50) NOT NULL
)
go

CREATE TABLE Juego
(
Id_juego int PRIMARY KEY NOT NULL IDENTITY (1,1),
Nombre nvarchar(50) NOT NULL,
Descripcion nvarchar(50) NOT NULL,
Fecha_Lanzamiento date NOT NULL,
Desarrollador nvarchar(50) NOT NULL,
Distribuidor nvarchar(50) NOT NULL,
Genero int NOT NULL REFERENCES Genero(Cod_Genero),
Idioma nvarchar(50) NOT NULL,
Precio float NOT NULL,
Imagen nvarchar(50) NOT NULL,
Clasificacion nvarchar(50) NOT NULL,
Pagina_oficial nvarchar(50) NULL
)
go

CREATE TABLE Usuario
(
Usuario nvarchar(50) PRIMARY KEY NOT NULL,
Nombre nvarchar(50) NOT NULL,
Apellido nvarchar(50) NOT NULL,
Email nvarchar(50) NOT NULL,
Contraseña nvarchar(50) NOT NULL,
Telefono nvarchar(50) NOT NULL,
Cod_Pais int NOT NULL REFERENCES Pais(Cod_Pais),
Administrador bit NOT NULL
)
go

CREATE TABLE MedioPago
(
Cod_MPago int NOT NULL PRIMARY KEY IDENTITY (100,1),
Descripcion nvarchar(50) NOT NULL
)
go

CREATE TABLE DetallesCompra
(
cod_compra int NOT NULL PRIMARY KEY IDENTITY (1000,1),
cod_medio int NOT NULL REFERENCES MedioPago(Cod_MPago),
fecha_compra date NOT NULL,
)
go

CREATE TABLE juegoXusuario
(
Cod_Compra int NOT NULL REFERENCES DetallesCompra(cod_compra),
Id_juego int NOT NULL REFERENCES Juego(Id_juego),
Cod_Usuario nvarchar(50) NOT NULL REFERENCES Usuario(Usuario),
CONSTRAINT PK_Compra PRIMARY KEY (Id_juego, Cod_Usuario)
)
go


CREATE TABLE Review
(
Cod_Review int NOT NULL IDENTITY (1,1),
Id_juego int NOT NULL REFERENCES Juego(Id_juego),
Cod_Usuario nvarchar(50) NOT NULL REFERENCES Usuario(Usuario),
Review nvarchar(50) NULL,
CONSTRAINT PK_Review PRIMARY KEY (Cod_Review, Id_juego, Cod_Usuario)
)
go

DROP DATABASE Omega;

DELETE FROM Genero

DBCC CHECKIDENT (Genero, RESEED, 0)

INSERT INTO Genero(Nombre) values('JRPG')

ALTER TABLE Pais
ADD UNIQUE (Nombre) 