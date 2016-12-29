USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_AddOrder]    Script Date: 2015-04-06 14:14:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_AddOrder] 
@clientId INT,
@workerId INT,
@carId INT
AS
BEGIN

DECLARE @carStatus INT

SELECT @carStatus = p.idStatusPojazdu
FROM [dbo].Pojazd p
WHERE p.idPojazd = @carId

IF(@carStatus <> 1)
BEGIN
PRINT 'Pojazd nie jest dost�pny na sprzeda�. Nie mo�na utworzy� zam�wienia.'
END
ELSE
BEGIN

UPDATE [dbo].Pojazd  
SET idStatusPojazdu = 2 
WHERE idPojazd = @carId

INSERT INTO [dbo].[Zam�wienie] (idKlient,idPracownikOdpowiedzialny,idTypZam�wienia,idStatusZam�wienia,idPojazd,dataUtworzenia)
VALUES (@clientId,@workerId,1,1,@carId,GETDATE())
END

RETURN 0;

END

GO


