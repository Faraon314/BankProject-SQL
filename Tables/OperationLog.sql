USE [BankDataBase]
GO

/****** Object:  Table [dbo].[OperationLog]    Script Date: 21.04.2016 6:13:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[OperationLog](
	[AccountID] [int] NOT NULL,
	[OperationType] [nchar](10) NOT NULL,
	[Summ] [int] NOT NULL,
	[Data] [date] NOT NULL
) ON [PRIMARY]

GO


ALTER TABLE [dbo].[OperationLog]  ADD   CHECK  ([Summ]>=0)
GO
ALTER TABLE [dbo].[OperationLog]  ADD   CHECK  ([OperationType]='пополнение' or [OperationType]='списание' )
GO

