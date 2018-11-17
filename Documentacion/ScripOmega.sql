USE [master]
GO
/****** Object:  Database [Omega]    Script Date: 11/15/2018 02:15:52 ******/
CREATE DATABASE [Omega] ON  PRIMARY 
( NAME = N'Omega', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Omega.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Omega_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Omega_log.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Omega] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Omega].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Omega] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Omega] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Omega] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Omega] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Omega] SET ARITHABORT OFF
GO
ALTER DATABASE [Omega] SET AUTO_CLOSE ON
GO
ALTER DATABASE [Omega] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Omega] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Omega] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Omega] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Omega] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Omega] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Omega] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Omega] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Omega] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Omega] SET  ENABLE_BROKER
GO
ALTER DATABASE [Omega] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Omega] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Omega] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Omega] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Omega] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Omega] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Omega] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Omega] SET  READ_WRITE
GO
ALTER DATABASE [Omega] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Omega] SET  MULTI_USER
GO
ALTER DATABASE [Omega] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Omega] SET DB_CHAINING OFF
GO
USE [Omega]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 11/15/2018 02:15:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[Cod_Pais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Pais] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Pais] ON
INSERT [dbo].[Pais] ([Cod_Pais], [Nombre]) VALUES (1, N'Argentina')
INSERT [dbo].[Pais] ([Cod_Pais], [Nombre]) VALUES (7, N'Brasil')
INSERT [dbo].[Pais] ([Cod_Pais], [Nombre]) VALUES (5, N'Chile')
INSERT [dbo].[Pais] ([Cod_Pais], [Nombre]) VALUES (2, N'Colombia')
INSERT [dbo].[Pais] ([Cod_Pais], [Nombre]) VALUES (6, N'Ecuador')
INSERT [dbo].[Pais] ([Cod_Pais], [Nombre]) VALUES (8, N'España')
INSERT [dbo].[Pais] ([Cod_Pais], [Nombre]) VALUES (4, N'Peru')
SET IDENTITY_INSERT [dbo].[Pais] OFF
/****** Object:  Table [dbo].[MedioPago]    Script Date: 11/15/2018 02:15:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedioPago](
	[Cod_MPago] [int] IDENTITY(100,1) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_MPago] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MedioPago] ON
INSERT [dbo].[MedioPago] ([Cod_MPago], [Descripcion]) VALUES (104, N'Efectivo (PagoFacil)')
INSERT [dbo].[MedioPago] ([Cod_MPago], [Descripcion]) VALUES (102, N'Efectivo (RapiPago)')
INSERT [dbo].[MedioPago] ([Cod_MPago], [Descripcion]) VALUES (105, N'Mercado Pago')
INSERT [dbo].[MedioPago] ([Cod_MPago], [Descripcion]) VALUES (106, N'PayPal')
INSERT [dbo].[MedioPago] ([Cod_MPago], [Descripcion]) VALUES (100, N'Tarjeta de Credito')
INSERT [dbo].[MedioPago] ([Cod_MPago], [Descripcion]) VALUES (101, N'Trajeta de Debito')
SET IDENTITY_INSERT [dbo].[MedioPago] OFF
/****** Object:  Table [dbo].[Genero]    Script Date: 11/15/2018 02:15:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[Cod_Genero] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Cod_Genero] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Genero] ON
INSERT [dbo].[Genero] ([Cod_Genero], [Nombre]) VALUES (2, N'ARPG')
INSERT [dbo].[Genero] ([Cod_Genero], [Nombre]) VALUES (7, N'Aventura')
INSERT [dbo].[Genero] ([Cod_Genero], [Nombre]) VALUES (4, N'FPS')
INSERT [dbo].[Genero] ([Cod_Genero], [Nombre]) VALUES (3, N'Plataforma')
INSERT [dbo].[Genero] ([Cod_Genero], [Nombre]) VALUES (5, N'Point and Click')
INSERT [dbo].[Genero] ([Cod_Genero], [Nombre]) VALUES (1, N'RPG')
SET IDENTITY_INSERT [dbo].[Genero] OFF
/****** Object:  Table [dbo].[Juego]    Script Date: 11/15/2018 02:15:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Juego](
	[Id_juego] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](1000) NOT NULL,
	[Fecha_Lanzamiento] [date] NOT NULL,
	[Desarrollador] [nvarchar](50) NOT NULL,
	[Distribuidor] [nvarchar](50) NOT NULL,
	[Genero] [int] NOT NULL,
	[Idioma] [nvarchar](50) NOT NULL,
	[Precio] [float] NOT NULL,
	[Imagen] [nvarchar](100) NOT NULL,
	[Clasificacion] [nvarchar](50) NOT NULL,
	[Pagina_oficial] [nvarchar](50) NULL,
 CONSTRAINT [PK__Juego__DB51539307020F21] PRIMARY KEY CLUSTERED 
(
	[Id_juego] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Juego] ON
INSERT [dbo].[Juego] ([Id_juego], [Nombre], [Descripcion], [Fecha_Lanzamiento], [Desarrollador], [Distribuidor], [Genero], [Idioma], [Precio], [Imagen], [Clasificacion], [Pagina_oficial]) VALUES (1, N'Transistor', N'dfgh', CAST(0x8C380B00 AS Date), N'Supergiant Games', N'Supergiant Games', 1, N'Español, Ingles', 60, N'~/img/covers/transistor.jpg', N'Pegi 12', N'supergiantgames.com')
SET IDENTITY_INSERT [dbo].[Juego] OFF
/****** Object:  Table [dbo].[DetallesCompra]    Script Date: 11/15/2018 02:15:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesCompra](
	[cod_compra] [int] IDENTITY(1000,1) NOT NULL,
	[cod_medio] [int] NOT NULL,
	[fecha_compra] [date] NOT NULL,
 CONSTRAINT [PK__Detalles__7666303A145C0A3F] PRIMARY KEY CLUSTERED 
(
	[cod_compra] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DetallesCompra] ON
INSERT [dbo].[DetallesCompra] ([cod_compra], [cod_medio], [fecha_compra]) VALUES (1001, 104, CAST(0xF13E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[DetallesCompra] OFF
/****** Object:  Table [dbo].[Usuario]    Script Date: 11/15/2018 02:15:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Usuario] [nvarchar](50) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Contraseña] [nvarchar](50) NOT NULL,
	[Telefono] [nvarchar](50) NOT NULL,
	[Cod_Pais] [int] NOT NULL,
	[Administrador] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [Apellido], [Email], [Contraseña], [Telefono], [Cod_Pais], [Administrador]) VALUES (N'Root093', N'Federico', N'Borja', N'fedeosan@gmail.com', N'antiguos', N'15985577', 1, 1)
/****** Object:  StoredProcedure [dbo].[spEliminarPais]    Script Date: 11/15/2018 02:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarPais]
(
@COD_PAIS INT,
@NOMBRE NVARCHAR(50)
)
AS
DELETE Pais WHERE Cod_Pais = @COD_PAIS
RETURN
GO
/****** Object:  StoredProcedure [dbo].[spEliminarMedio]    Script Date: 11/15/2018 02:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarMedio]
(
@COD_MEDIO INT,
@DESCRIPCION NVARCHAR(50)
)
AS
DELETE MedioPago WHERE Cod_MPago = @COD_MEDIO
RETURN
GO
/****** Object:  StoredProcedure [dbo].[spEliminarGenero]    Script Date: 11/15/2018 02:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarGenero]
(
@COD_GENERO INT,
@NOMBRE NVARCHAR(50)
)
AS
DELETE Genero WHERE Cod_Genero = @COD_GENERO
RETURN
GO
/****** Object:  StoredProcedure [dbo].[spActualizarPais]    Script Date: 11/15/2018 02:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarPais]
(
@COD_PAIS INT,
@NOMBRE NVARCHAR(50)
)
AS
UPDATE Pais
SET
Nombre=@NOMBRE
WHERE Cod_Pais=@COD_PAIS
RETURN
GO
/****** Object:  StoredProcedure [dbo].[spActualizarMedio]    Script Date: 11/15/2018 02:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarMedio]
(
@COD_MEDIO INT,
@DESCRIPCION NVARCHAR(50)
)
AS
UPDATE MedioPago
SET
Descripcion=@DESCRIPCION
WHERE Cod_MPago=@COD_MEDIO
RETURN
GO
/****** Object:  StoredProcedure [dbo].[spActualizarGenero]    Script Date: 11/15/2018 02:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarGenero]
(
@COD_GENERO INT,
@NOMBRE NVARCHAR(50)
)
AS
UPDATE Genero
SET
Nombre=@NOMBRE
WHERE Cod_Genero=@COD_GENERO
RETURN
GO
/****** Object:  Table [dbo].[Review]    Script Date: 11/15/2018 02:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[Cod_Review] [int] IDENTITY(1,1) NOT NULL,
	[Id_juego] [int] NOT NULL,
	[Cod_Usuario] [nvarchar](50) NOT NULL,
	[Review] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[Cod_Review] ASC,
	[Id_juego] ASC,
	[Cod_Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[juegoXusuario]    Script Date: 11/15/2018 02:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[juegoXusuario](
	[Cod_Compra] [int] NOT NULL,
	[Id_juego] [int] NOT NULL,
	[Cod_Usuario] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[Id_juego] ASC,
	[Cod_Usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[juegoXusuario] ([Cod_Compra], [Id_juego], [Cod_Usuario]) VALUES (1001, 1, N'Root093')
/****** Object:  StoredProcedure [dbo].[spEliminarReview]    Script Date: 11/15/2018 02:16:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarReview]
(
@COD_REVIEW int
)
AS
DELETE Review WHERE Cod_Review = @COD_REVIEW
RETURN
GO
/****** Object:  ForeignKey [FK__Juego__Genero__08EA5793]    Script Date: 11/15/2018 02:15:54 ******/
ALTER TABLE [dbo].[Juego]  WITH CHECK ADD  CONSTRAINT [FK__Juego__Genero__08EA5793] FOREIGN KEY([Genero])
REFERENCES [dbo].[Genero] ([Cod_Genero])
GO
ALTER TABLE [dbo].[Juego] CHECK CONSTRAINT [FK__Juego__Genero__08EA5793]
GO
/****** Object:  ForeignKey [FK__DetallesC__cod_m__164452B1]    Script Date: 11/15/2018 02:15:54 ******/
ALTER TABLE [dbo].[DetallesCompra]  WITH CHECK ADD  CONSTRAINT [FK__DetallesC__cod_m__164452B1] FOREIGN KEY([cod_medio])
REFERENCES [dbo].[MedioPago] ([Cod_MPago])
GO
ALTER TABLE [dbo].[DetallesCompra] CHECK CONSTRAINT [FK__DetallesC__cod_m__164452B1]
GO
/****** Object:  ForeignKey [FK__Usuario__Cod_Pai__0DAF0CB0]    Script Date: 11/15/2018 02:15:54 ******/
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([Cod_Pais])
REFERENCES [dbo].[Pais] ([Cod_Pais])
GO
/****** Object:  ForeignKey [FK__Review__Cod_Usua__1ED998B2]    Script Date: 11/15/2018 02:16:04 ******/
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK__Review__Cod_Usua__1ED998B2] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Usuario])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK__Review__Cod_Usua__1ED998B2]
GO
/****** Object:  ForeignKey [FK__Review__Id_juego__1DE57479]    Script Date: 11/15/2018 02:16:04 ******/
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK__Review__Id_juego__1DE57479] FOREIGN KEY([Id_juego])
REFERENCES [dbo].[Juego] ([Id_juego])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK__Review__Id_juego__1DE57479]
GO
/****** Object:  ForeignKey [FK__juegoXusu__Cod_C__1920BF5C]    Script Date: 11/15/2018 02:16:04 ******/
ALTER TABLE [dbo].[juegoXusuario]  WITH CHECK ADD  CONSTRAINT [FK__juegoXusu__Cod_C__1920BF5C] FOREIGN KEY([Cod_Compra])
REFERENCES [dbo].[DetallesCompra] ([cod_compra])
GO
ALTER TABLE [dbo].[juegoXusuario] CHECK CONSTRAINT [FK__juegoXusu__Cod_C__1920BF5C]
GO
/****** Object:  ForeignKey [FK__juegoXusu__Cod_U__1B0907CE]    Script Date: 11/15/2018 02:16:04 ******/
ALTER TABLE [dbo].[juegoXusuario]  WITH CHECK ADD FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[Usuario] ([Usuario])
GO
/****** Object:  ForeignKey [FK__juegoXusu__Id_ju__1A14E395]    Script Date: 11/15/2018 02:16:04 ******/
ALTER TABLE [dbo].[juegoXusuario]  WITH CHECK ADD  CONSTRAINT [FK__juegoXusu__Id_ju__1A14E395] FOREIGN KEY([Id_juego])
REFERENCES [dbo].[Juego] ([Id_juego])
GO
ALTER TABLE [dbo].[juegoXusuario] CHECK CONSTRAINT [FK__juegoXusu__Id_ju__1A14E395]
GO
