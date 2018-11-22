CREATE PROCEDURE spInsertarUsuario
(
@USUARIO NVARCHAR(50),
@NOMBRE NVARCHAR(50),
@APELLIDO NVARCHAR(50),
@EMAIL NVARCHAR(50),
@CONTRASEŅA NVARCHAR(50),
@TELEFONO NVARCHAR (50),
@COD_PAIS INT,
@ADMINISTRADOR BIT
)
AS
INSERT INTO Usuario
(
Usuario,
Nombre,
Apellido,
Email,
Contraseņa,
Telefono,
Cod_Pais,
Administrador
)
VALUES
(
@USUARIO,
@NOMBRE,
@APELLIDO,
@EMAIL,
@CONTRASEŅA,
@TELEFONO,
@COD_PAIS,
@ADMINISTRADOR
)RETURN
GO