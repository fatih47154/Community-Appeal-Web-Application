USE [master]
GO
/****** Object:  Database [ToplulukDB]    Script Date: 3.11.2018 01:53:46 ******/
CREATE DATABASE [ToplulukDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ToplulukDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ToplulukDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ToplulukDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ToplulukDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ToplulukDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToplulukDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToplulukDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToplulukDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToplulukDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ToplulukDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToplulukDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToplulukDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ToplulukDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToplulukDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToplulukDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToplulukDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToplulukDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToplulukDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToplulukDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ToplulukDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToplulukDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ToplulukDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToplulukDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToplulukDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToplulukDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToplulukDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToplulukDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ToplulukDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ToplulukDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ToplulukDB] SET  MULTI_USER 
GO
ALTER DATABASE [ToplulukDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToplulukDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ToplulukDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ToplulukDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ToplulukDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ToplulukDB', N'ON'
GO
USE [ToplulukDB]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 3.11.2018 01:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[adi] [nvarchar](50) NULL,
	[soyadi] [nvarchar](50) NULL,
	[eMail] [nvarchar](100) NULL,
	[sifre] [nvarchar](100) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Basvuru]    Script Date: 3.11.2018 01:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basvuru](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[toplulukAdi] [nvarchar](150) NULL,
	[toplulukAmac] [nvarchar](500) NULL,
	[baskanAdi] [nvarchar](100) NULL,
	[baskanSoyadi] [nvarchar](100) NULL,
	[tarih] [date] NULL,
	[saat] [nvarchar](50) NULL,
	[mekan] [nvarchar](100) NULL,
	[toplantiNo] [int] NULL,
	[adimNo] [int] NULL,
	[uyeSayisi] [int] NULL,
	[akademikYıl] [date] NULL,
	[toplantiTarihi] [date] NULL,
	[marscı] [nvarchar](100) NULL,
	[divanBaskanAdi] [nvarchar](100) NULL,
	[divanBaskanSoyadi] [nvarchar](100) NULL,
	[toplantiNiteligi] [bit] NULL,
	[kurulusTarihi] [date] NULL,
	[tuzukDegisikligi] [bit] NULL,
	[kullanıcıID] [int] NULL,
 CONSTRAINT [PK_Basvuru] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Danisman]    Script Date: 3.11.2018 01:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Danisman](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[adi] [nvarchar](50) NULL,
	[soyadi] [nvarchar](50) NULL,
	[unvan] [nvarchar](50) NULL,
	[akademikBirim] [nvarchar](150) NULL,
	[basvuruID] [int] NULL,
 CONSTRAINT [PK_Danisman] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DenetimKurulu]    Script Date: 3.11.2018 01:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DenetimKurulu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[adi] [nvarchar](50) NULL,
	[soyadi] [nvarchar](50) NULL,
	[unvan] [nvarchar](50) NULL,
	[basvuruID] [int] NULL,
 CONSTRAINT [PK_DenetimKurulu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FaliyetPlani]    Script Date: 3.11.2018 01:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaliyetPlani](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[faliyetID] [int] NULL,
	[faliyetTürü] [nvarchar](100) NULL,
	[faliyetAmaci] [nvarchar](500) NULL,
	[tarih] [date] NULL,
	[saat] [nvarchar](50) NULL,
	[yerleske] [nvarchar](50) NULL,
 CONSTRAINT [PK_FaliyetPlani] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 3.11.2018 01:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[adiSoyadi] [nvarchar](50) NULL,
	[ogrMail] [nvarchar](100) NULL,
	[sifre] [nvarchar](100) NULL,
	[ogrNo] [nvarchar](100) NULL,
	[tc] [nvarchar](100) NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OgrenciListesi]    Script Date: 3.11.2018 01:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OgrenciListesi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[adiSoyadi] [nvarchar](100) NULL,
	[fak] [nvarchar](200) NULL,
	[tc] [nvarchar](100) NULL,
	[ogrNo] [nvarchar](100) NULL,
	[tel] [nvarchar](100) NULL,
	[mail] [nvarchar](100) NULL,
	[basvuruID] [int] NULL,
 CONSTRAINT [PK_ogrenciListesi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YeniUye]    Script Date: 3.11.2018 01:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeniUye](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[adi] [nvarchar](50) NULL,
	[soyadi] [nvarchar](50) NULL,
	[basvuruID] [int] NULL,
 CONSTRAINT [PK_YeniUye] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YonetimKurulu]    Script Date: 3.11.2018 01:53:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YonetimKurulu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[adi] [nvarchar](50) NULL,
	[soyadi] [nvarchar](50) NULL,
	[unvan] [nvarchar](50) NULL,
	[bolum] [nvarchar](100) NULL,
	[adres] [nvarchar](500) NULL,
	[tc] [nvarchar](50) NULL,
	[fakulte] [nvarchar](100) NULL,
	[ogrNo] [nvarchar](50) NULL,
	[gsm] [nvarchar](50) NULL,
	[evTel] [nvarchar](50) NULL,
	[eMail] [nvarchar](100) NULL,
	[basvuruID] [int] NULL,
 CONSTRAINT [PK_YonetimKurulu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Basvuru]  WITH CHECK ADD  CONSTRAINT [FK_Basvuru_Kullanici] FOREIGN KEY([kullanıcıID])
REFERENCES [dbo].[Kullanici] ([ID])
GO
ALTER TABLE [dbo].[Basvuru] CHECK CONSTRAINT [FK_Basvuru_Kullanici]
GO
ALTER TABLE [dbo].[Danisman]  WITH CHECK ADD  CONSTRAINT [FK_Danisman_Basvuru] FOREIGN KEY([basvuruID])
REFERENCES [dbo].[Basvuru] ([ID])
GO
ALTER TABLE [dbo].[Danisman] CHECK CONSTRAINT [FK_Danisman_Basvuru]
GO
ALTER TABLE [dbo].[DenetimKurulu]  WITH CHECK ADD  CONSTRAINT [FK_DenetimKurulu_Basvuru] FOREIGN KEY([basvuruID])
REFERENCES [dbo].[Basvuru] ([ID])
GO
ALTER TABLE [dbo].[DenetimKurulu] CHECK CONSTRAINT [FK_DenetimKurulu_Basvuru]
GO
ALTER TABLE [dbo].[FaliyetPlani]  WITH CHECK ADD  CONSTRAINT [FK_FaliyetPlani_Basvuru] FOREIGN KEY([faliyetID])
REFERENCES [dbo].[Basvuru] ([ID])
GO
ALTER TABLE [dbo].[FaliyetPlani] CHECK CONSTRAINT [FK_FaliyetPlani_Basvuru]
GO
ALTER TABLE [dbo].[OgrenciListesi]  WITH CHECK ADD  CONSTRAINT [FK_OgrenciListesi_Basvuru] FOREIGN KEY([basvuruID])
REFERENCES [dbo].[Basvuru] ([ID])
GO
ALTER TABLE [dbo].[OgrenciListesi] CHECK CONSTRAINT [FK_OgrenciListesi_Basvuru]
GO
ALTER TABLE [dbo].[YeniUye]  WITH CHECK ADD  CONSTRAINT [FK_YeniUye_Basvuru] FOREIGN KEY([basvuruID])
REFERENCES [dbo].[Basvuru] ([ID])
GO
ALTER TABLE [dbo].[YeniUye] CHECK CONSTRAINT [FK_YeniUye_Basvuru]
GO
ALTER TABLE [dbo].[YonetimKurulu]  WITH CHECK ADD  CONSTRAINT [FK_YonetimKurulu_Basvuru] FOREIGN KEY([basvuruID])
REFERENCES [dbo].[Basvuru] ([ID])
GO
ALTER TABLE [dbo].[YonetimKurulu] CHECK CONSTRAINT [FK_YonetimKurulu_Basvuru]
GO
USE [master]
GO
ALTER DATABASE [ToplulukDB] SET  READ_WRITE 
GO
