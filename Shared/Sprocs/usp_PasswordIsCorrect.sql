USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_PasswordIsCorrect]    Script Date: 2015-03-23 22:35:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_PasswordIsCorrect] @userName NVARCHAR(MAX), @password NVARCHAR(MAX) AS
BEGIN
SELECT * FROM dbo.[User]
WHERE UserName = @userName AND UserPasswordSHA = HASHBYTES('SHA1',@password)
END;
GO


