USE [master]
GO
/****** Object:  Database [Invoice]    Script Date: 10/10/2023 22:48:52 ******/
CREATE DATABASE [Invoice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Invoice', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Invoice.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Invoice_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Invoice_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Invoice] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Invoice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Invoice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Invoice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Invoice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Invoice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Invoice] SET ARITHABORT OFF 
GO
ALTER DATABASE [Invoice] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Invoice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Invoice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Invoice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Invoice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Invoice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Invoice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Invoice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Invoice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Invoice] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Invoice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Invoice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Invoice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Invoice] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Invoice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Invoice] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Invoice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Invoice] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Invoice] SET  MULTI_USER 
GO
ALTER DATABASE [Invoice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Invoice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Invoice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Invoice] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Invoice] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Invoice] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Invoice] SET QUERY_STORE = ON
GO
ALTER DATABASE [Invoice] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Invoice]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/10/2023 22:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice_Detail]    Script Date: 10/10/2023 22:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice_Detail](
	[IdDetalle] [int] IDENTITY(1,1) NOT NULL,
	[IdCabecera] [int] NOT NULL,
	[CodigoProducto] [nvarchar](128) NULL,
	[DescripcionProducto] [nvarchar](max) NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Invoice_Detail] PRIMARY KEY CLUSTERED 
(
	[IdDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 10/10/2023 22:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[IdCabecera] [int] IDENTITY(1,1) NOT NULL,
	[NombreCliente] [nvarchar](max) NULL,
	[NombreEmpresa] [nvarchar](max) NULL,
	[DireccionEmpresa] [nvarchar](max) NULL,
	[TelEmpresa] [nvarchar](max) NULL,
	[NombreClienteEnvio] [nvarchar](max) NULL,
	[NombreEmpresaEnvio] [nvarchar](max) NULL,
	[DireccionEmpresaEnvio] [nvarchar](max) NULL,
	[TelEmpresaEnvio] [nvarchar](max) NULL,
	[NombreVendedor] [nvarchar](max) NULL,
	[OrdenCompra] [nvarchar](max) NULL,
	[EnviarPor] [nvarchar](max) NULL,
	[TerminosCondiciones] [nvarchar](max) NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[Vencimiento] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Invoices] PRIMARY KEY CLUSTERED 
(
	[IdCabecera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/10/2023 22:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[CodigoProducto] [nvarchar](128) NOT NULL,
	[DescripcionProducto] [nvarchar](max) NULL,
	[Stock] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 2) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[CodigoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CodigoProducto]    Script Date: 10/10/2023 22:48:52 ******/
CREATE NONCLUSTERED INDEX [IX_CodigoProducto] ON [dbo].[Invoice_Detail]
(
	[CodigoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_IdCabecera]    Script Date: 10/10/2023 22:48:52 ******/
CREATE NONCLUSTERED INDEX [IX_IdCabecera] ON [dbo].[Invoice_Detail]
(
	[IdCabecera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Invoice_Detail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Invoice_Detail_dbo.Invoices_IdCabecera] FOREIGN KEY([IdCabecera])
REFERENCES [dbo].[Invoices] ([IdCabecera])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Invoice_Detail] CHECK CONSTRAINT [FK_dbo.Invoice_Detail_dbo.Invoices_IdCabecera]
GO
ALTER TABLE [dbo].[Invoice_Detail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Invoice_Detail_dbo.Products_CodigoProducto] FOREIGN KEY([CodigoProducto])
REFERENCES [dbo].[Products] ([CodigoProducto])
GO
ALTER TABLE [dbo].[Invoice_Detail] CHECK CONSTRAINT [FK_dbo.Invoice_Detail_dbo.Products_CodigoProducto]
GO
USE [master]
GO
ALTER DATABASE [Invoice] SET  READ_WRITE 
GO
