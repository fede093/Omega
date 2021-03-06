USE [Omega]
GO
/****** Object:  StoredProcedure [dbo].[spInsertarUsuario]    Script Date: 06/02/2019 19:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spInsertarUsuario]
(
@USUARIO NVARCHAR(50),
@NOMBRE NVARCHAR(50),
@APELLIDO NVARCHAR(50),
@EMAIL NVARCHAR(50),
@CONTRASEÑA NVARCHAR(50),
@TELEFONO NVARCHAR (50),
@COD_PAIS INT,
@ADMINISTRADOR BIT,
@ESTADO BIT
)
AS
INSERT INTO Usuario
(
Usuario,
Nombre,
Apellido,
Email,
Contraseña,
Telefono,
Cod_Pais,
Administrador,
Estado
)
VALUES
(
@USUARIO,
@NOMBRE,
@APELLIDO,
@EMAIL,
@CONTRASEÑA,
@TELEFONO,
@COD_PAIS,
@ADMINISTRADOR,
@ESTADO
)RETURN
