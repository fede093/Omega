USE [Omega]
GO
/****** Object:  StoredProcedure [dbo].[spActualizarMedio]    Script Date: 02/04/2020 20:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spActualizarMedio]
(
@COD_MEDIO INT,
@DESCRIPCION NVARCHAR(50),
@ESTADO BIT
)
AS
UPDATE MedioPago
SET
Descripcion=@DESCRIPCION,
Estado=@ESTADO
WHERE Cod_MPago=@COD_MEDIO
RETURN
