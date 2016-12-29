USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_AddUser]    Script Date: 2015-03-23 22:35:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_AddUser] @userName NVARCHAR(MAX), @password NVARCHAR(MAX) AS
BEGIN

DECLARE @userExist INT

SELECT @userExist = COUNT(*) 
FROM dbo.[User] 
WHERE UserName = @userName

IF(@userExist = 0)
BEGIN
	INSERT INTO dbo.[User] (UserName,UserPasswordSHA)
	VALUES (@userName, HASHBYTES('SHA1',@password))
END
ELSE
BEGIN
	PRINT 'User name is already used.';
END

END;
GO


