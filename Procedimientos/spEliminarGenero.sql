USE [Omega]
GO
/****** Object:  StoredProcedure [dbo].[spEliminarGenero]    Script Date: 05/29/2019 21:49:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spEliminarGenero]
(
@COD_GENERO INT,
@ESTADO BIT
)
AS
UPDATE Genero
SET
Estado=@ESTADO
WHERE Cod_Genero=@COD_GENERO
RETURN
