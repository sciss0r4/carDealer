USE [master]
GO
/****** Object:  Database [Salon]    Script Date: 2015-05-29 22:04:15 ******/
CREATE DATABASE [Salon]
 CONTAINMENT = NONE
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
ALTER DATABASE [Salon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Salon] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Salon] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Salon', N'ON'
GO
USE [Salon]
GO
/****** Object:  UserDefinedTableType [dbo].[ConfigList]    Script Date: 2015-05-29 22:04:15 ******/
CREATE TYPE [dbo].[ConfigList] AS TABLE(
	[Id] [int] NULL
)
GO
/****** Object:  Table [dbo].[Firma]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  Table [dbo].[Klient]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  Table [dbo].[KonfiguracjaPojazduXref]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KonfiguracjaPojazduXref](
	[idPojazd] [int] NULL,
	[idOpcjaKonfiguracji] [int] NOT NULL,
	[idZlecenieSerwisowe] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lakier]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  Table [dbo].[LokalizacjaPojazdu]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  Table [dbo].[Marka]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  Table [dbo].[Model]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Model](
	[idModel] [int] NOT NULL,
	[idMarka] [int] NOT NULL,
	[nazwaModelu] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[idModel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ModelLakierXref]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModelLakierXref](
	[idModel] [int] NOT NULL,
	[idLakier] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ModelSilnikXref]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModelSilnikXref](
	[idModel] [int] NOT NULL,
	[idSilnik] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nadwozie]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  Table [dbo].[OpcjaKonfiguracji]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  Table [dbo].[Pojazd]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pojazd](
	[idPojazd] [int] IDENTITY(1,1) NOT NULL,
	[idNadwozie] [int] NOT NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[VIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PoziomUprawnien]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  Table [dbo].[Pracownik]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  Table [dbo].[PracownikSalonXref]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PracownikSalonXref](
	[idPracownik] [int] NOT NULL,
	[idSalon] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salon]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  Table [dbo].[Silnik]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  Table [dbo].[Stanowisko]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  Table [dbo].[StatusPojazdu]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  Table [dbo].[StatusZamówienia]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  Table [dbo].[TypZamówienia]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  Table [dbo].[TypZlecenia]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[UserPasswordSHA] [varbinary](20) NOT NULL,
	[IdPracownik] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Zamówienie]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zamówienie](
	[idZamówienie] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[ZlecenieSerwisowe]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ZlecenieSerwisowe](
	[idZlecenieSerwisowe] [int] IDENTITY(1,1) NOT NULL,
	[idPracownikPrzydzielony] [int] NOT NULL,
	[idTypZlecenia] [int] NOT NULL,
	[idPojazd] [int] NOT NULL,
	[idDocelowaKonfiguracja] [int] NULL,
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
ALTER TABLE [dbo].[Model]  WITH CHECK ADD  CONSTRAINT [FK_Model_Marka] FOREIGN KEY([idMarka])
REFERENCES [dbo].[Marka] ([idMarka])
GO
ALTER TABLE [dbo].[Model] CHECK CONSTRAINT [FK_Model_Marka]
GO
ALTER TABLE [dbo].[ModelLakierXref]  WITH CHECK ADD  CONSTRAINT [FK_ModelLakierXref_Lakier] FOREIGN KEY([idLakier])
REFERENCES [dbo].[Lakier] ([idLakier])
GO
ALTER TABLE [dbo].[ModelLakierXref] CHECK CONSTRAINT [FK_ModelLakierXref_Lakier]
GO
ALTER TABLE [dbo].[ModelLakierXref]  WITH CHECK ADD  CONSTRAINT [FK_ModelLakierXref_Model] FOREIGN KEY([idModel])
REFERENCES [dbo].[Model] ([idModel])
GO
ALTER TABLE [dbo].[ModelLakierXref] CHECK CONSTRAINT [FK_ModelLakierXref_Model]
GO
ALTER TABLE [dbo].[ModelSilnikXref]  WITH CHECK ADD  CONSTRAINT [FK_ModelSilnikXref_Model] FOREIGN KEY([idModel])
REFERENCES [dbo].[Model] ([idModel])
GO
ALTER TABLE [dbo].[ModelSilnikXref] CHECK CONSTRAINT [FK_ModelSilnikXref_Model]
GO
ALTER TABLE [dbo].[ModelSilnikXref]  WITH CHECK ADD  CONSTRAINT [FK_ModelSilnikXref_Silnik] FOREIGN KEY([idSilnik])
REFERENCES [dbo].[Silnik] ([idSilnik])
GO
ALTER TABLE [dbo].[ModelSilnikXref] CHECK CONSTRAINT [FK_ModelSilnikXref_Silnik]
GO
ALTER TABLE [dbo].[Pojazd]  WITH CHECK ADD  CONSTRAINT [FK_Pojazd_Lakier] FOREIGN KEY([idLakier])
REFERENCES [dbo].[Lakier] ([idLakier])
GO
ALTER TABLE [dbo].[Pojazd] CHECK CONSTRAINT [FK_Pojazd_Lakier]
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
ALTER TABLE [dbo].[Pracownik]  WITH CHECK ADD  CONSTRAINT [FK_Pracownik_PoziomUprawnien] FOREIGN KEY([idPoziomUprawnien])
REFERENCES [dbo].[PoziomUprawnien] ([idPoziomUprawnien])
GO
ALTER TABLE [dbo].[Pracownik] CHECK CONSTRAINT [FK_Pracownik_PoziomUprawnien]
GO
ALTER TABLE [dbo].[Pracownik]  WITH CHECK ADD  CONSTRAINT [FK_Pracownik_Stanowisko] FOREIGN KEY([idStanowisko])
REFERENCES [dbo].[Stanowisko] ([idStanowisko])
GO
ALTER TABLE [dbo].[Pracownik] CHECK CONSTRAINT [FK_Pracownik_Stanowisko]
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
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_IdPracownik] FOREIGN KEY([IdPracownik])
REFERENCES [dbo].[Pracownik] ([idPracownik])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_IdPracownik]
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
/****** Object:  StoredProcedure [dbo].[ap_AddPracownik]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ap_AddPracownik] 
@idPracownik int,
@nazwisko VARCHAR(50),
@imie VARCHAR(50),
@wynagrodzenie FLOAT,
@dataUrodzenia DATE,
@idStanowisko INT,
@idPoziomUprawnien INT
AS
BEGIN

DECLARE @count INT

SELECT @count = COUNT(*)
FROM dbo.[Stanowisko]
JOIN dbo.[PoziomUprawnien] ON idPoziomUprawnien = @idPoziomUprawnien
WHERE idStanowisko = @idStanowisko


IF(@count > 0) 
BEGIN
INSERT INTO dbo.[Pracownik] (idPracownik,nazwisko,imię,wynagrodzenie,dataUrodzenia,idStanowisko,idPoziomUprawnien)
VALUES (@idPracownik,@nazwisko,@imie,@wynagrodzenie,@dataUrodzenia,@idStanowisko,@idPoziomUprawnien);
END
ELSE
BEGIN
PRINT 'Nie można dodać pracownika bez istniejącego stanowiska lub poziomu uprawnień';
END

RETURN 0;

END





















GO
/****** Object:  StoredProcedure [dbo].[ap_AddSalon]    Script Date: 2015-05-29 22:04:15 ******/
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
INSERT INTO dbo.[Salon] (idSalon, ulica, nrDomu, nrLokalu, miejscowość, kodPocztowy, nazwaSalonu)
VALUES (@idSalon, @ulica, @nrDomu, @nrLokalu, @miejscowosc, @kodPocztowy, @nazwaSalonu)
END





















GO
/****** Object:  StoredProcedure [dbo].[ap_AddUser]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ap_AddUser] 
@userName NVARCHAR(MAX),
@password NVARCHAR(MAX),
@idPracownik INT
AS
BEGIN

DECLARE @userCount INT
DECLARE @workerCount INT

SELECT @userCount = COUNT(*)
FROM dbo.[Pracownik] p
JOIN dbo.[User] u ON u.idPracownik = @idPracownik
WHERE p.idPracownik = @idPracownik

SELECT @workerCount = COUNT(*)
FROM dbo.[Pracownik] p
WHERE p.idPracownik = @idPracownik

IF(@workerCount = 1 AND @userCount = 0) 
BEGIN
INSERT INTO dbo.[User] (UserName,UserPasswordSHA,IdPracownik)
	VALUES (@userName,HASHBYTES('SHA1',@password),@idPracownik)
END
ELSE
BEGIN
PRINT 'Podany pracownik nie istnieje, bądź został już przypisany do niego użytkownik';
END


END





















GO
/****** Object:  StoredProcedure [dbo].[usp_AddCar]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_AddClient]    Script Date: 2015-05-29 22:04:15 ******/
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
INSERT INTO dbo.[Klient] (nazwisko,imie,PESEL,ulica,nrDomu,nrLokalu,miejscowość,kodPocztowy,dataUrodzenia,idFirma)
	VALUES (@nazwisko,@imie,@pesel,@ulica,@nrDomu,@nrLokalu,@miejscowosc,@kodPocztowy,@dataUrodzenia,null)
END













GO
/****** Object:  StoredProcedure [dbo].[usp_AddOrder]    Script Date: 2015-05-29 22:04:15 ******/
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
PRINT 'Pojazd nie jest dostępny na sprzedaż. Nie można utworzyć zamówienia.'
END
ELSE
BEGIN

UPDATE [dbo].Pojazd  
SET idStatusPojazdu = 2 
WHERE idPojazd = @carId

INSERT INTO [dbo].[Zamówienie] (idKlient,idPracownikOdpowiedzialny,idTypZamówienia,idStatusZamówienia,idPojazd,dataUtworzenia)
VALUES (@clientId,@workerId,1,1,@carId,GETDATE())
END

RETURN 0;

END









GO
/****** Object:  StoredProcedure [dbo].[usp_AddService]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AddService] 
@idPracownik INT,
@idTypZlecenia INT,
@idPojazd INT,
@opis NVARCHAR(MAX),
@optionsList As [dbo].[ConfigList] Readonly
AS
BEGIN

DECLARE @confCount INT
DECLARE @prevCount INT
DECLARE @joinCount INT

--Sprawdź czy konfiguracja się zmieniła
SELECT @prevCount = COUNT(o.Id)
FROM @optionsList o

SELECT @confCount = COUNT(x.idOpcjaKonfiguracji)
FROM KonfiguracjaPojazduXref x
WHERE x.idPojazd = @idPojazd

SELECT @joinCount = COUNT(x.idOpcjaKonfiguracji)
FROM KonfiguracjaPojazduXref x
JOIN @optionsList o ON o.Id = x.idOpcjaKonfiguracji
WHERE x.idPojazd = @idPojazd

INSERT INTO ZlecenieSerwisowe VALUES (@idPracownik,@idTypZlecenia,@idPojazd,NULL,@opis,GETDATE(),NULL)

DECLARE @idNewConfig INT
DECLARE @highestID INT

IF(NOT (@prevCount = @confCount AND @joinCount = @confCount))
BEGIN

SELECT TOP 1 @highestID = z.idZlecenieSerwisowe
FROM ZlecenieSerwisowe z
ORDER BY z.idZlecenieSerwisowe DESC

IF(@prevCount != 0)
BEGIN
DECLARE opcja_cursor CURSOR FOR 
SELECT Id
FROM @optionsList o
ORDER BY o.Id

DECLARE @opcjaId INT

OPEN opcja_cursor

FETCH NEXT FROM opcja_cursor
INTO @opcjaId

WHILE @@FETCH_STATUS = 0
BEGIN

INSERT INTO dbo.KonfiguracjaPojazduXref VALUES (NULL,@opcjaId,@highestID)

FETCH NEXT FROM opcja_cursor
INTO @opcjaId
END
END

CLOSE opcja_cursor;
DEALLOCATE opcja_cursor;

UPDATE ZlecenieSerwisowe SET idDocelowaKonfiguracja = @highestID WHERE idZlecenieSerwisowe = @highestID

END
ELSE
BEGIN
SET @idNewConfig = NULL
END

SELECT * FROM Pojazd

END



GO
/****** Object:  StoredProcedure [dbo].[usp_AddUser]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_AddUser] @userName NVARCHAR(MAX), @password NVARCHAR(MAX) AS
BEGIN

DECLARE @userExist INT

SELECT @userExist = COUNT(*) 
FROM dbo.[User] 
WHERE UserName = @userName

IF(@userExist = 0)
BEGIN
	INSERT INTO dbo.[User] (UserName,UserPasswordSHA)
	VALUES (@userName, HASHBYTES('SHA1',@password))
END
ELSE
BEGIN
	PRINT 'User name is already used.';
END

END;

















GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteCar]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_GetAllBrands]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllBrands] 
AS
BEGIN
SELECT * FROM dbo.[Marka]
END


















GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllCarBodies]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetAllCarBodies]
AS
BEGIN
SELECT * FROM dbo.[Nadwozie];
END














GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllCarModelsWithBrands]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetAllCarModelsWithBrands]
AS
BEGIN
SELECT * FROM dbo.[Model] LEFT JOIN dbo.[Marka] ON [Marka].idMarka=[Model].idMarka;
END
-- =============================================












GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllCars]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetAllCars] 
AS
BEGIN
SELECT dbo.[Pojazd].VIN, dbo.[Marka].nazwaMarki, dbo.[Model].nazwaModelu, dbo.[Silnik].nazwaKodowa
FROM dbo.[Pojazd] 
LEFT JOIN dbo.[Model] ON dbo.[Pojazd].idModel=dbo.[Model].idModel
LEFT JOIN dbo.[Marka] ON dbo.[Model].idMarka=dbo.[Marka].idMarka
LEFT JOIN dbo.[Silnik] ON dbo.[Pojazd].idSilnik=dbo.[Silnik].idSilnik 
END







GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllCarStatuses]    Script Date: 2015-05-29 22:04:15 ******/
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













GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllConfigurationOptions]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_GetAllOrdersWithAllParameters]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetAllOrdersWithAllParameters] AS
BEGIN

SELECT z.idZamówienie, z.dataUtworzenia,
t.typZamówienia,
k.idFirma, k.idKlient, k.nazwisko AS 'nazwiskoKlienta', k.imie AS 'imieKlienta',
prac.idPracownik, prac.nazwisko AS 'nazwiskoPracownika', prac.imię AS 'imięPracownika',
poj.idPojazd, poj.cena,
model.nazwaModelu,
marka.nazwaMarki,
l.typLakieru 
FROM Zamówienie z
JOIN TypZamówienia t ON t.idTypZamówienia=z.idTypZamówienia
JOIN Klient k ON k.idKlient=z.idKlient 
JOIN Pracownik prac ON prac.idPracownik=z.idPracownikOdpowiedzialny
JOIN Pojazd poj ON poj.idPojazd=z.idPojazd
JOIN Model model ON model.idModel=poj.idModel
JOIN Marka marka ON model.idMarka=marka.idMarka
JOIN Lakier l ON l.idLakier=poj.idLakier

END




GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllServices]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetAllServices] AS
BEGIN
SELECT 
zs.idZlecenieSerwisowe AS 'idService',
ma.nazwaMarki + ' ' + m.nazwaModelu + ' ' +
+ n.typ + ' ' + s.nazwaKodowa + ' ' + CAST(s.moc AS nvarchar(max)) + ' kW' + ' ' +l.typLakieru  + ' '
+ p.VIN + CHAR(13) + CHAR(10) 
+ tz.TypZlecenia + CHAR(13) + CHAR(10) 
+ pr.nazwisko + ' ' + pr.imię + CHAR(13) + CHAR(10) 
+ CAST(zs.dataUtworzenia AS nvarchar(MAX))
AS 'serviceQuery'
FROM ZlecenieSerwisowe zs
JOIN Pojazd p ON p.idPojazd = zs.idPojazd
JOIN Model m ON m.idModel = p.idModel
JOIN Marka ma ON ma.idMarka = m.idMarka
JOIN Nadwozie n ON n.idNadwozie = p.idNadwozie
JOIN Silnik s ON s.idSilnik = p.idSilnik
JOIN Lakier l ON l.idLakier = p.idLakier
JOIN TypZlecenia tz ON tz.idTypZlecenia = zs.idTypZlecenia
JOIN Pracownik pr ON pr.idPracownik = zs.idPracownikPrzydzielony
END

--SELECT * FROM ZlecenieSerwisowe

GO
/****** Object:  StoredProcedure [dbo].[usp_GetCarOptionsForCarID]    Script Date: 2015-05-29 22:04:15 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_GetCarsByVIN]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetCarsByVIN] 
@VIN NVARCHAR(MAX)
AS 
BEGIN

SELECT p.idPojazd AS 'idCar',
ma.nazwaMarki + ' ' + m.nazwaModelu + CHAR(13) + CHAR(10) 
+ n.typ + ' ' + s.nazwaKodowa + ' ' + CAST(s.moc AS nvarchar(max)) + ' kW' + ' ' +l.typLakieru + CHAR(13) + CHAR(10) 
+ p.VIN
AS 'carName'
FROM Pojazd p
JOIN Model m ON m.idModel = p.idModel
JOIN Marka ma ON ma.idMarka = m.idMarka
JOIN Nadwozie n ON n.idNadwozie = p.idNadwozie
JOIN Silnik s ON s.idSilnik = p.idSilnik
JOIN Lakier l ON l.idLakier = p.idLakier
WHERE p.VIN LIKE ('%' + @VIN + '%')
END





GO
/****** Object:  StoredProcedure [dbo].[usp_GetClientInfoById]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetClientInfoById] @id INT 
AS
BEGIN
SELECT * 
FROM dbo.[Klient]
WHERE idKlient = @id;
END





















GO
/****** Object:  StoredProcedure [dbo].[usp_GetClientsNamesByPattern]    Script Date: 2015-05-29 22:04:15 ******/
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
miejscowość LIKE '%' + @miejscowosc + '%' OR
nazwisko LIKE '%' + @nazwisko + '%' OR
ulica LIKE '%' + @ulica + '%' OR
nazwisko LIKE '%' + @nazwisko + '%' OR
pesel LIKE '%' + @pesel + '%';
END





















GO
/****** Object:  StoredProcedure [dbo].[usp_GetEngineFullNamesForModelId]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetEngineFullNamesForModelId]
@modelId INT
AS
BEGIN
SELECT 
s.idSilnik, 
s.nazwaKodowa + ', ' + CAST(s.moc AS NVARCHAR(MAX)) + ' kW, ' + CAST(s.pojemność AS NVARCHAR(MAX)) + ' cm3' AS 'engineFullName'
FROM dbo.[Model] m
JOIN dbo.[ModelSilnikXref] x ON x.idModel = m.idModel
JOIN dbo.[Silnik] s ON s.idSilnik = x.idSilnik
WHERE m.idModel = @modelId
END













GO
/****** Object:  StoredProcedure [dbo].[usp_GetMatchingCars]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetMatchingCars]
@modelId INT,
@bodyId INT,
@paintId INT,
@engineId INT,
@configList As [dbo].[ConfigList] Readonly
AS
BEGIN

SELECT ma.nazwaMarki + ' ' + m.nazwaModelu + ' ' + n.typ + ' ' + s.nazwaKodowa + ' ' + CAST(s.moc AS NVARCHAR(MAX)) + ' kW' AS 'Pojazd', 
sa.nazwaSalonu + ', ' + sa.miejscowość AS 'Lokalizacja', 
p.cena AS 'Cena',
p.idPojazd
INTO #PojazdyTemp
FROM dbo.[Pojazd] p
JOIN dbo.[Model] m ON m.idModel = p.idModel
JOIN dbo.[Marka] ma ON ma.idMarka = m.idMarka
JOIN dbo.[Nadwozie] n ON n.idNadwozie = p.idNadwozie
JOIN dbo.[Silnik] s ON s.idSilnik = p.idSilnik
JOIN dbo.[LokalizacjaPojazdu] lp ON lp.idPojazd = p.idPojazd
JOIN dbo.[Salon] sa ON sa.idSalon = lp.idSalonu
WHERE p.idModel = @modelId AND
p.idNadwozie = @bodyId AND
p.idLakier = @paintId AND
p.idSilnik = @engineId AND
p.idStatusPojazdu = 1

DECLARE @matchCount INT

SELECT @matchCount = COUNT(*) 
FROM #PojazdyTemp t
JOIN dbo.[Pojazd] p ON p.idPojazd = t.[idPojazd]
JOIN dbo.[KonfiguracjaPojazduXref] x ON x.idPojazd = p.idPojazd
JOIN @configList c ON c.Id = x.idOpcjaKonfiguracji

DECLARE @optionCount INT

SELECT @optionCount = COUNT(*)
FROM @configList

IF(@matchCount = @optionCount)
BEGIN
	SELECT *, 'Tak' AS 'Wszystkie opcje?' FROM #PojazdyTemp
END
ELSE
BEGIN
	SELECT *, 'Nie' AS 'Wszystkie opcje?' FROM #PojazdyTemp
END

END











GO
/****** Object:  StoredProcedure [dbo].[usp_GetModelsForBrandId]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetModelsForBrandId] 
@brandId INT
AS
BEGIN
SELECT idModel,nazwaModelu 
FROM dbo.[Model]
WHERE idMarka = @brandId;
END
















GO
/****** Object:  StoredProcedure [dbo].[usp_GetOrderData]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetOrderData] 
@orderId INT
AS
BEGIN
SELECT k.imie AS 'ImieKlienta',
k.nazwisko AS 'NazwiskoKlienta',
k.PESEL AS 'PeselKlienta',
k.miejscowość AS 'MiejscowoscKlienta',
k.ulica AS 'UlicaKlienta',
k.nrDomu AS 'NrDomuKlienta',
k.nrLokalu AS 'NrLokaluKlienta',
k.kodPocztowy AS 'KodPocztowyKlienta',
k.dataUrodzenia AS 'DataUrodzeniaKlienta',
p.imię AS 'ImiePracownika',
p.nazwisko AS 'NazwiskoPracownika',
sz.statusZamówienia AS 'StatusZamowienia',
ma.nazwaMarki AS 'MarkaPojazdu',
m.nazwaModelu AS 'ModelPojazdu',
n.typ AS 'NadwoziePojazdu',
s.nazwaKodowa + ', ' + CAST(s.moc AS NVARCHAR(MAX)) + ' kW, ' + CAST(s.pojemność AS NVARCHAR(MAX)) + ' cm3' AS 'SilnikPojazdu',
l.typLakieru AS 'LakierPojazdu',
po.VIN AS 'VINPojazdu',
po.przebieg AS 'PrzebiegPojazdu',
po.krajProdukcji AS 'KrajPojazdu',
po.cena AS 'CenaPojazdu',
po.rokProdukcji AS 'RokPojazdu'
FROM Zamówienie z
JOIN Klient k ON k.idKlient = z.idKlient
JOIN Pracownik p ON p.idPracownik = z.idPracownikOdpowiedzialny
JOIN StatusZamówienia sz ON sz.idStatusZamówienia = z.idStatusZamówienia
JOIN Pojazd po ON po.idPojazd = z.idPojazd
JOIN Model m ON m.idModel = po.idModel
JOIN Marka ma ON ma.idMarka = m.idMarka
JOIN Nadwozie n ON n.idNadwozie = po.idNadwozie
JOIN Silnik s ON s.idSilnik = po.idSilnik
JOIN Lakier l ON l.idLakier = po.idLakier
WHERE z.idZamówienie = @orderId
END


GO
/****** Object:  StoredProcedure [dbo].[usp_GetOrdersForClientId]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetOrdersForClientId]
@clientId INT
AS
BEGIN
SELECT z.idZamówienie, ma.nazwaMarki + ' ' + m.nazwaModelu + ' ' + n.typ + ' ' + s.nazwaKodowa + ' ' + CAST(s.moc AS NVARCHAR(MAX)) + ' kW' AS 'nazwaZamowienia'
FROM Zamówienie z
JOIN Pojazd p ON z.idPojazd = p.idPojazd
JOIN Model m ON m.idModel = p.idModel
JOIN Marka ma ON ma.idMarka = m.idMarka
JOIN Nadwozie n ON n.idNadwozie = p.idNadwozie
JOIN Silnik s ON s.idSilnik = p.idSilnik
WHERE z.idKlient = @clientId
END







GO
/****** Object:  StoredProcedure [dbo].[usp_GetPaintsForModelId]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetPaintsForModelId]
@modelId INT
AS
BEGIN

SELECT l.idLakier, l.typLakieru 
FROM dbo.[Model] m
JOIN dbo.[ModelLakierXref] x ON x.idModel = m.idModel
JOIN dbo.[Lakier] l ON l.idLakier = x.idLakier
WHERE m.idModel = @modelId;

END















GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserPermissions]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetUserPermissions] 
@userName NVARCHAR(MAX),
@password NVARCHAR(MAX)
AS 
BEGIN
SELECT pu.idPoziomUprawnien
FROM dbo.[User] u
JOIN dbo.[Pracownik] p ON p.idPracownik = u.IdPracownik
JOIN dbo.PoziomUprawnien pu ON pu.idPoziomUprawnien = p.idPoziomUprawnien
WHERE u.UserName = @userName AND u.UserPasswordSHA = HASHBYTES('SHA1',@password);
END





GO
/****** Object:  StoredProcedure [dbo].[usp_usp_GetSalonSales]    Script Date: 2015-06-07 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetSalonSales] AS
BEGIN
SELECT 
s.idSalon, s.miejscowość, s.nazwaSalonu,
COUNT(z.idZamówienie) AS 'iloscZamowien'
FROM dbo.Salon s
LEFT JOIN dbo.PracownikSalonXref x ON s.idSalon=x.idSalon
LEFT JOIN dbo.Pracownik p ON p.idPracownik=x.idPracownik
LEFT JOIN dbo.Zamówienie z ON p.idPracownik=z.idPracownikOdpowiedzialny
GROUP BY s.idSalon, s.miejscowość, s.nazwaSalonu
END


GO
/****** Object:  StoredProcedure [dbo].[usp_usp_GetCarSales]    Script Date: 2015-06-07 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetCarSales] AS
BEGIN
SELECT model.nazwaModelu,
marka.nazwaMarki,
COUNT(z.idZamówienie) AS 'iloscZamowien'
FROM dbo.Model model
LEFT JOIN dbo.Marka marka ON marka.idMarka=model.idMarka
LEFT JOIN dbo.Pojazd p ON p.idModel=model.idModel
LEFT JOIN dbo.Zamówienie z ON z.idPojazd=p.idPojazd
GROUP BY model.nazwaModelu, marka.nazwaMarki
END





GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserPermissionsAndName]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetUserPermissionsAndName] 
@userName NVARCHAR(MAX),
@password NVARCHAR(MAX)
AS 
BEGIN
SELECT pu.idPoziomUprawnien, p.nazwisko + ', ' + p.imię AS 'Name', p.idPracownik
FROM dbo.[User] u
JOIN dbo.[Pracownik] p ON p.idPracownik = u.IdPracownik
JOIN dbo.PoziomUprawnien pu ON pu.idPoziomUprawnien = p.idPoziomUprawnien
WHERE u.UserName = @userName AND u.UserPasswordSHA = HASHBYTES('SHA1',@password);
END










GO
/****** Object:  StoredProcedure [dbo].[usp_PasswordIsCorrect]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_PasswordIsCorrect] @userName NVARCHAR(MAX), @password NVARCHAR(MAX) AS
BEGIN
SELECT * FROM dbo.[User]
WHERE UserName = @userName AND UserPasswordSHA = HASHBYTES('SHA1',@password)
END;





















GO
/****** Object:  StoredProcedure [dbo].[usp_UserExists]    Script Date: 2015-05-29 22:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_UserExists] @userName NVARCHAR(MAX)
AS
BEGIN 
	SELECT TOP 1 * FROM dbo.[User] WHERE UserName = @userName
END





















GO
USE [master]
GO
ALTER DATABASE [Salon] SET  READ_WRITE 
GO

