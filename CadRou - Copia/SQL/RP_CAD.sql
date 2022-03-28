USE [Integrado]
GO

/****** Object:  Table [dbo].[RP_CAD]    Script Date: 03/28/2022 08:23:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RP_CAD](
	[Codigo] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](50) NULL,
	[Est_total] [decimal](18, 0) NULL,
	[Est_Roupa] [decimal](18, 0) NULL,
 CONSTRAINT [PK_RP_CAD] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

