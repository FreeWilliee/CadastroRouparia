USE [Integrado]
GO

/****** Object:  Table [dbo].[RP_REQ]    Script Date: 03/28/2022 08:26:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RP_REQ](
	[Req] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Usu_Sol] [varchar](20) NULL,
	[Material] [varchar](100) NULL,
	[cod_mat] [decimal](18, 0) NULL,
	[Qtde] [int] NULL,
	[Setor] [varchar](60) NULL,
	[Observacao] [varchar](100) NULL,
	[data] [datetime] NULL,
	[Data_Lib] [datetime] NULL,
	[Usu_Lib] [varchar](20) NULL,
	[Liberacao] [char](1) NULL,
	[Retorno] [int] NULL,
 CONSTRAINT [PK_RP_REQ] PRIMARY KEY CLUSTERED 
(
	[Req] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

