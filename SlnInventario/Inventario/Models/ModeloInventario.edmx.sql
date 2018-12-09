USE [master]
GO
/****** Object:  Database [dbInventario]    Script Date: 08/12/2018 04:04:09 p. m. ******/
CREATE DATABASE [dbInventario]

GO
ALTER DATABASE [dbInventario] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbInventario].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbInventario] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbInventario] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbInventario] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbInventario] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbInventario] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbInventario] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbInventario] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbInventario] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbInventario] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbInventario] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbInventario] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbInventario] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbInventario] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbInventario] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbInventario] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbInventario] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbInventario] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbInventario] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbInventario] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbInventario] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbInventario] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbInventario] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbInventario] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbInventario] SET  MULTI_USER 
GO
ALTER DATABASE [dbInventario] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbInventario] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbInventario] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbInventario] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbInventario] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbInventario', N'ON'
GO
USE [dbInventario]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 08/12/2018 04:04:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 08/12/2018 04:04:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id_Cliente] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Correo] [varchar](50) NOT NULL,
	[Direccion] [varchar](150) NOT NULL,
	[Telefono] [int] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 08/12/2018 04:04:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[IdDetalle] [int] NOT NULL,
	[IdFactura] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [float] NOT NULL,
	[Precio] [float] NOT NULL,
 CONSTRAINT [PK_DetalleFactura] PRIMARY KEY CLUSTERED 
(
	[IdDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Factura]    Script Date: 08/12/2018 04:04:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Factura](
	[IdFactura] [int] NOT NULL,
	[IdCliente] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[PrecioTotal] [float] NOT NULL,
	[NombreTienda] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Ubicacion] [varchar](120) NOT NULL,
	[Correo] [varchar](80) NOT NULL,
	[Facebook] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 08/12/2018 04:04:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Cantidad_Stock] [int] NOT NULL,
	[Descripcion] [int] NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[Talla] [varchar](5) NOT NULL,
	[PrecioMayor] [float] NOT NULL,
	[PrecioDetalle] [float] NOT NULL,
	[PrecioCosto] [float] NOT NULL,
	[Color] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 08/12/2018 04:04:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Telefono]    Script Date: 08/12/2018 04:04:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefono](
	[IdTelefono] [int] NOT NULL,
	[TelefonoCasa] [int] NULL,
	[TelefonoCelular] [int] NULL,
 CONSTRAINT [PK_Telefono] PRIMARY KEY CLUSTERED 
(
	[IdTelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 08/12/2018 04:04:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] NOT NULL,
	[IdRol] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Cuenta] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Telefono] FOREIGN KEY([Telefono])
REFERENCES [dbo].[Telefono] ([IdTelefono])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Telefono]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_DetalleFactura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([IdFactura])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_DetalleFactura]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Producto]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([Id_Cliente])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Telefono_Telefono] FOREIGN KEY([IdTelefono])
REFERENCES [dbo].[Telefono] ([IdTelefono])
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Telefono_Telefono]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol]
GO
USE [master]
GO
ALTER DATABASE [dbInventario] SET  READ_WRITE 
GO
