USE [Salon]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetClientsNamesByPattern]    Script Date: 2015-03-29 11:01:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetClientsNamesByPattern] 
@imie NVARCHAR(MAX),
@miejscowosc NVARCHAR(MAX),
@nazwisko NVARCHAR(MAX),
@ulica NVARCHAR(MAX),
@pesel NVARCHAR(MAX)
AS
BEGIN
SELECT idKlient,nazwisko + ' ' + imie AS [clientName]
FROM dbo.[Klient]
WHERE
imie LIKE '%' + @imie + '%' OR
miejscowoœæ LIKE '%' + @miejscowosc + '%' OR
nazwisko LIKE '%' + @nazwisko + '%' OR
ulica LIKE '%' + @ulica + '%' OR
nazwisko LIKE '%' + @nazwisko + '%' OR
pesel LIKE '%' + @pesel + '%';
END
GO


