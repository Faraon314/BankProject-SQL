USE [BankDataBase]
GO

/****** Object:  Table [dbo].[OperationList]    Script Date: 21.04.2016 6:13:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OperationList](
	[name] [nchar](10) NOT NULL,
	[sign] [nchar](2) NOT NULL,
 CONSTRAINT [PK_OperationList] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


