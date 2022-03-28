USE [Integrado]
GO

/****** Object:  Table [dbo].[RP_MOV]    Script Date: 03/28/2022 08:25:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RP_MOV](
	[Codigo] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Cod_material] [decimal](18, 0) NULL,
	[Data] [datetime] NULL,
	[Motivo] [varchar](100) NULL,
	[Mot_Out] [varchar](100) NULL,
	[Qtde] [int] NULL,
	[Est_Total] [decimal](18, 0) NULL,
 CONSTRAINT [PK_RP_MOV] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

