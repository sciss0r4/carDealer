USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_AddCar]    Script Date: 2015-05-29 22:03:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Szymon ligocki
-- Create date: 29.03.2015
-- Description:	AddCar sproc
-- =============================================
CREATE PROCEDURE [dbo].[usp_AddCar] 
	@idNadwozie int,
	@idModel int,
	@idStatusPojazdu int,
	@idLakier int,
	@idSilnik int,
	@idKonfiguracjaPojazdu int,
	@VIN VARCHAR(50),
	@rokProdukcji date,
	@przebieg int,
	@krajProdukcji VARCHAR(50),
	@cena VARCHAR(50)
AS
BEGIN
	DECLARE @idPojazd INT

	INSERT INTO dbo.[Pojazd] (idNadwozie, idModel, idStatusPojazdu, idLakier, idSilnik, idKonfiguracjaPojazdu, VIN, rokProdukcji, przebieg, krajProdukcji, cena)
	VALUES (@idNadwozie, @idModel, @idStatusPojazdu, @idLakier, @idSilnik, @idKonfiguracjaPojazdu, @VIN, @rokProdukcji, @przebieg, @krajProdukcji, @cena)

	SELECT TOP 1 @idPojazd = p.idPojazd
	FROM dbo.Pojazd p
	ORDER BY p.idPojazd DESC

	INSERT INTO dbo.LokalizacjaPojazdu VALUES (@idPojazd,1,NULL)

END
-- =============================================












GO


