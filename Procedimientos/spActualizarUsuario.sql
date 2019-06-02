USE [Omega]
GO
/****** Object:  StoredProcedure [dbo].[spActualizarUsuario]    Script Date: 06/02/2019 19:44:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spActualizarUsuario]
(
@USUARIO NVARCHAR(50),
@NOMBRE NVARCHAR(50),
@APELLIDO NVARCHAR(50),
@EMAIL NVARCHAR(50),
@CONTRASEÑA NVARCHAR(50),
@TELEFONO NVARCHAR (50),
@COD_PAIS INT,
@ADMINISTRADOR BIT
)
AS
UPDATE Usuario
SET
Nombre=@NOMBRE,
Apellido=@APELLIDO,
Email=@EMAIL,
Telefono=@TELEFONO,
Cod_Pais=@COD_PAIS,
Administrador=@ADMINISTRADOR
WHERE Usuario=@USUARIO
RETURN
