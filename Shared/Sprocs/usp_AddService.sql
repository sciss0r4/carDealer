USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_AddService]    Script Date: 2015-05-05 22:27:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_AddService] 
@idPracownik INT,
@idTypZlecenia INT,
@idPojazd INT,
@opis NVARCHAR(MAX),
@optionsList As [dbo].[ConfigList] Readonly
AS
BEGIN

DECLARE @confCount INT
DECLARE @prevCount INT
DECLARE @joinCount INT

--SprawdŸ czy konfiguracja siê zmieni³a
SELECT @prevCount = COUNT(o.Id)
FROM @optionsList o

SELECT @confCount = COUNT(x.idOpcjaKonfiguracji)
FROM KonfiguracjaPojazduXref x
WHERE x.idPojazd = @idPojazd

SELECT @joinCount = COUNT(x.idOpcjaKonfiguracji)
FROM KonfiguracjaPojazduXref x
JOIN @optionsList o ON o.Id = x.idOpcjaKonfiguracji
WHERE x.idPojazd = @idPojazd

INSERT INTO ZlecenieSerwisowe VALUES (@idPracownik,@idTypZlecenia,@idPojazd,NULL,@opis,GETDATE(),NULL)

DECLARE @idNewConfig INT
DECLARE @highestID INT

IF(NOT (@prevCount = @confCount AND @joinCount = @confCount))
BEGIN

SELECT TOP 1 @highestID = z.idZlecenieSerwisowe
FROM ZlecenieSerwisowe z
ORDER BY z.idZlecenieSerwisowe DESC

IF(@prevCount != 0)
BEGIN
DECLARE opcja_cursor CURSOR FOR 
SELECT Id
FROM @optionsList o
ORDER BY o.Id

DECLARE @opcjaId INT

OPEN opcja_cursor

FETCH NEXT FROM opcja_cursor
INTO @opcjaId

WHILE @@FETCH_STATUS = 0
BEGIN

INSERT INTO dbo.KonfiguracjaPojazduXref VALUES (NULL,@opcjaId,@highestID)

FETCH NEXT FROM opcja_cursor
INTO @opcjaId
END
END

CLOSE opcja_cursor;
DEALLOCATE opcja_cursor;

UPDATE ZlecenieSerwisowe SET idDocelowaKonfiguracja = @highestID WHERE idZlecenieSerwisowe = @highestID

END
ELSE
BEGIN
SET @idNewConfig = NULL
END

SELECT * FROM Pojazd

END

GO


