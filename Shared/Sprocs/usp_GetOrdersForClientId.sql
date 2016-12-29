USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetOrdersForClientId]    Script Date: 2015-04-23 16:21:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetOrdersForClientId]
@clientId INT
AS
BEGIN
SELECT z.idZamówienie, ma.nazwaMarki + ' ' + m.nazwaModelu + ' ' + n.typ + ' ' + s.nazwaKodowa + ' ' + CAST(s.moc AS NVARCHAR(MAX)) + ' kW' AS 'nazwaZamowienia'
FROM Zamówienie z
JOIN Pojazd p ON z.idPojazd = p.idPojazd
JOIN Model m ON m.idModel = p.idModel
JOIN Marka ma ON ma.idMarka = m.idMarka
JOIN Nadwozie n ON n.idNadwozie = p.idNadwozie
JOIN Silnik s ON s.idSilnik = p.idSilnik
WHERE z.idKlient = @clientId
END
GO


