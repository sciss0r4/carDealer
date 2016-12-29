GO
-- =============================================
-- Author:		Szymon ligocki
-- Create date: 31.03.2015
-- Description:	GetAllCarStatuses
-- =============================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetAllCarStatuses]
AS
BEGIN
SELECT * FROM dbo.[StatusPojazdu];
END
-- =============================================