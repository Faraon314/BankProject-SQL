USE [BankDataBase]
GO

/****** Object:  Table [dbo].[AccountList]    Script Date: 21.04.2016 6:13:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AccountList](
	[id] [int] NOT NULL,
	[currency] [nchar](10) NOT NULL,
	[data_open] [date] NOT NULL,
	[data_close] [date] NOT NULL,
	[money] [int] NOT NULL,
	[client_id] [int] NULL,
 CONSTRAINT [PK_AccountList] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


