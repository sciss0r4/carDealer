USE [Salon]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Szymon ligocki
-- Create date: 27.04.2015
-- Description:	DeleteCar sproc
-- =============================================
CREATE PROCEDURE [dbo].[usp_DeleteCar] 
	@VIN VARCHAR(50)
AS
BEGIN
	DECLARE @TempCar INT
	DECLARE @TempTask INT

	SELECT @TempCar = dbo.[Pojazd].idPojazd 
	FROM dbo.[Pojazd]
	WHERE dbo.[Pojazd].VIN=@VIN;

	DELETE FROM dbo.[LokalizacjaPojazdu]
	WHERE dbo.[LokalizacjaPojazdu].idPojazd = @TempCar

	DELETE FROM dbo.[KonfiguracjaPojazduXref]
	WHERE dbo.[KonfiguracjaPojazduXref].idPojazd = @TempCar

	DELETE FROM dbo.[Pojazd] 
	WHERE dbo.[Pojazd].VIN=@VIN
END
-- =============================================
GO
