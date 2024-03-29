USE [master]
GO
/****** Object:  Database [TecnoCell]    Script Date: 16/6/2019 11:43:02 AM ******/
CREATE DATABASE [TecnoCell]
 /*
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TecnoCell', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TecnoCell.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TecnoCell_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TecnoCell_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
*/
ALTER DATABASE [TecnoCell] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TecnoCell].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TecnoCell] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TecnoCell] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TecnoCell] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TecnoCell] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TecnoCell] SET ARITHABORT OFF 
GO
ALTER DATABASE [TecnoCell] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TecnoCell] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TecnoCell] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TecnoCell] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TecnoCell] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TecnoCell] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TecnoCell] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TecnoCell] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TecnoCell] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TecnoCell] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TecnoCell] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TecnoCell] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TecnoCell] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TecnoCell] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TecnoCell] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TecnoCell] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TecnoCell] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TecnoCell] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TecnoCell] SET  MULTI_USER 
GO
ALTER DATABASE [TecnoCell] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TecnoCell] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TecnoCell] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TecnoCell] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TecnoCell] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TecnoCell] SET QUERY_STORE = OFF
GO
USE [TecnoCell]
GO
/****** Object:  Table [dbo].[Acceso]    Script Date: 16/6/2019 11:43:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acceso](
	[Id_Acceso] BIT NOT NULL
	CONSTRAINT PK_Acceso_Id_Acceso PRIMARY KEY CLUSTERED, 
	[Cargos] [nchar](30) NULL,
	[Fecha] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 16/6/2019 11:43:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[Id_Articulo] INT IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_Articulo_Id_Articulo PRIMARY KEY CLUSTERED, 
	[Codigo] [nchar](10) NULL,
	[Nombre] [nchar](20) NULL,
	[Descripcion] TEXT NULL,
	[Id_Categoria] [nchar](20) NULL,
	[Fecha] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 16/6/2019 11:43:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id_Categoria] INT IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_Categoria_Id_Categoria PRIMARY KEY CLUSTERED, 
	[Nombre] [nchar](20) NULL,
	[Descripcion] TEXT NULL,
	[Fecha] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 16/6/2019 11:43:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id_Cliente] INT IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_Cliente_Id_Cliente PRIMARY KEY CLUSTERED, 
	[Nombre] [nchar](20) NULL,
	[Apellido] [nchar](20) NULL,
	[Genero] [nchar](20) NULL,
	[Direccion] TEXT NULL,
	[Telefono] [nchar](10) NULL,
	[Correo] [nchar](50) NULL,
	[Fecha_Nacimiento] [datetime] NULL,
	[Fecha] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 16/6/2019 11:43:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Compra](
	[Id_Compra] INT IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_Compra_Id_Compra PRIMARY KEY CLUSTERED, 
	[Id_Proveedor] INT NULL,
	[Id_Comprobante] INT NULL,
	[Id_Detalle_Compra] INT NULL,
	[Serie] [nchar](10) NULL,
	[Correlativo] [nchar](10) NULL,
	[Id_ISV] INT NULL,
	[Estado] [nchar](20) NULL,
	[Fecha] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comprobante]    Script Date: 16/6/2019 11:43:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comprobante](
	[Id_Comprobante] INT IDENTITY (1,1) NOT NULL
	CONSTRAINT PK_Comprobante_Id_Comprobante PRIMARY KEY CLUSTERED, 
	[Tipo] [nchar](20) NULL,
	[Fecha] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Compra]    Script Date: 16/6/2019 11:43:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[Detalle_Compra](
	[Id_Detalle_Compra] INT IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_Detalle_Compra_Id_Detalle_Compra PRIMARY KEY CLUSTERED, 
	[Id_Articulo] INT NULL,
	[Detalle] [nchar](20) NULL,
	[Precio_Compra] FLOAT NOT NULL,
	[Precio_Venta] FLOAT NOT NULL,
	[Stock] INT NULL,
	[Fecha] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_Venta]    Script Date: 16/6/2019 11:43:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE TABLE [dbo].[Detalle_Venta](
	[Id_Detalle_Venta] INT IDENTITY (1,1) NOT NULL
	CONSTRAINT PK_Detalle_Venta_Id_Detalle_Venta PRIMARY KEY CLUSTERED, 
	[Id_Articulo] INT NULL,
	[Detalle] [nchar](20) NULL,
	[Cantidad] INT NULL,
	[Precio] FLOAT NULL,
	[Descuento] FLOAT NULL,
	[Fecha] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 16/6/2019 11:43:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Empleado](
	[Id_Empleado] INT IDENTITY(1,1) NOT NULL
	CONSTRAINT PK_Empleado_Id_Empleado PRIMARY KEY CLUSTERED, 
	[Nombre] [nchar](20) NULL,
	[Apellido] [nchar](20) NULL,
	[Genero] [nchar](20) NULL,
	[Id_Acceso] INT NULL,
	[Id_Usuario] INT NULL,
	[Id_Foto] [image] NULL,
	[Fecha] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foto]    Script Date: 16/6/2019 11:43:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
--
--NO ME CONVENCE
--
--
--
CREATE TABLE [dbo].[Foto](
	[Id_Foto] INT IDENTITY (1,1) NOT NULL
	CONSTRAINT PK_Foto_Id_Foto PRIMARY KEY CLUSTERED, 
	[Foto] [image] NULL,
	[Fecha] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ISV]    Script Date: 16/6/2019 11:43:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--
--NO ME CONVENCE
--
--
--
CREATE TABLE [dbo].[ISV](
	[Id_ISV] INT  IDENTITY (1,1) NOT NULL
	CONSTRAINT PK_ISV_Id_ISV PRIMARY KEY CLUSTERED, 
	[ISV] FLOAT NOT NULL,
	[Fecha] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 16/6/2019 11:43:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[Id_Proveedor] INT IDENTITY (1,1) NOT NULL
	CONSTRAINT PK_Proveedor_Id_Proveedor PRIMARY KEY CLUSTERED, 
	[Nombre] [nchar](20) NULL,
	[Sector_Comercial] [nchar](20) NULL,
	[Tipo_Documento] [nchar](20) NULL,
	[Documento] [nchar](20) NULL,
	[Direccion] [nchar](30) NULL,
	[Telefono] [nchar](10) NULL,
	[Correo] [nchar](30) NULL,
	[Fecha] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 16/6/2019 11:43:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id_Usuario] INT IDENTITY (1,1) NOT NULL
	CONSTRAINT PK_Usuario_Id_Usuario PRIMARY KEY CLUSTERED, 
	[Nombre] [nchar](20) NULL,
	[Contraseña] [nchar](20) NULL,
	[Fecha] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 16/6/2019 11:43:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


---------------------------------
---------------------------------
------------------------------asdfghjklkjhgfghjkhgfdfghjkkfdfghjkjhgfdfghjkjhgfdfghjkjhgfdghjkjhgfdfghjkjhgfdfghjhgfdfghjhgfd
--------------------------------
--------------------------------
CREATE TABLE [dbo].[Venta](
	[Id_Venta] INT IDENTITY (1,1) NOT NULL
	CONSTRAINT PK_Venta_Id_Venta PRIMARY KEY CLUSTERED, 
	[Id_Empleado] INT NULL,
	[Id_Cliente] INT NULL,
	[Id_Comprobante] INT NULL,
	[Id_Detalle_Venta] INT NULL,
	[Serie] [nchar](20) NULL,
	[Correlativo] [nchar](20) NULL,
	[Id_ISV] INT NULL,
	[Fecha] [datetime] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [TecnoCell] SET  READ_WRITE 
GO


ALTER TABLE [dbo].[Articulo]
	ADD CONSTRAINT FK_Articulo_Id_Categoria$Categoria_Id_Categoria
	FOREIGN KEY ([Id_Categoria]) REFERENCES [dbo].[Categoria]([Id_Categoria])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO


ALTER TABLE [dbo].[Compra]
	ADD CONSTRAINT FK_Compra_Id_Proveedor$Proveedor_Id_Proveedor
	FOREIGN KEY ([Id_Proveedor]) REFERENCES [dbo].[Proveedor]([Id_Proveedor])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO

ALTER TABLE [dbo].[Compra]
	ADD CONSTRAINT FK_Compra_Id_Comprobante$Comprobante_Id_Comprobante
	FOREIGN KEY ([Id_Comprobante]) REFERENCES [dbo].[Comprobante]([Id_Comprobante])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO

ALTER TABLE [dbo].[Compra]
	ADD CONSTRAINT FK_Compra_Id_Detalle_Compra$Detalle_Compra_Id_Detalle_Compra
	FOREIGN KEY ([Id_Detalle_Compra]) REFERENCES [dbo].[Detalle_Compra]([Id_Detalle_Compra])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO

ALTER TABLE [dbo].[Compra]
	ADD CONSTRAINT FK_Compra_Id_ISV$ISV_Id_ISV
	FOREIGN KEY ([Id_ISV]) REFERENCES [dbo].[ISV]([Id_ISV])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO


ALTER TABLE [dbo].[Detalle_Compra]
	ADD CONSTRAINT FK_Detalle_Compra_Id_Articulo$Articulo_Id_Articulo
	FOREIGN KEY ([Id_Articulo]) REFERENCES [dbo].[Articulo]([Id_Articulo])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO



ALTER TABLE [dbo].[Detalle_Venta]
	ADD CONSTRAINT FK_Detalle_venta_Id_Articulo$Articulo_Id_Articulo
	FOREIGN KEY ([Id_Articulo]) REFERENCES [dbo].[Articulo]([Id_Articulo])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO




ALTER TABLE [dbo].[Empleado]
	ADD CONSTRAINT FK_Empleado_Id_Acceso$Acceso_Id_Acceso
	FOREIGN KEY ([Id_Acceso]) REFERENCES [dbo].[Acceso]([Id_Acceso])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO

ALTER TABLE [dbo].[Empleado]
	ADD CONSTRAINT FK_Empleado_Id_Usuario$Usuario_Id_Usuario
	FOREIGN KEY ([Id_Usuario]) REFERENCES [dbo].[Usuario]([Id_Usuario])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO

ALTER TABLE [dbo].[Empleado]
	ADD CONSTRAINT FK_Empleado_Id_Usuario$Usuario_Id_Usuario
	FOREIGN KEY ([Id_Foto]) REFERENCES [dbo].[Foto]([Id_Foto])
	ON UPDATE NO ACTION
	ON DELETE NO ACTION
GO