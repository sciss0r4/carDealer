USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetOrderData]    Script Date: 2015-04-30 20:08:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetOrderData] 
@orderId INT
AS
BEGIN
SELECT k.imie AS 'ImieKlienta',
k.nazwisko AS 'NazwiskoKlienta',
k.PESEL AS 'PeselKlienta',
k.miejscowo�� AS 'MiejscowoscKlienta',
k.ulica AS 'UlicaKlienta',
k.nrDomu AS 'NrDomuKlienta',
k.nrLokalu AS 'NrLokaluKlienta',
k.kodPocztowy AS 'KodPocztowyKlienta',
k.dataUrodzenia AS 'DataUrodzeniaKlienta',
p.imi� AS 'ImiePracownika',
p.nazwisko AS 'NazwiskoPracownika',
sz.statusZam�wienia AS 'StatusZamowienia',
ma.nazwaMarki AS 'MarkaPojazdu',
m.nazwaModelu AS 'ModelPojazdu',
n.typ AS 'NadwoziePojazdu',
s.nazwaKodowa + ', ' + CAST(s.moc AS NVARCHAR(MAX)) + ' kW, ' + CAST(s.pojemno�� AS NVARCHAR(MAX)) + ' cm3' AS 'SilnikPojazdu',
l.typLakieru AS 'LakierPojazdu',
po.VIN AS 'VINPojazdu',
po.przebieg AS 'PrzebiegPojazdu',
po.krajProdukcji AS 'KrajPojazdu',
po.cena AS 'CenaPojazdu',
po.rokProdukcji AS 'RokPojazdu'
FROM Zam�wienie z
JOIN Klient k ON k.idKlient = z.idKlient
JOIN Pracownik p ON p.idPracownik = z.idPracownikOdpowiedzialny
JOIN StatusZam�wienia sz ON sz.idStatusZam�wienia = z.idStatusZam�wienia
JOIN Pojazd po ON po.idPojazd = z.idPojazd
JOIN Model m ON m.idModel = po.idModel
JOIN Marka ma ON ma.idMarka = m.idMarka
JOIN Nadwozie n ON n.idNadwozie = po.idNadwozie
JOIN Silnik s ON s.idSilnik = po.idSilnik
JOIN Lakier l ON l.idLakier = po.idLakier
WHERE z.idZam�wienie = @orderId
END
GO


