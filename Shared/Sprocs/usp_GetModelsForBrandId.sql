USE [Salon]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetModelsForBrandId]    Script Date: 2015-03-29 21:28:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[usp_GetModelsForBrandId] 
@brandId INT
AS
BEGIN
SELECT idModel,nazwaModelu 
FROM dbo.[Model]
WHERE idMarka = @brandId;
END