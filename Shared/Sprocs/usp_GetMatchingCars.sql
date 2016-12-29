USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetMatchingCars]    Script Date: 2015-03-31 21:28:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetMatchingCars]
@modelId INT,
@bodyId INT,
@paintId INT,
@engineId INT,
@configList As [dbo].[ConfigList] Readonly
AS
BEGIN

SELECT ma.nazwaMarki + ' ' + m.nazwaModelu + ' ' + n.typ + ' ' + s.nazwaKodowa + ' ' + CAST(s.moc AS NVARCHAR(MAX)) + ' kW' AS 'Pojazd', 
sa.nazwaSalonu + ', ' + sa.miejscowoœæ AS 'Lokalizacja', 
p.cena AS 'Cena',
p.idPojazd
INTO #PojazdyTemp
FROM dbo.[Pojazd] p
JOIN dbo.[Model] m ON m.idModel = p.idModel
JOIN dbo.[Marka] ma ON ma.idMarka = m.idMarka
JOIN dbo.[Nadwozie] n ON n.idNadwozie = p.idNadwozie
JOIN dbo.[Silnik] s ON s.idSilnik = p.idSilnik
JOIN dbo.[LokalizacjaPojazdu] lp ON lp.idPojazd = p.idPojazd
JOIN dbo.[Salon] sa ON sa.idSalon = lp.idSalonu
WHERE p.idModel = @modelId AND
p.idNadwozie = @bodyId AND
p.idLakier = @paintId AND
p.idSilnik = @engineId AND
p.idStatusPojazdu = 1

DECLARE @matchCount INT

SELECT @matchCount = COUNT(*) 
FROM #PojazdyTemp t
JOIN dbo.[Pojazd] p ON p.idPojazd = t.[idPojazd]
JOIN dbo.[KonfiguracjaPojazduXref] x ON x.idPojazd = p.idPojazd
JOIN @configList c ON c.Id = x.idOpcjaKonfiguracji

DECLARE @optionCount INT

SELECT @optionCount = COUNT(*)
FROM @configList

IF(@matchCount = @optionCount)
BEGIN
	SELECT *, 'Tak' AS 'Wszystkie opcje?' FROM #PojazdyTemp
END
ELSE
BEGIN
	SELECT *, 'Nie' AS 'Wszystkie opcje?' FROM #PojazdyTemp
END

END
GO


