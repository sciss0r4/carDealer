GO
-- =============================================
-- Author:		Szymon ligocki
-- Create date: 31.03.2015
-- Description:	GetAllCarModelsWithBrands
-- =============================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetAllCarModelsWithBrands]
AS
BEGIN
SELECT * FROM dbo.[Model] LEFT JOIN dbo.[Marka] ON [Marka].idMarka=[Model].idMarka;
END
-- =============================================