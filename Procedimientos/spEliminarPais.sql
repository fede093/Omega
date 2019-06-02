USE [Omega]
GO
/****** Object:  StoredProcedure [dbo].[spEliminarPais]    Script Date: 05/29/2019 21:50:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spEliminarPais]
(
@COD_PAIS INT,
@ESTADO BIT
)
AS
UPDATE Pais
SET
Estado=@ESTADO
WHERE Cod_Pais=@COD_PAIS
RETURN
