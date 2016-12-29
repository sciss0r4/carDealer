USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetAllCars] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllCars] 
AS
BEGIN
SELECT dbo.[Pojazd].VIN, dbo.[Marka].nazwaMarki, dbo.[Model].nazwaModelu, dbo.[Silnik].nazwaKodowa
FROM dbo.[Pojazd] 
LEFT JOIN dbo.[Model] ON dbo.[Pojazd].idModel=dbo.[Model].idModel
LEFT JOIN dbo.[Marka] ON dbo.[Model].idMarka=dbo.[Marka].idMarka
LEFT JOIN dbo.[Silnik] ON dbo.[Pojazd].idSilnik=dbo.[Silnik].idSilnik 
END
GO