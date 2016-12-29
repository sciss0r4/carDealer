USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetCarsByVIN]    Script Date: 2015-05-03 16:56:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetCarsByVIN] 
@VIN NVARCHAR(MAX)
AS 
BEGIN

SELECT p.idPojazd AS 'idCar',
ma.nazwaMarki + ' ' + m.nazwaModelu + CHAR(13) + CHAR(10) 
+ n.typ + ' ' + s.nazwaKodowa + ' ' + CAST(s.moc AS nvarchar(max)) + ' kW' + ' ' +l.typLakieru + CHAR(13) + CHAR(10) 
+ p.VIN
AS 'carName'
FROM Pojazd p
JOIN Model m ON m.idModel = p.idModel
JOIN Marka ma ON ma.idMarka = m.idMarka
JOIN Nadwozie n ON n.idNadwozie = p.idNadwozie
JOIN Silnik s ON s.idSilnik = p.idSilnik
JOIN Lakier l ON l.idLakier = p.idLakier
WHERE p.VIN LIKE ('%' + @VIN + '%')
END
GO


