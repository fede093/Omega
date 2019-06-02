USE [Omega]
GO
/****** Object:  StoredProcedure [dbo].[spEliminarJuego]    Script Date: 05/29/2019 21:49:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spEliminarJuego]
(
@COD_JUEGO INT,
@ESTADO BIT
)
AS
UPDATE Juego
SET
Estado=@ESTADO
WHERE Id_juego=@COD_JUEGO
RETURN