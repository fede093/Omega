USE [Omega]
GO
/****** Object:  StoredProcedure [dbo].[spActualizarPais]    Script Date: 06/02/2019 19:44:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spActualizarPais]
(
@COD_PAIS INT,
@NOMBRE NVARCHAR(50)
)
AS
UPDATE Pais
SET
Nombre=@NOMBRE
WHERE Cod_Pais=@COD_PAIS
RETURN
