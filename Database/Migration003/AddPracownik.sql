USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[ap_AddPracownik]    Script Date: 2015-03-29 14:41:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ap_AddPracownik] 
@idPracownik int,
@nazwisko VARCHAR(50),
@imie VARCHAR(50),
@wynagrodzenie FLOAT,
@dataUrodzenia DATE,
@idStanowisko INT,
@idPoziomUprawnien INT
AS
BEGIN

DECLARE @count INT

SELECT @count = COUNT(*)
FROM dbo.[Stanowisko]
JOIN dbo.[PoziomUprawnien] ON idPoziomUprawnien = @idPoziomUprawnien
WHERE idStanowisko = @idStanowisko


IF(@count > 0) 
BEGIN
INSERT INTO dbo.[Pracownik] (idPracownik,nazwisko,imi�,wynagrodzenie,dataUrodzenia,idStanowisko,idPoziomUprawnien)
VALUES (@idPracownik,@nazwisko,@imie,@wynagrodzenie,@dataUrodzenia,@idStanowisko,@idPoziomUprawnien);
END
ELSE
BEGIN
PRINT 'Nie mo�na doda� pracownika bez istniej�cego stanowiska lub poziomu uprawnie�';
END

RETURN 0;

END

GO


