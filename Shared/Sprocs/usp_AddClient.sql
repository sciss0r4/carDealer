USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_AddClient]    Script Date: 2015-03-27 22:30:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_AddClient] 
@dataUrodzenia DATETIME, 
@imie NVARCHAR(MAX), 
@kodPocztowy NVARCHAR(MAX), 
@miejscowosc NVARCHAR(MAX),
@nazwisko NVARCHAR(MAX), 
@nrDomu NVARCHAR(MAX), 
@nrLokalu NVARCHAR(MAX), 
@ulica NVARCHAR(MAX), 
@pesel NVARCHAR(MAX) 
AS
BEGIN 
INSERT INTO dbo.[Klient] (nazwisko,imie,PESEL,ulica,nrDomu,nrLokalu,miejscowoœæ,kodPocztowy,dataUrodzenia,idFirma)
	VALUES (@nazwisko,@imie,@pesel,@ulica,@nrDomu,@nrLokalu,@miejscowosc,@kodPocztowy,@dataUrodzenia,null)
END
GO


