USE [Salon]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllOrdersWithAllParameters] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetAllOrdersWithAllParameters] AS
BEGIN

SELECT z.idZamówienie, z.dataUtworzenia,
t.typZamówienia,
k.idFirma, k.idKlient, k.nazwisko AS 'nazwiskoKlienta', k.imie AS 'imieKlienta',
prac.idPracownik, prac.nazwisko AS 'nazwiskoPracownika', prac.imię AS 'imięPracownika',
poj.idPojazd, poj.cena,
model.nazwaModelu,
marka.nazwaMarki,
l.typLakieru 
FROM Zamówienie z
JOIN TypZamówienia t ON t.idTypZamówienia=z.idTypZamówienia
JOIN Klient k ON k.idKlient=z.idKlient 
JOIN Pracownik prac ON prac.idPracownik=z.idPracownikOdpowiedzialny
JOIN Pojazd poj ON poj.idPojazd=z.idPojazd
JOIN Model model ON model.idModel=poj.idModel
JOIN Marka marka ON model.idMarka=marka.idMarka
JOIN Lakier l ON l.idLakier=poj.idLakier

END