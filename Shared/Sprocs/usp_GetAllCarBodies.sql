USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetAllCarBodies]    Script Date: 2015-03-30 21:50:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllCarBodies]
AS
BEGIN
SELECT * FROM dbo.[Nadwozie];
END
GO


