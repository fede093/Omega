USE [Omega]
GO
/****** Object:  StoredProcedure [dbo].[spEliminarMedio]    Script Date: 05/29/2019 21:50:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spEliminarMedio]
(
@COD_MEDIO INT,
@ESTADO BIT
)
AS
UPDATE MedioPago
SET
Estado=@ESTADO
WHERE Cod_MPago=@COD_MEDIO
RETURN
