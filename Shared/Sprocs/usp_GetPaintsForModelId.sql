USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetPaintsForModelId]    Script Date: 2015-03-30 21:22:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetPaintsForModelId]
@modelId INT
AS
BEGIN

SELECT l.idLakier, l.typLakieru 
FROM dbo.[Model] m
JOIN dbo.[ModelLakierXref] x ON x.idModel = m.idModel
JOIN dbo.[Lakier] l ON l.idLakier = x.idLakier
WHERE m.idModel = @modelId;

END
GO


