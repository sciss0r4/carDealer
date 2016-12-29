USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetAllBrands]    Script Date: 2015-03-29 20:53:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllBrands] 
AS
BEGIN
SELECT * FROM dbo.[Marka]
END
GO


