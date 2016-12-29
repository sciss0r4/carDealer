USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetEngineFullNamesForModelId]    Script Date: 2015-03-30 23:04:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetEngineFullNamesForModelId]
@modelId INT
AS
BEGIN
SELECT 
s.idSilnik, 
s.nazwaKodowa + ', ' + CAST(s.moc AS NVARCHAR(MAX)) + ' kW, ' + CAST(s.pojemnoœæ AS NVARCHAR(MAX)) + ' cm3' AS 'engineFullName'
FROM dbo.[Model] m
JOIN dbo.[ModelSilnikXref] x ON x.idModel = m.idModel
JOIN dbo.[Silnik] s ON s.idSilnik = x.idSilnik
WHERE m.idModel = @modelId
END
GO


