USE [Omega]
GO
/****** Object:  StoredProcedure [dbo].[spEliminarReview]    Script Date: 05/29/2019 21:50:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spEliminarReview]
(
@COD_REVIEW int,
@ESTADO BIT
)
AS
UPDATE Review
SET
Estado=@ESTADO
WHERE Cod_review=@COD_REVIEW
RETURN
