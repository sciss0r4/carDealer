USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetUserPermissions]    Script Date: 2015-03-29 15:15:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetUserPermissions] 
@userName NVARCHAR(MAX),
@password NVARCHAR(MAX)
AS 
BEGIN
SELECT pu.idPoziomUprawnien
FROM dbo.[User] u
JOIN dbo.[Pracownik] p ON p.idPracownik = u.IdPracownik
JOIN dbo.PoziomUprawnien pu ON pu.idPoziomUprawnien = p.idPoziomUprawnien
WHERE u.UserName = @userName AND u.UserPasswordSHA = HASHBYTES('SHA1',@password);
END
GO


