USE [Salon]

EXEC dbo.[usp_AddClient] 
@nazwisko = 'Kowalski', 
@imie = 'Jan',
@pesel = '88650706631',
@ulica = 'Mierzejewskiego',
@nrDomu = '10A',
@nrLokalu = '5',
@miejscowosc = 'Kalety',
@kodPocztowy = '46-230',
@dataUrodzenia = '1984-07-11'

EXEC dbo.[usp_AddClient] 
@nazwisko = 'Zieńczuk', 
@imie = 'Marek',
@pesel = '66040908046',
@ulica = 'Żwirki i Wigury',
@nrDomu = '23',
@nrLokalu = '',
@miejscowosc = 'Katowice',
@kodPocztowy = '44-020',
@dataUrodzenia = '1966-04-09'

EXEC dbo.[usp_AddClient] 
@nazwisko = 'Wyszyński', 
@imie = 'Paweł',
@pesel = '55032569215',
@ulica = 'Aleja Róż',
@nrDomu = '3',
@nrLokalu = '6',
@miejscowosc = 'Bełchatów',
@kodPocztowy = '35-221',
@dataUrodzenia = '1955-01-12'

EXEC dbo.[usp_AddClient] 
@nazwisko = 'Pełka', 
@imie = 'Marian',
@pesel = '67654139687',
@ulica = 'Westerplatte',
@nrDomu = '103',
@nrLokalu = '',
@miejscowosc = 'Olkusz',
@kodPocztowy = '59-299',
@dataUrodzenia = '1967-02-02'

EXEC dbo.[usp_AddClient] 
@nazwisko = 'Balcerowicz', 
@imie = 'Adam',
@pesel = '77548796325',
@ulica = 'Podgórna',
@nrDomu = '67',
@nrLokalu = '3',
@miejscowosc = 'Siemianowice Śląskie',
@kodPocztowy = '44-120',
@dataUrodzenia = '1977-05-28'

INSERT INTO dbo.[Stanowisko] VALUES (1, 'Sprzedawca')

EXEC ap_AddSalon @ulica = 'Wojska Polskiego', @nrDomu = 34, @nrLokalu = 2, @miejscowosc = 'Katowice', @kodPocztowy = '41-120', @nazwaSalonu = 'Auto Ganinex', @idSalon = 1

INSERT INTO dbo.[PoziomUprawnien] VALUES (1, 'Sprzedawca')

EXEC dbo.ap_AddPracownik @idPracownik = 1, @nazwisko = 'Szymura', @imie = 'Jarosław', @wynagrodzenie = '2356.54',@dataUrodzenia = '1985-03-24',@idStanowisko=1,@idPoziomUprawnien=1 

EXEC dbo.ap_AddUser @userName = 'jarszy001',@password = 'abc', @idPracownik = 1

INSERT INTO dbo.[Marka] VALUES (1, 'Skoda')
INSERT INTO dbo.[Marka] VALUES (2, 'Subaru')

INSERT INTO dbo.[Model] VALUES (1,1,'Fabia')
INSERT INTO dbo.[Model] VALUES (2,1,'Octavia')
INSERT INTO dbo.[Model] VALUES (3,2,'Impreza')
INSERT INTO dbo.[Model] VALUES (4,2,'Forester')

INSERT INTO dbo.[StatusPojazdu] VALUES (1, 'Dostępny - na sprzedaż')
INSERT INTO dbo.[StatusPojazdu] VALUES (2, 'Zamówiony')

INSERT INTO dbo.[PracownikSalonXref] VALUES (1,1)

INSERT INTO dbo.[Lakier] VALUES (1, 'Panther Black')
INSERT INTO dbo.[Lakier] VALUES (2, 'Frozen White')
INSERT INTO dbo.[Lakier] VALUES (3, 'Blue Pearl')
INSERT INTO dbo.[Lakier] VALUES (4, 'Forest Green')

INSERT INTO dbo.[ModelLakierXref] VALUES (1,1)
INSERT INTO dbo.[ModelLakierXref] VALUES (1,2)
INSERT INTO dbo.[ModelLakierXref] VALUES (1,3)
INSERT INTO dbo.[ModelLakierXref] VALUES (2,1)
INSERT INTO dbo.[ModelLakierXref] VALUES (2,2)
INSERT INTO dbo.[ModelLakierXref] VALUES (2,3)
INSERT INTO dbo.[ModelLakierXref] VALUES (3,3)
INSERT INTO dbo.[ModelLakierXref] VALUES (4,3)
INSERT INTO dbo.[ModelLakierXref] VALUES (4,4)

INSERT INTO dbo.[Nadwozie] VALUES (1,'Hatchback')
INSERT INTO dbo.[Nadwozie] VALUES (2,'Sedan')
INSERT INTO dbo.[Nadwozie] VALUES (3,'Coupe')
INSERT INTO dbo.[Nadwozie] VALUES (4,'Kombi')

INSERT INTO dbo.[Silnik] VALUES (1,1398,51,'BZG')
INSERT INTO dbo.[Silnik] VALUES (2,1958,89,'2.0 TDI')
INSERT INTO dbo.[Silnik] VALUES (3,1462,55,'ATF')
INSERT INTO dbo.[Silnik] VALUES (4,2020,102,'2.0 Twin Turbo')
INSERT INTO dbo.[Silnik] VALUES (5,1242,60,'HDI')
INSERT INTO dbo.[Silnik] VALUES (6,1396,48,'DCCF')
INSERT INTO dbo.[Silnik] VALUES (7,1758,86,'1.7 Xstreet')
INSERT INTO dbo.[Silnik] VALUES (8,1922,76,'1.9 KKF')

INSERT INTO dbo.[ModelSilnikXref] VALUES (3,4)
INSERT INTO dbo.[ModelSilnikXref] VALUES (3,7)
INSERT INTO dbo.[ModelSilnikXref] VALUES (4,2)
INSERT INTO dbo.[ModelSilnikXref] VALUES (4,5)
INSERT INTO dbo.[ModelSilnikXref] VALUES (4,8)
INSERT INTO dbo.[ModelSilnikXref] VALUES (1,1)
INSERT INTO dbo.[ModelSilnikXref] VALUES (1,3)
INSERT INTO dbo.[ModelSilnikXref] VALUES (1,6)
INSERT INTO dbo.[ModelSilnikXref] VALUES (2,1)
INSERT INTO dbo.[ModelSilnikXref] VALUES (2,3)
INSERT INTO dbo.[ModelSilnikXref] VALUES (2,6)
INSERT INTO dbo.[ModelSilnikXref] VALUES (2,5)

EXEC dbo.usp_AddCar @idNadwozie=1, @idModel=1, @idStatusPojazdu=1, @idLakier=2, @idSilnik=1, @idKonfiguracjaPojazdu=1, @VIN='1234', @rokProdukcji='1977-05-28', @przebieg=0, @krajProdukcji='Francja', @cena='1.200mln'
EXEC dbo.usp_AddCar @idNadwozie=4, @idModel=4, @idStatusPojazdu=2, @idLakier=1, @idSilnik=4, @idKonfiguracjaPojazdu=1, @VIN='4321', @rokProdukcji='2000-05-28', @przebieg=15000, @krajProdukcji='Belgia', @cena='200mln'

INSERT INTO dbo.[OpcjaKonfiguracji] VALUES (1,'Podgrzewane Fotele')
INSERT INTO dbo.[OpcjaKonfiguracji] VALUES (2,'Elektryczne Lusterka')
INSERT INTO dbo.[OpcjaKonfiguracji] VALUES (3,'Klimatyzacja')
INSERT INTO dbo.[OpcjaKonfiguracji] VALUES (4,'Fabryczne radio')
INSERT INTO dbo.[OpcjaKonfiguracji] VALUES (5,'Światła do jazdy dziennej')

INSERT INTO dbo.[StatusZamówienia] VALUES (1,'W trakcie realizacji')
INSERT INTO dbo.[StatusZamówienia] VALUES (2,'Zrealizowano')

INSERT INTO dbo.[TypZamówienia] VALUES (1, 'Zakup pojazdu')

INSERT INTO dbo.[KonfiguracjaPojazduXref] (idPojazd,idOpcjaKonfiguracji) VALUES (1,2)
INSERT INTO dbo.[KonfiguracjaPojazduXref] (idPojazd,idOpcjaKonfiguracji) VALUES (1,3)
INSERT INTO dbo.[KonfiguracjaPojazduXref] (idPojazd,idOpcjaKonfiguracji) VALUES (1,5)
INSERT INTO dbo.[KonfiguracjaPojazduXref] (idPojazd,idOpcjaKonfiguracji) VALUES (2,1)

INSERT INTO dbo.[TypZlecenia] VALUES (1,'Naprawa/montaż części')

INSERT INTO dbo.[Stanowisko] VALUES (2,'Kierownik')
INSERT INTO dbo.[Stanowisko] VALUES (3,'Administrator')

INSERT INTO dbo.[PoziomUprawnien] VALUES (2,'Kierownik')
INSERT INTO dbo.[PoziomUprawnien] VALUES (3,'Administrator')

EXEC ap_AddPracownik @idPracownik = 2,
@nazwisko = 'Kowalski',
@imie = 'Marian',
@wynagrodzenie = 1000,
@dataUrodzenia = '1978-05-11',
@idStanowisko = 2,
@idPoziomUprawnien = 2

EXEC ap_AddUser @userName = 'markow001', @password = 'abc', @idPracownik = 2

EXEC ap_AddPracownik @idPracownik = 3,
@nazwisko = 'Nowak',
@imie = 'Wiesław',
@wynagrodzenie = 1500,
@dataUrodzenia = '1954-04-19',
@idStanowisko = 3,
@idPoziomUprawnien = 3

EXEC ap_AddUser @userName = 'wienow001', @password = 'abc', @idPracownik = 3