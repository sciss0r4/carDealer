USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_UserExists]    Script Date: 2015-03-23 22:35:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_UserExists] @userName NVARCHAR(MAX)
AS
BEGIN 
	SELECT TOP 1 * FROM dbo.[User] WHERE UserName = @userName
END
GO


