USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetAllServices]    Script Date: 2015-05-11 23:26:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllServices] AS
BEGIN
SELECT 
zs.idZlecenieSerwisowe AS 'idService',
ma.nazwaMarki + ' ' + m.nazwaModelu + ' ' +
+ n.typ + ' ' + s.nazwaKodowa + ' ' + CAST(s.moc AS nvarchar(max)) + ' kW' + ' ' +l.typLakieru  + ' '
+ p.VIN + CHAR(13) + CHAR(10) 
+ tz.TypZlecenia + CHAR(13) + CHAR(10) 
+ pr.nazwisko + ' ' + pr.imiê + CHAR(13) + CHAR(10) 
+ CAST(zs.dataUtworzenia AS nvarchar(MAX))
AS 'serviceQuery'
FROM ZlecenieSerwisowe zs
JOIN Pojazd p ON p.idPojazd = zs.idPojazd
JOIN Model m ON m.idModel = p.idModel
JOIN Marka ma ON ma.idMarka = m.idMarka
JOIN Nadwozie n ON n.idNadwozie = p.idNadwozie
JOIN Silnik s ON s.idSilnik = p.idSilnik
JOIN Lakier l ON l.idLakier = p.idLakier
JOIN TypZlecenia tz ON tz.idTypZlecenia = zs.idTypZlecenia
JOIN Pracownik pr ON pr.idPracownik = zs.idPracownikPrzydzielony
END

--SELECT * FROM ZlecenieSerwisowe
GO


