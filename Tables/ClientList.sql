USE [BankDataBase]
GO

/****** Object:  Table [dbo].[ClientList]    Script Date: 21.04.2016 6:13:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ClientList](
	[Surname] [nchar](20) NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[Patronymic] [nchar](20) NOT NULL,
	[PasportData] [int] NOT NULL,
	[Adress] [nchar](20) NOT NULL,
	[id] [int] NULL,
 CONSTRAINT [PK_ClientList] PRIMARY KEY CLUSTERED 
(
	[PasportData] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


