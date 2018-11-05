USE [ToplulukDB]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 5.11.2018 10:09:36 ******/
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
/****** Object:  Table [dbo].[Basvuru]    Script Date: 5.11.2018 10:09:36 ******/
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
 CONSTRAINT [PK_Basvuru] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Danisman]    Script Date: 5.11.2018 10:09:36 ******/
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
/****** Object:  Table [dbo].[DenetimKurulu]    Script Date: 5.11.2018 10:09:36 ******/
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
/****** Object:  Table [dbo].[FaliyetPlani]    Script Date: 5.11.2018 10:09:36 ******/
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
/****** Object:  Table [dbo].[Kullanici]    Script Date: 5.11.2018 10:09:36 ******/
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
/****** Object:  Table [dbo].[OgrenciListesi]    Script Date: 5.11.2018 10:09:36 ******/
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
/****** Object:  Table [dbo].[YeniUye]    Script Date: 5.11.2018 10:09:36 ******/
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
/****** Object:  Table [dbo].[YonetimKurulu]    Script Date: 5.11.2018 10:09:36 ******/
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
SET IDENTITY_INSERT [dbo].[Basvuru] ON 

INSERT [dbo].[Basvuru] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID]) VALUES (3, N'Makine Mühendisleri', N'- İletişim becerilerini geliştirmek,', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Basvuru] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID]) VALUES (4, N'Makine Mühendisleri', N'- İletişim becerilerini geliştirmek,', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Basvuru] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID]) VALUES (5, N'Makine Mühendisleri', N'- İletişim becerilerini geliştirmek,', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Basvuru] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID]) VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[Basvuru] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID]) VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[Basvuru] ([ID], [toplulukAdi], [toplulukAmac], [baskanAdi], [baskanSoyadi], [tarih], [saat], [mekan], [toplantiNo], [adimNo], [uyeSayisi], [akademikYıl], [toplantiTarihi], [marscı], [divanBaskanAdi], [divanBaskanSoyadi], [toplantiNiteligi], [kurulusTarihi], [tuzukDegisikligi], [kullanıcıID]) VALUES (8, N'Makine Mühendisleri', N'- İletişim becerilerini geliştirmek,', NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4)
SET IDENTITY_INSERT [dbo].[Basvuru] OFF
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([ID], [adiSoyadi], [ogrMail], [sifre], [ogrNo], [tc]) VALUES (1, N'Coni con', N'og@og.com', N'123', N'123123', N'123123')
INSERT [dbo].[Kullanici] ([ID], [adiSoyadi], [ogrMail], [sifre], [ogrNo], [tc]) VALUES (2, N'Hamza TAŞ', N'hamza51719@ogr.dudfde.edu.tr', N'123', N'151001020', N'26285617580')
INSERT [dbo].[Kullanici] ([ID], [adiSoyadi], [ogrMail], [sifre], [ogrNo], [tc]) VALUES (3, N'Hamza TAŞ', N'hamza51719@ogr.ddfdfdfduzce.edu.tr', N'123', N'151001020', N'26285617580')
INSERT [dbo].[Kullanici] ([ID], [adiSoyadi], [ogrMail], [sifre], [ogrNo], [tc]) VALUES (4, N'Hamza TAŞ', N'hamza51719@ogr.duzce.edu.tr', N'123', N'151001020', N'26285617580')
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
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
