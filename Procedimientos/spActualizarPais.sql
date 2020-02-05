USE [Omega]
GO
/****** Object:  StoredProcedure [dbo].[spActualizarPais]    Script Date: 02/04/2020 20:12:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spActualizarPais]
(
@COD_PAIS INT,
@NOMBRE NVARCHAR(50),
@ESTADO BIT
)
AS
UPDATE Pais
SET
Nombre=@NOMBRE,
Estado=@ESTADO
WHERE Cod_Pais=@COD_PAIS
RETURN
