USE [ToplulukDB]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 3.12.2018 17:56:24 ******/
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
/****** Object:  Table [dbo].[Basvuru]    Script Date: 3.12.2018 17:56:24 ******/
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
	[akademikYıl] [nvarchar](50) NULL,
	[toplantiTarihi] [date] NULL,
	[marscı] [nvarchar](100) NULL,
	[divanBaskanAdi] [nvarchar](100) NULL,
	[divanBaskanSoyadi] [nvarchar](100) NULL,
	[toplantiNiteligi] [bit] NULL,
	[kurulusTarihi] [date] NULL,
	[tuzukDegisikligi] [bit] NULL,
	[kullanıcıID] [int] NULL,
	[yazmanAdi] [nvarchar](50) NULL,
	[yazmanSoyadi] [nvarchar](50) NULL,
	[gUyeSayisi] [int] NULL,
	[etkinlik] [nvarchar](400) NULL,
	[butce] [nvarchar](400) NULL,
	[baskaKurul] [nvarchar](400) NULL,
	[bkUyeSecimi] [nvarchar](400) NULL,
 CONSTRAINT [PK_Basvuru] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Danisman]    Script Date: 3.12.2018 17:56:24 ******/
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
	[aktif] [bit] NULL,
 CONSTRAINT [PK_Danisman] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DenetimKurulu]    Script Date: 3.12.2018 17:56:24 ******/
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
	[ogrNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_DenetimKurulu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FaliyetPlani]    Script Date: 3.12.2018 17:56:24 ******/
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
/****** Object:  Table [dbo].[GDanisman]    Script Date: 3.12.2018 17:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDanisman](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[adi] [nvarchar](50) NULL,
	[soyadi] [nvarchar](50) NULL,
	[unvan] [nvarchar](50) NULL,
	[akademikBirim] [nvarchar](150) NULL,
	[GuncelleID] [int] NULL,
	[aktif] [bit] NULL,
 CONSTRAINT [PK_GDanisman] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GDenetimKurulu]    Script Date: 3.12.2018 17:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GDenetimKurulu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[adi] [nvarchar](50) NULL,
	[soyadi] [nvarchar](50) NULL,
	[unvan] [nvarchar](50) NULL,
	[GuncelleID] [int] NULL,
	[ogrNo] [nvarchar](50) NULL,
 CONSTRAINT [PK_GDenetimKurulu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GFaliyetPlani]    Script Date: 3.12.2018 17:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GFaliyetPlani](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[faliyetID] [int] NULL,
	[faliyetTürü] [nvarchar](100) NULL,
	[faliyetAmaci] [nvarchar](500) NULL,
	[tarih] [date] NULL,
	[saat] [nvarchar](50) NULL,
	[yerleske] [nvarchar](50) NULL,
 CONSTRAINT [PK_GFaliyetPlani] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GOgrenciListesi]    Script Date: 3.12.2018 17:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GOgrenciListesi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[adi] [nvarchar](100) NULL,
	[soyadi] [nvarchar](100) NULL,
	[fak] [nvarchar](200) NULL,
	[tc] [nvarchar](100) NULL,
	[ogrNo] [nvarchar](100) NULL,
	[tel] [nvarchar](100) NULL,
	[mail] [nvarchar](100) NULL,
	[GuncelleID] [int] NULL,
 CONSTRAINT [PK_GOgrenciListesi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Guncelle]    Script Date: 3.12.2018 17:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guncelle](
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
	[akademikYıl] [nvarchar](50) NULL,
	[toplantiTarihi] [date] NULL,
	[marscı] [nvarchar](100) NULL,
	[divanBaskanAdi] [nvarchar](100) NULL,
	[divanBaskanSoyadi] [nvarchar](100) NULL,
	[toplantiNiteligi] [bit] NULL,
	[kurulusTarihi] [date] NULL,
	[tuzukDegisikligi] [bit] NULL,
	[kullanıcıID] [int] NULL,
	[yazmanAdi] [nvarchar](50) NULL,
	[yazmanSoyadi] [nvarchar](50) NULL,
	[gUyeSayisi] [int] NULL,
	[etkinlik] [nvarchar](400) NULL,
	[butce] [nvarchar](400) NULL,
	[baskaKurul] [nvarchar](400) NULL,
	[bkUyeSecimi] [nvarchar](400) NULL,
 CONSTRAINT [PK_Guncelle] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GYeniUye]    Script Date: 3.12.2018 17:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GYeniUye](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[adi] [nvarchar](50) NULL,
	[soyadi] [nvarchar](50) NULL,
	[GuncelleID] [int] NULL,
 CONSTRAINT [PK_GYeniUye] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GYonetimKurulu]    Script Date: 3.12.2018 17:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GYonetimKurulu](
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
	[GuncelleID] [int] NULL,
 CONSTRAINT [PK_GYonetimKurulu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 3.12.2018 17:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[adi] [nvarchar](100) NULL,
	[soyadi] [nvarchar](100) NULL,
	[ogrMail] [nvarchar](100) NULL,
	[sifre] [nvarchar](100) NULL,
	[ogrNo] [nvarchar](100) NULL,
	[tc] [nvarchar](100) NULL,
	[kayitTarihi] [date] NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OgrenciListesi]    Script Date: 3.12.2018 17:56:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OgrenciListesi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[adi] [nvarchar](100) NULL,
	[soyadi] [nvarchar](100) NULL,
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
/****** Object:  Table [dbo].[YeniUye]    Script Date: 3.12.2018 17:56:24 ******/
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
/****** Object:  Table [dbo].[YonetimKurulu]    Script Date: 3.12.2018 17:56:24 ******/
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
	[Baskan] [bit] NULL,
 CONSTRAINT [PK_YonetimKurulu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([ID], [adi], [soyadi], [eMail], [sifre]) VALUES (1, N'Hamza', N'TAŞ', N'hamza.tas@gmail.com', N'123')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Basvuru] ON 

INSERT [dbo].[Basvuru] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID], [yazmanAdi], [yazmanSoyadi], [gUyeSayisi], [etkinlik], [butce], [baskaKurul], [bkUyeSecimi]) VALUES (2, N'aaa', N'aaa', N'aaa', N'aaa', NULL, N'2', N'aaa', 2, 5, 32, N'2018 - 2019', CAST(N'2018-11-11' AS Date), NULL, NULL, NULL, NULL, CAST(N'2018-11-11' AS Date), NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Basvuru] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID], [yazmanAdi], [yazmanSoyadi], [gUyeSayisi], [etkinlik], [butce], [baskaKurul], [bkUyeSecimi]) VALUES (3, N'Bilgisayar Mühendisleri', N'- İletişim becerilerini geliştirmek, - Paylaşmayı ve yardımlaşmayı öğretmek, yaşamlarına uygulamaya çalışmak - Zihinle beden hareketlerinin uyumlu çalışması özelliklerinin gelişmesine yardımcı olmak, - Spor kültürü ve ahlakı konusunda bilgi sahibi olmalarını sağlamak,', N'hamza', N'tas', NULL, NULL, NULL, NULL, 4, 35, N'2018 - 2019', CAST(N'2018-11-11' AS Date), N'Fatih Karaüzüm', N'fff', N'fff', NULL, CAST(N'2018-11-11' AS Date), NULL, 3, N'e', N'e', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Basvuru] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID], [yazmanAdi], [yazmanSoyadi], [gUyeSayisi], [etkinlik], [butce], [baskaKurul], [bkUyeSecimi]) VALUES (4, N'sdfsfdfdfdf', N'adsfsdfadfasdfsdf', NULL, NULL, CAST(N'2012-12-12' AS Date), N'05:00', N'Amfi', 3, 4, NULL, NULL, CAST(N'2018-01-18' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Basvuru] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID], [yazmanAdi], [yazmanSoyadi], [gUyeSayisi], [etkinlik], [butce], [baskaKurul], [bkUyeSecimi]) VALUES (8, N'Bilgisayar Mühendisleri', N'- İletişim becerilerini geliştirmek,', N'Hamza', N'Taş', NULL, N'00:00', N'Amfi', 1, 8, 35, N'2018 - 2019', CAST(N'2018-11-09' AS Date), N'Musa Aydın', N'Burak', N'Taşkın', NULL, CAST(N'2018-11-11' AS Date), NULL, 8, N'Musa', N'Aydın', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Basvuru] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID], [yazmanAdi], [yazmanSoyadi], [gUyeSayisi], [etkinlik], [butce], [baskaKurul], [bkUyeSecimi]) VALUES (10, N'Bilgisayar Mühendisleri', N'- İletişim becerilerini geliştirmek, Kod yazmak ,  - İletişim becerilerini geliştirmek, Kod yazmak ,  - İletişim becerilerini geliştirmek, Kod yazmak , - İletişim becerilerini geliştirmek, Kod yazmak , ', N'Bilgi', N'Sayar', NULL, N'00:59', N'Amfi', 1, 5, NULL, N'2018 - 2019', CAST(N'2018-12-20' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Basvuru] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID], [yazmanAdi], [yazmanSoyadi], [gUyeSayisi], [etkinlik], [butce], [baskaKurul], [bkUyeSecimi]) VALUES (11, N'Bilgisayar Mühendisleri', N'Düzce Üniversitesi "Teknoloji Fakültesi Topluluğu’nun amacı Düzce Üniversitesi öğrencilerinin;', N'Bilgi', N'Sayar', NULL, N'02:58', N'Amfi', 1, 9, 123, N'2018 - 2019', CAST(N'2018-12-06' AS Date), N'Mahmut Böcek', N'Bozuk', N'Pordakal', 1, CAST(N'2018-12-12' AS Date), 1, 11, N'cumali', N'Cuma', 250, N'Etkinlik gerçekleştirilmeyecektir.', N'100000 tl', N'yok', N'açıklamayacağım')
INSERT [dbo].[Basvuru] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID], [yazmanAdi], [yazmanSoyadi], [gUyeSayisi], [etkinlik], [butce], [baskaKurul], [bkUyeSecimi]) VALUES (12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Basvuru] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID], [yazmanAdi], [yazmanSoyadi], [gUyeSayisi], [etkinlik], [butce], [baskaKurul], [bkUyeSecimi]) VALUES (13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Basvuru] OFF
SET IDENTITY_INSERT [dbo].[Danisman] ON 

INSERT [dbo].[Danisman] ([ID], [adi], [soyadi], [unvan], [akademikBirim], [basvuruID], [aktif]) VALUES (3, N'O', N'O', N'Sekreter', N'Geyve', 2, NULL)
INSERT [dbo].[Danisman] ([ID], [adi], [soyadi], [unvan], [akademikBirim], [basvuruID], [aktif]) VALUES (6, N'Fatih', N'Kayaalp', N'Yrd.Doç.', N'Mühendislik Fakültesi', 8, 0)
INSERT [dbo].[Danisman] ([ID], [adi], [soyadi], [unvan], [akademikBirim], [basvuruID], [aktif]) VALUES (7, N'Resul', N'Kara', N'Prof.Dr.', N'Mühendislik', 8, 1)
INSERT [dbo].[Danisman] ([ID], [adi], [soyadi], [unvan], [akademikBirim], [basvuruID], [aktif]) VALUES (10, N'Fatih', N'Kayaalp', N'Yrd.Doç.', N'Mühendislik Fakültesi', 10, 0)
INSERT [dbo].[Danisman] ([ID], [adi], [soyadi], [unvan], [akademikBirim], [basvuruID], [aktif]) VALUES (12, N'Resul', N'Kara', N'Prof.Dr.', N'Mühendislik Fakültesi', 10, NULL)
INSERT [dbo].[Danisman] ([ID], [adi], [soyadi], [unvan], [akademikBirim], [basvuruID], [aktif]) VALUES (13, N'Fatih', N'Kayaalp', N'Yrd.Doç.', N'Mühendislik Fakültesi', 11, 1)
INSERT [dbo].[Danisman] ([ID], [adi], [soyadi], [unvan], [akademikBirim], [basvuruID], [aktif]) VALUES (14, N'Resul', N'Kara', N'Prof.Dr.', N'Mühendislik Fakültesi', 11, 0)
SET IDENTITY_INSERT [dbo].[Danisman] OFF
SET IDENTITY_INSERT [dbo].[DenetimKurulu] ON 

INSERT [dbo].[DenetimKurulu] ([ID], [adi], [soyadi], [unvan], [basvuruID], [ogrNo]) VALUES (7, N'Abdullah', N'Cangul', N'Denetim Kurulu Başkanı', 11, N'141002011')
INSERT [dbo].[DenetimKurulu] ([ID], [adi], [soyadi], [unvan], [basvuruID], [ogrNo]) VALUES (8, N'Hüsnüye', N'Hüsnü', N'Üye', 11, N'151001035')
INSERT [dbo].[DenetimKurulu] ([ID], [adi], [soyadi], [unvan], [basvuruID], [ogrNo]) VALUES (9, N'Zehra', N'Tunç', N'Üye', 11, N'151001027')
SET IDENTITY_INSERT [dbo].[DenetimKurulu] OFF
SET IDENTITY_INSERT [dbo].[FaliyetPlani] ON 

INSERT [dbo].[FaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (1, 3, N'dfdf', N'dfdf', CAST(N'2018-11-07' AS Date), NULL, N'dffdf')
INSERT [dbo].[FaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (7, 8, N'Topluluk Buluşması', N'Çay içme', CAST(N'2018-11-08' AS Date), NULL, N'Cafe')
INSERT [dbo].[FaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (8, 8, N'Topluluk Buluşması', N'Çay içme', CAST(N'2018-11-08' AS Date), NULL, N'Cafe')
INSERT [dbo].[FaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (9, 8, N'Topluluk Buluşması', N'Çay içme', CAST(N'2018-11-08' AS Date), NULL, N'Cafe')
INSERT [dbo].[FaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (10, 8, N'Topluluk Buluşması', N'Çay içme', CAST(N'2018-11-08' AS Date), NULL, N'Cafe')
INSERT [dbo].[FaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (11, 8, N'Topluluk Buluşması', N'Çay içme', CAST(N'2018-11-08' AS Date), NULL, N'Cafe')
INSERT [dbo].[FaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (17, 10, N'Toplantı', N'Yönetim kurulu bilgilendirme', CAST(N'2018-12-13' AS Date), NULL, N'Merkezi derslikler')
INSERT [dbo].[FaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (18, 10, N'Kaynaşma', N'Çay içme fln filan', CAST(N'2018-12-21' AS Date), NULL, N'Orta cafe')
INSERT [dbo].[FaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (19, 10, N'Buluşma', N'Konuşma', CAST(N'2018-12-21' AS Date), NULL, N'Orta cafe')
INSERT [dbo].[FaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (20, 10, N'Aktivite', N'Fabrika gezisi', CAST(N'2018-12-21' AS Date), NULL, N'Düzce')
INSERT [dbo].[FaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (21, 10, N'Aktivite', N'Yazılım dersleri', CAST(N'2018-12-21' AS Date), NULL, N'Düzce')
INSERT [dbo].[FaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (22, 11, N'a', N'a', CAST(N'2018-12-14' AS Date), NULL, N'a')
INSERT [dbo].[FaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (23, 11, N'b', N'b', CAST(N'2018-12-14' AS Date), NULL, N'b')
INSERT [dbo].[FaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (24, 11, N'c', N'c', CAST(N'2018-12-14' AS Date), NULL, N'c')
INSERT [dbo].[FaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (25, 11, N'd', N'd', CAST(N'2018-12-14' AS Date), NULL, N'd')
INSERT [dbo].[FaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (26, 11, N'e', N'e', CAST(N'2018-12-14' AS Date), NULL, N'e')
INSERT [dbo].[FaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (27, 12, N'a', N'a', CAST(N'2018-12-13' AS Date), NULL, N'a')
SET IDENTITY_INSERT [dbo].[FaliyetPlani] OFF
SET IDENTITY_INSERT [dbo].[GDanisman] ON 

INSERT [dbo].[GDanisman] ([ID], [adi], [soyadi], [unvan], [akademikBirim], [GuncelleID], [aktif]) VALUES (5, N'hamza', N'taş', N'prof', N'Mühendislik Fakültesi', 2, 0)
INSERT [dbo].[GDanisman] ([ID], [adi], [soyadi], [unvan], [akademikBirim], [GuncelleID], [aktif]) VALUES (6, N'resul', N'kara', N'arş.gör', N'Mühendislik', 2, 1)
INSERT [dbo].[GDanisman] ([ID], [adi], [soyadi], [unvan], [akademikBirim], [GuncelleID], [aktif]) VALUES (7, N'Fatih', N'Kayaalp', N'Yrd.Doç.', N'Mühendislik Fakültesi', 7, 0)
INSERT [dbo].[GDanisman] ([ID], [adi], [soyadi], [unvan], [akademikBirim], [GuncelleID], [aktif]) VALUES (8, N'Resul', N'Kara', N'Prof.Dr.', N'Mühendislik', 7, 1)
INSERT [dbo].[GDanisman] ([ID], [adi], [soyadi], [unvan], [akademikBirim], [GuncelleID], [aktif]) VALUES (13, N'Fatih', N'Kayaalp', N'Yrd.Doç.', N'Mühendislik Fakültesi', 10, 1)
INSERT [dbo].[GDanisman] ([ID], [adi], [soyadi], [unvan], [akademikBirim], [GuncelleID], [aktif]) VALUES (14, N'Resul', N'Kara', N'Prof.Dr.', N'Mühendislik Fakültesi', 10, 0)
INSERT [dbo].[GDanisman] ([ID], [adi], [soyadi], [unvan], [akademikBirim], [GuncelleID], [aktif]) VALUES (15, N'hamza', N'taş', N'prof', N'Mühendislik Fakültesi', 11, 1)
INSERT [dbo].[GDanisman] ([ID], [adi], [soyadi], [unvan], [akademikBirim], [GuncelleID], [aktif]) VALUES (16, N'Resul', N'Kara', N'arş.gör', N'Mühendislik', 11, 0)
INSERT [dbo].[GDanisman] ([ID], [adi], [soyadi], [unvan], [akademikBirim], [GuncelleID], [aktif]) VALUES (17, N'hamza', N'taş', N'prof', N'Mühendislik Fakültesi', 12, 1)
INSERT [dbo].[GDanisman] ([ID], [adi], [soyadi], [unvan], [akademikBirim], [GuncelleID], [aktif]) VALUES (18, N'Resul', N'kara', N'arş.gör', N'Mühendislik', 12, 0)
SET IDENTITY_INSERT [dbo].[GDanisman] OFF
SET IDENTITY_INSERT [dbo].[GDenetimKurulu] ON 

INSERT [dbo].[GDenetimKurulu] ([ID], [adi], [soyadi], [unvan], [GuncelleID], [ogrNo]) VALUES (1, N'Burak', N'Taş', N'Denetim Kurulu Başkanı', 12, N'151001037')
INSERT [dbo].[GDenetimKurulu] ([ID], [adi], [soyadi], [unvan], [GuncelleID], [ogrNo]) VALUES (2, N'Burak', N'Taş', N'Üye', 12, N'151001028')
INSERT [dbo].[GDenetimKurulu] ([ID], [adi], [soyadi], [unvan], [GuncelleID], [ogrNo]) VALUES (3, N'Abdullah', N'Taş', N'Üye', 12, N'151001031')
SET IDENTITY_INSERT [dbo].[GDenetimKurulu] OFF
SET IDENTITY_INSERT [dbo].[GFaliyetPlani] ON 

INSERT [dbo].[GFaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (1, 2, N'fdsffdsg', N'dfgdfgdfgsdf', CAST(N'2018-11-10' AS Date), NULL, N'fdgsdfg')
INSERT [dbo].[GFaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (2, 2, N'a', N'a', CAST(N'2018-11-17' AS Date), NULL, N'c')
INSERT [dbo].[GFaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (3, 2, N'b', N'c', CAST(N'2018-11-20' AS Date), NULL, N'f')
INSERT [dbo].[GFaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (4, 2, N'd', N'd', CAST(N'2018-11-20' AS Date), NULL, N'd')
INSERT [dbo].[GFaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (6, 2, N'e', N'e', CAST(N'2018-11-10' AS Date), NULL, N'e')
INSERT [dbo].[GFaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (7, 11, N'a', N'a', CAST(N'2018-12-28' AS Date), NULL, N'a')
INSERT [dbo].[GFaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (8, 11, N'b', N'b', CAST(N'2018-12-28' AS Date), NULL, N'b')
INSERT [dbo].[GFaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (9, 11, N'c', N'c', CAST(N'2018-12-28' AS Date), NULL, N'c')
INSERT [dbo].[GFaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (10, 11, N'd', N'd', CAST(N'2018-12-28' AS Date), NULL, N'd')
INSERT [dbo].[GFaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (11, 11, N'g', N'g', CAST(N'2018-12-28' AS Date), NULL, N'g')
INSERT [dbo].[GFaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (12, 12, N'a', N'a', CAST(N'2018-12-20' AS Date), NULL, N'a')
INSERT [dbo].[GFaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (13, 12, N'b', N'b', CAST(N'2018-12-20' AS Date), NULL, N'b')
INSERT [dbo].[GFaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (14, 12, N'c', N'c', CAST(N'2018-12-20' AS Date), NULL, N'c')
INSERT [dbo].[GFaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (15, 12, N'd', N'd', CAST(N'2018-12-20' AS Date), NULL, N'd')
INSERT [dbo].[GFaliyetPlani] ([ID], [faliyetID], [faliyetTürü], [faliyetAmaci], [tarih], [saat], [yerleske]) VALUES (16, 12, N'f', N'f', CAST(N'2018-12-20' AS Date), NULL, N'f')
SET IDENTITY_INSERT [dbo].[GFaliyetPlani] OFF
SET IDENTITY_INSERT [dbo].[GOgrenciListesi] ON 

INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (2, N'Hamza', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001020', N'05346682748', N'hamza51719@ogr.duzce.edu.tr', 2)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (3, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001027', N'05346682748', N'hamzatas@gmail.com', 2)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (5, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001041', N'05346682748', N'burak@burak.com', NULL)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (8, N'Hamza', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001020', N'05346682748', N'hamzatas@gmail.com', 7)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (10, N'Fatih', N'Karaüzüm', N'Mühendislik Fakültesi', N'21239856255', N'151001052', N'05396777163', N'fatih.karauzum@gmail.com', 9)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (11, N'Abdullah', N'Cangul', N'Mühendislik Fakültesi', N'21239856255', N'141002011', N'05436547898', N'abdullah@gmail.com', 10)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (12, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001020', N'05346682748', N'fatih@h.com', 11)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (13, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001027', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (14, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001028', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (15, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001029', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (16, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001025', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (17, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001030', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (18, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001031', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (19, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001032', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (20, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001033', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (21, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001034', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (22, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001035', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (23, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001036', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (24, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001037', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (25, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001038', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (26, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001039', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (27, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001040', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (28, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001041', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (29, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001042', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (30, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001043', N'05346682748', N'fatih@h.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (31, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'21239856255', N'151001011', N'05346682748', N'hamza@gmail.com', 12)
INSERT [dbo].[GOgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [GuncelleID]) VALUES (32, N'Abdullah', N'Taş', N'Eğitim Fakültesi', N'26285617580', N'151001031', N'05346682748', N'abdullah@tas.com', 12)
SET IDENTITY_INSERT [dbo].[GOgrenciListesi] OFF
SET IDENTITY_INSERT [dbo].[Guncelle] ON 

INSERT [dbo].[Guncelle] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID], [yazmanAdi], [yazmanSoyadi], [gUyeSayisi], [etkinlik], [butce], [baskaKurul], [bkUyeSecimi]) VALUES (2, N'Bilgisayar Mühendisleri', NULL, N'hamza', N'taş', NULL, N'11:11', N'Amfi', 1, 6, NULL, NULL, CAST(N'2018-11-10' AS Date), NULL, NULL, NULL, NULL, CAST(N'2018-12-12' AS Date), NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Guncelle] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID], [yazmanAdi], [yazmanSoyadi], [gUyeSayisi], [etkinlik], [butce], [baskaKurul], [bkUyeSecimi]) VALUES (7, N'Makine Mühendisleri', NULL, N'Mehmet', N'Kim', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-12-12' AS Date), NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Guncelle] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID], [yazmanAdi], [yazmanSoyadi], [gUyeSayisi], [etkinlik], [butce], [baskaKurul], [bkUyeSecimi]) VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-12-12' AS Date), NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Guncelle] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID], [yazmanAdi], [yazmanSoyadi], [gUyeSayisi], [etkinlik], [butce], [baskaKurul], [bkUyeSecimi]) VALUES (10, N'Dukat', NULL, N'Cumali', N'Cuma', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-12-12' AS Date), NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Guncelle] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID], [yazmanAdi], [yazmanSoyadi], [gUyeSayisi], [etkinlik], [butce], [baskaKurul], [bkUyeSecimi]) VALUES (11, N'Durot', NULL, N'Köksal', N'Gündoğdu', NULL, N'00:00', N'5', 1, 5, 123, N'2018 - 2019', CAST(N'2018-12-06' AS Date), N'Burak Taş', N'Burak', N'Taş', NULL, CAST(N'2018-12-12' AS Date), NULL, 12, N'Burak', N'Taş', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Guncelle] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID], [yazmanAdi], [yazmanSoyadi], [gUyeSayisi], [etkinlik], [butce], [baskaKurul], [bkUyeSecimi]) VALUES (12, N'İletişim', NULL, N'Zehra', N'Duman', NULL, N'00:59', N'1', 1, 7, 35, N'2018 - 2019', CAST(N'2018-12-12' AS Date), N'Burak Taş', N'Burak', N'Taş', 1, CAST(N'2018-12-19' AS Date), 1, 13, N'Burak', N'Taş', 12, N'dsdsd', N'sadfasdfsdf', N'sdfasdf', N'asdfsdaf')
SET IDENTITY_INSERT [dbo].[Guncelle] OFF
SET IDENTITY_INSERT [dbo].[GYonetimKurulu] ON 

INSERT [dbo].[GYonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [GuncelleID]) VALUES (1, N'Burak', N'Taş', N'Başkan Yardımcısı', N'dsadsa', N'dsadsa', N'26285617580', N'Mühendislik Fakültesi', N'151001030', N'05346682748', N'asdasd', N'fatih@h.com', 12)
INSERT [dbo].[GYonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [GuncelleID]) VALUES (2, N'Burak', N'Taş', N'Sayman', N'sadasd', N'sadasd', N'26285617580', N'Mühendislik Fakültesi', N'151001041', N'05346682748', N'sadsad', N'fatih@h.com', 12)
INSERT [dbo].[GYonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [GuncelleID]) VALUES (3, N'Burak', N'Taş', N'Sekreter', N'sadasd', N'asdsad', N'26285617580', N'Mühendislik Fakültesi', N'151001043', N'05346682748', N'sadsad', N'fatih@h.com', 12)
INSERT [dbo].[GYonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [GuncelleID]) VALUES (4, N'Burak', N'Taş', N'Üye', NULL, NULL, N'26285617580', N'Mühendislik Fakültesi', N'151001042', N'05346682748', NULL, N'fatih@h.com', 11)
INSERT [dbo].[GYonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [GuncelleID]) VALUES (5, N'Burak', N'Taş', N'Üye', N'dsadas', N'dsadas', N'26285617580', N'Mühendislik Fakültesi', N'151001038', N'05346682748', N'asddsa', N'fatih@h.com', 12)
INSERT [dbo].[GYonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [GuncelleID]) VALUES (6, N'Burak', N'Taş', N'Üye', N'sadasd', N'asdasd', N'21239856255', N'Mühendislik Fakültesi', N'151001011', N'05346682748', N'dsadsa', N'hamza@gmail.com', 12)
INSERT [dbo].[GYonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [GuncelleID]) VALUES (7, N'Burak', N'Taş', N'Üye', N'dsadsa', N'dsadas', N'26285617580', N'Mühendislik Fakültesi', N'151001039', N'05346682748', N'dsadsa', N'fatih@h.com', 12)
INSERT [dbo].[GYonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [GuncelleID]) VALUES (8, N'Burak', N'Taş', N'baskan', N'sadasd', N'asdasd', N'26285617580', N'Mühendislik Fakültesi', N'151001041', N'05346682748', N'asdasd', N'fatih@h.com', 12)
INSERT [dbo].[GYonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [GuncelleID]) VALUES (9, N'Burak', N'Taş', N'baskan', NULL, NULL, N'26285617580', NULL, N'151001034', N'05346682748', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GYonetimKurulu] OFF
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([ID], [adi], [soyadi], [ogrMail], [sifre], [ogrNo], [tc], [kayitTarihi]) VALUES (2, N'AAA', N'BBB', N'abc@gmail.com', N'123', N'151001020', N'21239856255', CAST(N'2018-01-12' AS Date))
INSERT [dbo].[Kullanici] ([ID], [adi], [soyadi], [ogrMail], [sifre], [ogrNo], [tc], [kayitTarihi]) VALUES (3, N'Hamza', N'Taş', N'hamza51719@ogr.duzce.edu.tr', N'123', N'151001020', N'26285617580', CAST(N'2018-03-14' AS Date))
INSERT [dbo].[Kullanici] ([ID], [adi], [soyadi], [ogrMail], [sifre], [ogrNo], [tc], [kayitTarihi]) VALUES (8, N'Hamza', N'Taş', N'hamzatas@gmail.com', N'123', N'151001020', N'26285617580', CAST(N'2018-01-12' AS Date))
INSERT [dbo].[Kullanici] ([ID], [adi], [soyadi], [ogrMail], [sifre], [ogrNo], [tc], [kayitTarihi]) VALUES (10, N'Fatih', N'Karaüzüm', N'fatih.karauzum@gmail.com', N'123', N'151001052', N'21239856255', CAST(N'2018-01-12' AS Date))
INSERT [dbo].[Kullanici] ([ID], [adi], [soyadi], [ogrMail], [sifre], [ogrNo], [tc], [kayitTarihi]) VALUES (11, N'Abdullah', N'Cangul', N'abdullah@gmail.com', N'123', N'141002011', N'21239856255', CAST(N'2018-05-19' AS Date))
INSERT [dbo].[Kullanici] ([ID], [adi], [soyadi], [ogrMail], [sifre], [ogrNo], [tc], [kayitTarihi]) VALUES (12, N'Burak', N'Taş', N'hamza@gmail.com', N'123', N'151001011', N'21239856255', CAST(N'2018-01-12' AS Date))
INSERT [dbo].[Kullanici] ([ID], [adi], [soyadi], [ogrMail], [sifre], [ogrNo], [tc], [kayitTarihi]) VALUES (13, N'Abdullah', N'Taş', N'abdullah@tas.com', N'123', N'151001031', N'26285617580', CAST(N'2018-07-01' AS Date))
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
SET IDENTITY_INSERT [dbo].[OgrenciListesi] ON 

INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (22, N'Cumali', N'Cuma', N'Teknoloji Fakültesi', N'26285617580', N'151001041', N'05346682748', N'cumali@cuma.com', 4)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (23, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001020', N'05346682748', N'fatihcrazyboyasadasfasdfasdfsadfsadfadsfsdafsadfasdflukukjkjkjkj@h.com', 4)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (24, N'Hamza', N'Taşkın', N'Teknoloji Fakültesi', N'26285617596', N'151001029', N'05346682748', N'resulkara@duzce.edu.tr', 4)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (25, N'Feyza', N'Kayar', N'Teknoloji Fakültesi', N'26285617596', N'151001027', N'05346682748', N'resulkara@duzce.edu.tr', 4)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (26, N'Kamile', N'kamil', N'Teknoloji Fakültesi', N'26285617596', N'151001028', N'05346682748', N'resulkara@duzce.edu.tr', 4)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (27, N'Hasan', N'kamil', N'Teknoloji Fakültesi', N'26285617596', N'151001023', N'05346682748', N'resulkara@duzce.edu.tr', 4)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (28, N'Hüsnüye', N'Hüsnü', N'Teknoloji Fakültesi', N'26285617596', N'151001024', N'05346682748', N'resulkara@duzce.edu.tr', 4)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (29, N'Düzciye', N'düz', N'Teknoloji Fakültesi', N'26285617596', N'151001025', N'05346682748', N'resulkara@duzce.edu.tr', 4)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (30, N'Mehmeyt', N'eyt', N'Teknoloji Fakültesi', N'26285617596', N'151001026', N'05346682748', N'resulkara@duzce.edu.tr', 4)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (31, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001041', N'05346682748', N'burak@burak.com', NULL)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (32, N'baskan', N'baskan soyadı', N'Mühendislik Fakültesi', N'26285617580', N'151001020', N'05346682748', N'fatih@h.com', NULL)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (33, N'baskan', N'baskan soyadı', N'Mühendislik Fakültesi', N'26285617580', N'151001021', N'05346682748', N'fatih@h.com', NULL)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (34, N'baskan', N'baskan soyadı', N'Mühendislik Fakültesi', N'26285617580', N'151001022', N'05346682748', N'fatih@h.com', NULL)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (35, N'baskan', N'baskan soyadı', N'Mühendislik Fakültesi', N'26285617580', N'151001024', N'05346682748', N'fatih@h.com', NULL)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (36, N'baskan', N'baskan soyadı', N'Mühendislik Fakültesi', N'26285617580', N'151001027', N'05346682748', N'fatih@h.com', NULL)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (37, N'baskan', N'baskan soyadı', N'Mühendislik Fakültesi', N'26285617580', N'151001028', N'05346682748', N'fatih@h.com', NULL)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (38, N'baskan', N'baskan soyadı', N'Mühendislik Fakültesi', N'26285617580', N'151001029', N'05346682748', N'fatih@h.com', NULL)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (60, N'Hamza', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001020', N'05346682748', N'hamzatas@gmail.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (61, N'Burak', N'Taşkın', N'Mühendislik Fakültesi', N'26285617596', N'141001041', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (62, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617596', N'141001042', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (63, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617596', N'141001047', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (64, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617596', N'141001048', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (65, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617596', N'141001049', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (66, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617596', N'141001051', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (67, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617596', N'141001081', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (68, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617596', N'141001082', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (69, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617596', N'141001083', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (70, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617596', N'141001084', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (71, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617596', N'141001085', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (72, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617596', N'141001088', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (73, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617596', N'141001089', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (74, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617596', N'141001090', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (75, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617596', N'141001091', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (76, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617580', N'141001092', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (77, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617580', N'141001093', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (78, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617580', N'141001094', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (79, N'Musa', N'Aydın', N'Mühendislik Fakültesi', N'26285617580', N'141001095', N'05436547898', N'taskin@t.com', 8)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (100, N'Fatih', N'Karaüzüm', N'Mühendislik Fakültesi', N'21239856255', N'151001052', N'05396777163', N'fatih.karauzum@gmail.com', 10)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (101, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001020', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (102, N'Hamza', N'Taş', N'Mühendislik Fakültesi', N'26285617580', N'151001022', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (103, N'Mehmet', N'Özçelik', N'Mühendislik Fakültesi', N'26285617580', N'151001023', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (104, N'Necmi', N'Aksoy', N'Mühendislik Fakültesi', N'26285617580', N'151001024', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (105, N'Mahmut', N'Böcek', N'Mühendislik Fakültesi', N'26285617580', N'151001025', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (106, N'Muharrem', N'Karabacak', N'Mühendislik Fakültesi', N'26285617580', N'151001026', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (107, N'Zehra', N'Tunç', N'Mühendislik Fakültesi', N'26285617580', N'151001027', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (108, N'Harun Can', N'Karapürçek', N'Mühendislik Fakültesi', N'26285617580', N'151001028', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (109, N'Ufuktar', N'Aydoğar', N'Mühendislik Fakültesi', N'26285617580', N'151001029', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (110, N'cumali', N'Cuma', N'Mühendislik Fakültesi', N'26285617580', N'151001030', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (111, N'Bilgi', N'Sayar', N'Mühendislik Fakültesi', N'26285617580', N'151001031', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (112, N'Bozuk', N'Pordakal', N'Mühendislik Fakültesi', N'26285617580', N'151001032', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (113, N'Şehriye', N'Pilav', N'Mühendislik Fakültesi', N'26285617580', N'151001033', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (114, N'Ahmet Mehmet', N'Veli', N'Mühendislik Fakültesi', N'26285617580', N'151001034', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (115, N'Hüsnüye', N'Hüsnü', N'Mühendislik Fakültesi', N'26285617580', N'151001035', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (116, N'Halim', N'Harap', N'Mühendislik Fakültesi', N'26285617580', N'151001036', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (117, N'Cemal', N'Kim', N'Mühendislik Fakültesi', N'26285617580', N'151001037', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (118, N'Veysel', N'Şebek', N'Mühendislik Fakültesi', N'26285617580', N'151001038', N'05346682748', N'necmiaksoy@duzce.edu.tr', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (120, N'Kamile', N'Kamil', N'Teknoloji Fakültesi', N'26285617596', N'141001041', N'05436547898', N'fatih@h.com', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (121, N'Abdullah', N'Cangul', N'Mühendislik Fakültesi', N'21239856255', N'141002011', N'05436547898', N'abdullah@gmail.com', 11)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (122, N'Burak', N'Taş', N'Mühendislik Fakültesi', N'21239856255', N'151001011', N'05346682748', N'hamza@gmail.com', 12)
INSERT [dbo].[OgrenciListesi] ([ID], [adi], [soyadi], [fak], [tc], [ogrNo], [tel], [mail], [basvuruID]) VALUES (123, N'Abdullah', N'Taş', N'Eğitim Fakültesi', N'26285617580', N'151001031', N'05346682748', N'abdullah@tas.com', 13)
SET IDENTITY_INSERT [dbo].[OgrenciListesi] OFF
SET IDENTITY_INSERT [dbo].[YonetimKurulu] ON 

INSERT [dbo].[YonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [basvuruID], [Baskan]) VALUES (20, N'Fatih', N'Karaüzüm', N'Yönetim Kurulu Başkanı', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL)
INSERT [dbo].[YonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [basvuruID], [Baskan]) VALUES (29, N'Burak', N'Taşkın', N'Yönetim Kurulu Başkanı', NULL, NULL, N'26285617596', NULL, N'141001041', N'05436547898', NULL, N'taskin@t.com', 8, 1)
INSERT [dbo].[YonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [basvuruID], [Baskan]) VALUES (31, N'Halim', N'Harap', N'Yönetim Kurulu Başkanı', NULL, NULL, N'26285617580', NULL, N'151001036', N'05346682748', NULL, N'necmiaksoy@duzce.edu.tr', 10, 1)
INSERT [dbo].[YonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [basvuruID], [Baskan]) VALUES (32, N'Necmi', N'Aksoy', N'Yönetim Kurulu Başkanı', N'dsadsa', N'dsadsa', N'26285617580', NULL, N'151001024', N'05346682748', N'asdasd', N'necmiaksoy@duzce.edu.tr', 11, 1)
INSERT [dbo].[YonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [basvuruID], [Baskan]) VALUES (33, N'Mehmet', N'Özçelik', N'Başkan Yardımcısı', N'dsada', N'dsadsa', N'26285617580', N'Mühendislik Fakültesi', N'151001023', N'05346682748', N'asdasd', N'necmiaksoy@duzce.edu.tr', 11, NULL)
INSERT [dbo].[YonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [basvuruID], [Baskan]) VALUES (34, N'Veysel', N'Şebek', N'Sayman', N'dsadsa', N'dsadas', N'26285617580', N'Mühendislik Fakültesi', N'151001038', N'05346682748', N'dsadsa', N'necmiaksoy@duzce.edu.tr', 11, NULL)
INSERT [dbo].[YonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [basvuruID], [Baskan]) VALUES (35, N'Cemal', N'Kim', N'Sekreter', N'sadasd', N'sadasd', N'26285617580', N'Mühendislik Fakültesi', N'151001037', N'05346682748', N'asdasd', N'necmiaksoy@duzce.edu.tr', 11, NULL)
INSERT [dbo].[YonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [basvuruID], [Baskan]) VALUES (36, N'Ufuktar', N'Aydoğar', N'Üye', N'dsadsa', N'asdasd', N'26285617580', N'Mühendislik Fakültesi', N'151001029', N'05346682748', N'sadasd', N'necmiaksoy@duzce.edu.tr', 11, NULL)
INSERT [dbo].[YonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [basvuruID], [Baskan]) VALUES (37, N'Harun Can', N'Karapürçek', N'Üye', N'dsadas', N'asdasd', N'26285617580', N'Mühendislik Fakültesi', N'151001028', N'05346682748', N'sadsad', N'necmiaksoy@duzce.edu.tr', 11, NULL)
INSERT [dbo].[YonetimKurulu] ([ID], [adi], [soyadi], [unvan], [bolum], [adres], [tc], [fakulte], [ogrNo], [gsm], [evTel], [eMail], [basvuruID], [Baskan]) VALUES (38, N'Bozuk', N'Pordakal', N'Üye', N'dsada', N'asdasd', N'26285617580', N'Mühendislik Fakültesi', N'151001032', N'05346682748', N'asdasd', N'necmiaksoy@duzce.edu.tr', 11, NULL)
SET IDENTITY_INSERT [dbo].[YonetimKurulu] OFF
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
ALTER TABLE [dbo].[GDanisman]  WITH CHECK ADD  CONSTRAINT [FK_GDanisman_Guncelle] FOREIGN KEY([GuncelleID])
REFERENCES [dbo].[Guncelle] ([ID])
GO
ALTER TABLE [dbo].[GDanisman] CHECK CONSTRAINT [FK_GDanisman_Guncelle]
GO
ALTER TABLE [dbo].[GDenetimKurulu]  WITH CHECK ADD  CONSTRAINT [FK_GDenetimKurulu_Guncelle] FOREIGN KEY([GuncelleID])
REFERENCES [dbo].[Guncelle] ([ID])
GO
ALTER TABLE [dbo].[GDenetimKurulu] CHECK CONSTRAINT [FK_GDenetimKurulu_Guncelle]
GO
ALTER TABLE [dbo].[GFaliyetPlani]  WITH CHECK ADD  CONSTRAINT [FK_GFaliyetPlani_Guncelle] FOREIGN KEY([faliyetID])
REFERENCES [dbo].[Guncelle] ([ID])
GO
ALTER TABLE [dbo].[GFaliyetPlani] CHECK CONSTRAINT [FK_GFaliyetPlani_Guncelle]
GO
ALTER TABLE [dbo].[GOgrenciListesi]  WITH CHECK ADD  CONSTRAINT [FK_GOgrenciListesi_Guncelle] FOREIGN KEY([GuncelleID])
REFERENCES [dbo].[Guncelle] ([ID])
GO
ALTER TABLE [dbo].[GOgrenciListesi] CHECK CONSTRAINT [FK_GOgrenciListesi_Guncelle]
GO
ALTER TABLE [dbo].[Guncelle]  WITH CHECK ADD  CONSTRAINT [FK_Guncelle_Kullanici] FOREIGN KEY([kullanıcıID])
REFERENCES [dbo].[Kullanici] ([ID])
GO
ALTER TABLE [dbo].[Guncelle] CHECK CONSTRAINT [FK_Guncelle_Kullanici]
GO
ALTER TABLE [dbo].[GYeniUye]  WITH CHECK ADD  CONSTRAINT [FK_GYeniUye_Guncelle] FOREIGN KEY([GuncelleID])
REFERENCES [dbo].[Guncelle] ([ID])
GO
ALTER TABLE [dbo].[GYeniUye] CHECK CONSTRAINT [FK_GYeniUye_Guncelle]
GO
ALTER TABLE [dbo].[GYonetimKurulu]  WITH CHECK ADD  CONSTRAINT [FK_GYonetimKurulu_Guncelle] FOREIGN KEY([GuncelleID])
REFERENCES [dbo].[Guncelle] ([ID])
GO
ALTER TABLE [dbo].[GYonetimKurulu] CHECK CONSTRAINT [FK_GYonetimKurulu_Guncelle]
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
