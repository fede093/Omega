USE [Omega]
GO
/****** Object:  StoredProcedure [dbo].[spEliminarUsuario]    Script Date: 05/29/2019 21:50:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spEliminarUsuario]
(
@USUARIO NVARCHAR(50),
@ESTADO BIT
)
AS
UPDATE Usuario
SET
Estado=@ESTADO
WHERE Usuario=@USUARIO
RETURN