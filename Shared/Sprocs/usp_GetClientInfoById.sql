USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetClientInfoById]    Script Date: 2015-03-29 12:01:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetClientInfoById] @id INT 
AS
BEGIN
SELECT * 
FROM dbo.[Klient]
WHERE idKlient = @id;
END
GO


