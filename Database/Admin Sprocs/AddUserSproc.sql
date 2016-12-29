USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[ap_AddUser]    Script Date: 2015-03-29 14:50:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ap_AddUser] 
@userName NVARCHAR(MAX),
@password NVARCHAR(MAX),
@idPracownik INT
AS
BEGIN

DECLARE @userCount INT
DECLARE @workerCount INT

SELECT @userCount = COUNT(*)
FROM dbo.[Pracownik] p
JOIN dbo.[User] u ON u.idPracownik = @idPracownik
WHERE p.idPracownik = @idPracownik

SELECT @workerCount = COUNT(*)
FROM dbo.[Pracownik] p
WHERE p.idPracownik = @idPracownik

IF(@workerCount = 1 AND @userCount = 0) 
BEGIN
INSERT INTO dbo.[User] (UserName,UserPasswordSHA,IdPracownik)
	VALUES (@userName,HASHBYTES('SHA1',@password),@idPracownik)
END
ELSE
BEGIN
PRINT 'Podany pracownik nie istnieje, bπdü zosta≥ juø przypisany do niego uøytkownik';
END


END

GO


