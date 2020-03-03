USE [Omega]
GO
/****** Object:  StoredProcedure [dbo].[spActualizarGenero]    Script Date: 02/29/2020 21:10:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE spActualizarReview
(
@COD_REVIEW INT,
@FECHA DATE,
@DETALLE NVARCHAR(1000)
)
AS
UPDATE Review
SET
Fecha_review=@FECHA,
Detalle=@DETALLE
WHERE Cod_review=@COD_REVIEW
RETURN
