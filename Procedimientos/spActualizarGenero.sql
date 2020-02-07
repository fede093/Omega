USE [Omega]
GO
/****** Object:  StoredProcedure [dbo].[spActualizarGenero]    Script Date: 02/06/2020 22:05:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spActualizarGenero]
(
@COD_GENERO INT,
@NOMBRE NVARCHAR(50),
@ESTADO BIT
)
AS
UPDATE Genero
SET
NombreGenero=@NOMBRE,
Estado=@ESTADO
WHERE Cod_Genero=@COD_GENERO
RETURN
