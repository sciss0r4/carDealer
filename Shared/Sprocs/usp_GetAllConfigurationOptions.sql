USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetAllConfigurationOptions]    Script Date: 2015-03-31 17:55:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllConfigurationOptions]
AS
BEGIN
SELECT * FROM dbo.[OpcjaKonfiguracji];
END
GO


