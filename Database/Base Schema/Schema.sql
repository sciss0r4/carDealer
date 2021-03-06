USE [master]
GO
/****** Object:  Database [Salon]    Script Date: 2015-03-19 12:06:14 ******/
CREATE DATABASE [Salon]
GO
ALTER DATABASE [Salon] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Salon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Salon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Salon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Salon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Salon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Salon] SET ARITHABORT OFF 
GO
ALTER DATABASE [Salon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Salon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Salon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Salon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Salon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Salon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Salon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Salon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Salon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Salon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Salon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Salon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Salon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Salon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Salon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Salon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Salon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Salon] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Salon] SET  MULTI_USER 
GO
ALTER DATABASE [Salon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Salon] SET DB_CHAINING OFF 
GO
USE [Salon]
GO
/****** Object:  Table [dbo].[Firma]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Firma](
	[idFirma] [int] NOT NULL,
	[REGON] [varchar](50) NOT NULL,
	[ulica] [varchar](50) NOT NULL,
	[nrDomu] [int] NOT NULL,
	[nrLokalu] [int] NULL,
	[miejscowość] [varchar](50) NOT NULL,
	[kodPocztowy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Firma] PRIMARY KEY CLUSTERED 
(
	[idFirma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Klient]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Klient](
	[idKlient] [int] IDENTITY(1,1) NOT NULL,
	[nazwisko] [varchar](50) NOT NULL,
	[imie] [varchar](50) NOT NULL,
	[PESEL] [varchar](50) NOT NULL,
	[ulica] [varchar](50) NOT NULL,
	[nrDomu] [varchar](10) NOT NULL,
	[nrLokalu] [varchar](10) NULL,
	[miejscowość] [varchar](50) NOT NULL,
	[kodPocztowy] [varchar](50) NOT NULL,
	[dataUrodzenia] [date] NULL,
	[idFirma] [int] NULL,
 CONSTRAINT [PK_Klient] PRIMARY KEY CLUSTERED 
(
	[idKlient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KonfiguracjaPojazduXref]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KonfiguracjaPojazduXref](
	[idPojazd] [int] NOT NULL,
	[idOpcjaKonfiguracji] [int] NOT NULL,
	[idZlecenieSerwisowe] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lakier]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lakier](
	[idLakier] [int] NOT NULL,
	[typLakieru] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Lakier] PRIMARY KEY CLUSTERED 
(
	[idLakier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LokalizacjaPojazdu]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LokalizacjaPojazdu](
	[idPojazd] [int] NOT NULL,
	[idSalonu] [int] NOT NULL,
	[innaLokalizacja] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Marka]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Marka](
	[idMarka] [int] NOT NULL,
	[nazwaMarki] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Marka] PRIMARY KEY CLUSTERED 
(
	[idMarka] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Model]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Model](
	[idModel] [int] NOT NULL,
	[nazwaModelu] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[idModel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nadwozie]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nadwozie](
	[idNadwozie] [int] NOT NULL,
	[typ] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Nadwozie] PRIMARY KEY CLUSTERED 
(
	[idNadwozie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OpcjaKonfiguracji]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OpcjaKonfiguracji](
	[idOpcjaKonfiguracji] [int] NOT NULL,
	[nazwaOpcji] [varchar](50) NULL,
 CONSTRAINT [PK_OpcjaKonfiguracji] PRIMARY KEY CLUSTERED 
(
	[idOpcjaKonfiguracji] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pojazd]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pojazd](
	[idPojazd] [int] NOT NULL,
	[idNadwozie] [int] NOT NULL,
	[idMarka] [int] NOT NULL,
	[idModel] [int] NOT NULL,
	[idStatusPojazdu] [int] NOT NULL,
	[idLakier] [int] NOT NULL,
	[idSilnik] [int] NOT NULL,
	[idKonfiguracjaPojazdu] [int] NOT NULL,
	[VIN] [varchar](50) NOT NULL,
	[rokProdukcji] [date] NULL,
	[przebieg] [int] NULL,
	[krajProdukcji] [varchar](50) NULL,
	[cena] [varchar](50) NULL,
 CONSTRAINT [PK_Pojazd] PRIMARY KEY CLUSTERED 
(
	[idPojazd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pracownik]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pracownik](
	[idPracownik] [int] NOT NULL,
	[nazwisko] [varchar](50) NOT NULL,
	[imię] [varchar](50) NOT NULL,
	[wynagrodzenie] [float] NULL,
	[dataUrodzenia] [date] NOT NULL,
	[idStanowisko] [int] NOT NULL,
	[idPoziomUprawnien] [int] NOT NULL,
 CONSTRAINT [PK_Pracownik] PRIMARY KEY CLUSTERED 
(
	[idPracownik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PoziomUprawnien]    Script Date: 2015-03-29 13:48:16 ******/ ---------------------------------
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PoziomUprawnien](
	[idPoziomUprawnien] [int] NOT NULL,
	[PoziomUprawnien] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PoziomUprawnien] PRIMARY KEY CLUSTERED 
(
	[idPoziomUprawnien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PracownikSalonXref]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PracownikSalonXref](
	[idPracownik] [int] NOT NULL,
	[idSalon] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salon]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Salon](
	[idSalon] [int] NOT NULL,
	[ulica] [varchar](50) NOT NULL,
	[nrDomu] [int] NOT NULL,
	[nrLokalu] [int] NULL,
	[miejscowość] [varchar](50) NOT NULL,
	[kodPocztowy] [varchar](50) NOT NULL,
	[nazwaSalonu] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Salon] PRIMARY KEY CLUSTERED 
(
	[idSalon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Silnik]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Silnik](
	[idSilnik] [int] NOT NULL,
	[pojemność] [float] NOT NULL,
	[moc] [int] NOT NULL,
	[nazwaKodowa] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Silnik] PRIMARY KEY CLUSTERED 
(
	[idSilnik] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stanowisko]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stanowisko](
	[idStanowisko] [int] NOT NULL,
	[nazwaStanowiska] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Stanowisko] PRIMARY KEY CLUSTERED 
(
	[idStanowisko] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StatusPojazdu]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StatusPojazdu](
	[idStatusPojazdu] [int] NOT NULL,
	[statusPojazdu] [varchar](50) NULL,
 CONSTRAINT [PK_StatusPojazdu] PRIMARY KEY CLUSTERED 
(
	[idStatusPojazdu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StatusZamówienia]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StatusZamówienia](
	[idStatusZamówienia] [int] NOT NULL,
	[statusZamówienia] [varchar](50) NULL,
 CONSTRAINT [PK_StatusZamówienia] PRIMARY KEY CLUSTERED 
(
	[idStatusZamówienia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypZamówienia]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TypZamówienia](
	[idTypZamówienia] [int] NOT NULL,
	[typZamówienia] [varchar](50) NULL,
 CONSTRAINT [PK_TypZamówienia] PRIMARY KEY CLUSTERED 
(
	[idTypZamówienia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TypZlecenia]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TypZlecenia](
	[idTypZlecenia] [int] NOT NULL,
	[TypZlecenia] [varchar](50) NULL,
 CONSTRAINT [PK_TypZlecenia] PRIMARY KEY CLUSTERED 
(
	[idTypZlecenia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Zamówienie]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zamówienie](
	[idZamówienie] [int] NOT NULL,
	[idKlient] [int] NOT NULL,
	[idPracownikOdpowiedzialny] [int] NOT NULL,
	[idTypZamówienia] [int] NOT NULL,
	[idStatusZamówienia] [int] NOT NULL,
	[idPojazd] [int] NOT NULL,
	[dataUtworzenia] [date] NULL,
	[dataRealizacji] [date] NULL,
 CONSTRAINT [PK_Zamówienie] PRIMARY KEY CLUSTERED 
(
	[idZamówienie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ZlecenieSerwisowe]    Script Date: 2015-03-19 12:06:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZlecenieSerwisowe](
	[idZlecenieSerwisowe] [int] NOT NULL,
	[idPracownikPrzydzielony] [int] NOT NULL,
	[idTypZlecenia] [int] NOT NULL,
	[idPojazd] [int] NOT NULL,
	[idDocelowaKonfiguracja] [int] NOT NULL,
	[opis] [varchar](50) NULL,
	[dataUtworzenia] [date] NULL,
	[dataRealizacji] [date] NULL,
 CONSTRAINT [PK_ZlecenieSerwisowe] PRIMARY KEY CLUSTERED 
(
	[idZlecenieSerwisowe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Klient]  WITH CHECK ADD  CONSTRAINT [FK_Klient_Firma] FOREIGN KEY([idFirma])
REFERENCES [dbo].[Firma] ([idFirma])
GO
ALTER TABLE [dbo].[Klient] CHECK CONSTRAINT [FK_Klient_Firma]
GO
ALTER TABLE [dbo].[KonfiguracjaPojazduXref]  WITH CHECK ADD  CONSTRAINT [FK_KonfiguracjaPojazduXref_OpcjaKonfiguracji] FOREIGN KEY([idOpcjaKonfiguracji])
REFERENCES [dbo].[OpcjaKonfiguracji] ([idOpcjaKonfiguracji])
GO
ALTER TABLE [dbo].[KonfiguracjaPojazduXref] CHECK CONSTRAINT [FK_KonfiguracjaPojazduXref_OpcjaKonfiguracji]
GO
ALTER TABLE [dbo].[KonfiguracjaPojazduXref]  WITH CHECK ADD  CONSTRAINT [FK_KonfiguracjaPojazduXref_Pojazd] FOREIGN KEY([idPojazd])
REFERENCES [dbo].[Pojazd] ([idPojazd])
GO
ALTER TABLE [dbo].[KonfiguracjaPojazduXref] CHECK CONSTRAINT [FK_KonfiguracjaPojazduXref_Pojazd]
GO
ALTER TABLE [dbo].[KonfiguracjaPojazduXref]  WITH CHECK ADD  CONSTRAINT [FK_KonfiguracjaPojazduXref_ZlecenieSerwisowe] FOREIGN KEY([idZlecenieSerwisowe])
REFERENCES [dbo].[ZlecenieSerwisowe] ([idZlecenieSerwisowe])
GO
ALTER TABLE [dbo].[KonfiguracjaPojazduXref] CHECK CONSTRAINT [FK_KonfiguracjaPojazduXref_ZlecenieSerwisowe]
GO
ALTER TABLE [dbo].[LokalizacjaPojazdu]  WITH CHECK ADD  CONSTRAINT [FK_LokalizacjaPojazdu_Pojazd] FOREIGN KEY([idPojazd])
REFERENCES [dbo].[Pojazd] ([idPojazd])
GO
ALTER TABLE [dbo].[LokalizacjaPojazdu] CHECK CONSTRAINT [FK_LokalizacjaPojazdu_Pojazd]
GO
ALTER TABLE [dbo].[LokalizacjaPojazdu]  WITH CHECK ADD  CONSTRAINT [FK_LokalizacjaPojazdu_Salon] FOREIGN KEY([idSalonu])
REFERENCES [dbo].[Salon] ([idSalon])
GO
ALTER TABLE [dbo].[LokalizacjaPojazdu] CHECK CONSTRAINT [FK_LokalizacjaPojazdu_Salon]
GO
ALTER TABLE [dbo].[Pojazd]  WITH CHECK ADD  CONSTRAINT [FK_Pojazd_Lakier] FOREIGN KEY([idLakier])
REFERENCES [dbo].[Lakier] ([idLakier])
GO
ALTER TABLE [dbo].[Pojazd] CHECK CONSTRAINT [FK_Pojazd_Lakier]
GO
ALTER TABLE [dbo].[Pojazd]  WITH CHECK ADD  CONSTRAINT [FK_Pojazd_Marka] FOREIGN KEY([idMarka])
REFERENCES [dbo].[Marka] ([idMarka])
GO
ALTER TABLE [dbo].[Pojazd] CHECK CONSTRAINT [FK_Pojazd_Marka]
GO
ALTER TABLE [dbo].[Pojazd]  WITH CHECK ADD  CONSTRAINT [FK_Pojazd_Model] FOREIGN KEY([idModel])
REFERENCES [dbo].[Model] ([idModel])
GO
ALTER TABLE [dbo].[Pojazd] CHECK CONSTRAINT [FK_Pojazd_Model]
GO
ALTER TABLE [dbo].[Pojazd]  WITH CHECK ADD  CONSTRAINT [FK_Pojazd_Nadwozie] FOREIGN KEY([idNadwozie])
REFERENCES [dbo].[Nadwozie] ([idNadwozie])
GO
ALTER TABLE [dbo].[Pojazd] CHECK CONSTRAINT [FK_Pojazd_Nadwozie]
GO
ALTER TABLE [dbo].[Pojazd]  WITH CHECK ADD  CONSTRAINT [FK_Pojazd_Silnik] FOREIGN KEY([idSilnik])
REFERENCES [dbo].[Silnik] ([idSilnik])
GO
ALTER TABLE [dbo].[Pojazd] CHECK CONSTRAINT [FK_Pojazd_Silnik]
GO
ALTER TABLE [dbo].[Pojazd]  WITH CHECK ADD  CONSTRAINT [FK_Pojazd_StatusPojazdu] FOREIGN KEY([idStatusPojazdu])
REFERENCES [dbo].[StatusPojazdu] ([idStatusPojazdu])
GO
ALTER TABLE [dbo].[Pojazd] CHECK CONSTRAINT [FK_Pojazd_StatusPojazdu]
GO
ALTER TABLE [dbo].[Pracownik]  WITH CHECK ADD  CONSTRAINT [FK_Pracownik_Stanowisko] FOREIGN KEY([idStanowisko])
REFERENCES [dbo].[Stanowisko] ([idStanowisko])
GO
ALTER TABLE [dbo].[Pracownik] CHECK CONSTRAINT [FK_Pracownik_Stanowisko]
GO
ALTER TABLE [dbo].[Pracownik]  WITH CHECK ADD  CONSTRAINT [FK_Pracownik_PoziomUprawnien] FOREIGN KEY([idPoziomUprawnien])
REFERENCES [dbo].[PoziomUprawnien] ([idPoziomUprawnien])
GO
ALTER TABLE [dbo].[Pracownik] CHECK CONSTRAINT [FK_Pracownik_PoziomUprawnien]
GO
ALTER TABLE [dbo].[PracownikSalonXref]  WITH CHECK ADD  CONSTRAINT [FK_PracownikSalonXref_Pracownik] FOREIGN KEY([idPracownik])
REFERENCES [dbo].[Pracownik] ([idPracownik])
GO
ALTER TABLE [dbo].[PracownikSalonXref] CHECK CONSTRAINT [FK_PracownikSalonXref_Pracownik]
GO
ALTER TABLE [dbo].[PracownikSalonXref]  WITH CHECK ADD  CONSTRAINT [FK_PracownikSalonXref_Salon] FOREIGN KEY([idSalon])
REFERENCES [dbo].[Salon] ([idSalon])
GO
ALTER TABLE [dbo].[PracownikSalonXref] CHECK CONSTRAINT [FK_PracownikSalonXref_Salon]
GO
ALTER TABLE [dbo].[Zamówienie]  WITH CHECK ADD  CONSTRAINT [FK_Zamówienie_Klient] FOREIGN KEY([idKlient])
REFERENCES [dbo].[Klient] ([idKlient])
GO
ALTER TABLE [dbo].[Zamówienie] CHECK CONSTRAINT [FK_Zamówienie_Klient]
GO
ALTER TABLE [dbo].[Zamówienie]  WITH CHECK ADD  CONSTRAINT [FK_Zamówienie_Pojazd] FOREIGN KEY([idPojazd])
REFERENCES [dbo].[Pojazd] ([idPojazd])
GO
ALTER TABLE [dbo].[Zamówienie] CHECK CONSTRAINT [FK_Zamówienie_Pojazd]
GO
ALTER TABLE [dbo].[Zamówienie]  WITH CHECK ADD  CONSTRAINT [FK_Zamówienie_Pracownik] FOREIGN KEY([idPracownikOdpowiedzialny])
REFERENCES [dbo].[Pracownik] ([idPracownik])
GO
ALTER TABLE [dbo].[Zamówienie] CHECK CONSTRAINT [FK_Zamówienie_Pracownik]
GO
ALTER TABLE [dbo].[Zamówienie]  WITH CHECK ADD  CONSTRAINT [FK_Zamówienie_StatusZamówienia] FOREIGN KEY([idStatusZamówienia])
REFERENCES [dbo].[StatusZamówienia] ([idStatusZamówienia])
GO
ALTER TABLE [dbo].[Zamówienie] CHECK CONSTRAINT [FK_Zamówienie_StatusZamówienia]
GO
ALTER TABLE [dbo].[Zamówienie]  WITH CHECK ADD  CONSTRAINT [FK_Zamówienie_TypZamówienia] FOREIGN KEY([idTypZamówienia])
REFERENCES [dbo].[TypZamówienia] ([idTypZamówienia])
GO
ALTER TABLE [dbo].[Zamówienie] CHECK CONSTRAINT [FK_Zamówienie_TypZamówienia]
GO
ALTER TABLE [dbo].[ZlecenieSerwisowe]  WITH CHECK ADD  CONSTRAINT [FK_ZlecenieSerwisowe_Pojazd] FOREIGN KEY([idPojazd])
REFERENCES [dbo].[Pojazd] ([idPojazd])
GO
ALTER TABLE [dbo].[ZlecenieSerwisowe] CHECK CONSTRAINT [FK_ZlecenieSerwisowe_Pojazd]
GO
ALTER TABLE [dbo].[ZlecenieSerwisowe]  WITH CHECK ADD  CONSTRAINT [FK_ZlecenieSerwisowe_Pracownik] FOREIGN KEY([idPracownikPrzydzielony])
REFERENCES [dbo].[Pracownik] ([idPracownik])
GO
ALTER TABLE [dbo].[ZlecenieSerwisowe] CHECK CONSTRAINT [FK_ZlecenieSerwisowe_Pracownik]
GO
ALTER TABLE [dbo].[ZlecenieSerwisowe]  WITH CHECK ADD  CONSTRAINT [FK_ZlecenieSerwisowe_TypZlecenia] FOREIGN KEY([idTypZlecenia])
REFERENCES [dbo].[TypZlecenia] ([idTypZlecenia])
GO
ALTER TABLE [dbo].[ZlecenieSerwisowe] CHECK CONSTRAINT [FK_ZlecenieSerwisowe_TypZlecenia]
GO
USE [master]
GO
ALTER DATABASE [Salon] SET  READ_WRITE 
GO
