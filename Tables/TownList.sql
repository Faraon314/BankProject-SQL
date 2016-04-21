USE [BankDataBase]
GO

/****** Object:  Table [dbo].[TownList]    Script Date: 21.04.2016 6:14:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TownList](
	[town_name] [nchar](10) NOT NULL,
	[population] [int] NOT NULL
) ON [PRIMARY]

GO


