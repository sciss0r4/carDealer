USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetCarOptionsForCarID]    Script Date: 2015-05-05 20:52:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetCarOptionsForCarID]
@carId INT
AS
BEGIN

SELECT idOpcjaKonfiguracji FROM 
KonfiguracjaPojazduXref
WHERE idPojazd = @carId

END
GO


