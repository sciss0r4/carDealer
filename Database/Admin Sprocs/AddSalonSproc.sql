USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[ap_AddSalon]    Script Date: 2015-03-29 14:50:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ap_AddSalon] 
@idSalon INT,
@ulica VARCHAR(50),
@nrDomu INT,
@nrLokalu INT,
@miejscowosc VARCHAR(50),
@kodPocztowy VARCHAR(50),
@nazwaSalonu VARCHAR(50)
AS
BEGIN
INSERT INTO dbo.[Salon] (idSalon, ulica, nrDomu, nrLokalu, miejscowoœæ, kodPocztowy, nazwaSalonu)
VALUES (@idSalon, @ulica, @nrDomu, @nrLokalu, @miejscowosc, @kodPocztowy, @nazwaSalonu)
END

GO


