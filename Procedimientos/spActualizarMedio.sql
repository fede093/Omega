USE [Omega]
GO
/****** Object:  StoredProcedure [dbo].[spActualizarMedio]    Script Date: 06/02/2019 19:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spActualizarMedio]
(
@COD_MEDIO INT,
@DESCRIPCION NVARCHAR(50)
)
AS
UPDATE MedioPago
SET
Descripcion=@DESCRIPCION
WHERE Cod_MPago=@COD_MEDIO
RETURN
