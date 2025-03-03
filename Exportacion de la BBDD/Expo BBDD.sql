USE [master]
GO
/****** Object:  Database [db_AgenciaCarros]    Script Date: 3/03/2025 09:59:25 ******/
CREATE DATABASE [db_AgenciaCarros]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_AgenciaCarros', FILENAME = N'C:\SQL Data\db_AgenciaCarros.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_AgenciaCarros_log', FILENAME = N'C:\SQL Data\db_AgenciaCarros_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_AgenciaCarros] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_AgenciaCarros].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_AgenciaCarros] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [db_AgenciaCarros] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_AgenciaCarros] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_AgenciaCarros] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_AgenciaCarros] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_AgenciaCarros] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_AgenciaCarros] SET  MULTI_USER 
GO
ALTER DATABASE [db_AgenciaCarros] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_AgenciaCarros] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_AgenciaCarros] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_AgenciaCarros] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_AgenciaCarros] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_AgenciaCarros] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_AgenciaCarros] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_AgenciaCarros] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_AgenciaCarros]
GO
/****** Object:  Table [dbo].[tblClientes]    Script Date: 3/03/2025 09:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClientes](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Apellido] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Telefono] [nvarchar](20) NULL,
	[Estado] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVehiculos]    Script Date: 3/03/2025 09:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVehiculos](
	[VehiculoID] [int] IDENTITY(1,1) NOT NULL,
	[Marca] [nvarchar](50) NOT NULL,
	[Modelo] [nvarchar](50) NOT NULL,
	[Año] [int] NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Estado] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[VehiculoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVentas]    Script Date: 3/03/2025 09:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVentas](
	[VentaID] [int] IDENTITY(1,1) NOT NULL,
	[VehiculoID] [int] NULL,
	[ClienteID] [int] NULL,
	[FechaVenta] [date] NOT NULL,
	[Monto] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VentaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewVentCliVehi]    Script Date: 3/03/2025 09:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[viewVentCliVehi] as
select v.VentaID,
v.ClienteID,
v.VehiculoID,
v.FechaVenta,
v.Monto,
vh.Año ,
vh.Estado AS EstadoVehiculo,
vh.Marca,
vh.Modelo,
vh.Precio,
c.Nombre,
c.Apellido,
c.Telefono,
c.Estado AS EstadoCliente,
c.Email
from tblClientes c
inner join tblVentas v on c.ClienteID = v.ClienteID
inner join tblVehiculos vh on v.VehiculoID = vh.VehiculoID;
GO
/****** Object:  View [dbo].[viewClientesComp1]    Script Date: 3/03/2025 09:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[viewClientesComp1] as
select c.Nombre,
c.Apellido,
c.Telefono,
c.Estado AS EstadoCliente,
c.Email
from tblClientes c
inner join tblVentas v on c.ClienteID = v.ClienteID
group by c.Nombre,
c.Apellido,
c.Telefono,
c.Estado,
c.Email
having COUNT(v.ClienteID)>1;
GO
/****** Object:  View [dbo].[viewVehiculoDisponible]    Script Date: 3/03/2025 09:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[viewVehiculoDisponible] AS
select *
from tblVehiculos
where Estado = 'Disponible';
GO
/****** Object:  View [dbo].[viewVehiculos]    Script Date: 3/03/2025 09:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--a. Mostrar nombre, apellido y precio de todos los vehículos con un precio mayor a 20,000.
CREATE view [dbo].[viewVehiculos] as
(
select c.Nombre,
c.Apellido,
vh.Precio
from tblClientes c
INNER JOIN tblVentas v ON c.ClienteID = v.ClienteID  
INNER JOIN tblVehiculos vh ON v.VehiculoID = vh.VehiculoID 
where vh.Precio >20000
);
GO
/****** Object:  View [dbo].[viewCliente]    Script Date: 3/03/2025 09:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[viewCliente] as
(	select c.Nombre,
			c.Apellido,
			SUM(v.Monto) as MontoTotalGastado
	from tblClientes c
			INNER JOIN tblVentas v ON c.ClienteID = v.ClienteID
			group by c.Nombre, c.Apellido
);
GO
/****** Object:  View [dbo].[vw_VentasDetalles]    Script Date: 3/03/2025 09:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_VentasDetalles] AS
SELECT 
    v.*,
    c.Nombre + ' ' + c.Apellido AS Cliente,
    vh.Marca + ' ' + vh.Modelo + ' ' + CAST(vh.Año AS NVARCHAR) AS Vehiculo
FROM tblVentas v
INNER JOIN tblClientes c ON v.ClienteID = c.ClienteID
INNER JOIN tblVehiculos vh ON v.VehiculoID = vh.VehiculoID;
GO
SET IDENTITY_INSERT [dbo].[tblClientes] ON 

INSERT [dbo].[tblClientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Estado]) VALUES (1, N'Juan', N'Pérez', N'juan.perez@example.com', N'1234567890', N'Activo')
INSERT [dbo].[tblClientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Estado]) VALUES (2, N'María', N'González', N'maria.gonzalez@example.com', N'0987654321', N'Activo')
INSERT [dbo].[tblClientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Estado]) VALUES (3, N'Luis', N'Fernández', N'luis.fernandez@example.com', N'2345678901', N'Activo')
INSERT [dbo].[tblClientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Estado]) VALUES (4, N'Ana', N'Martínez', N'ana.martinez@example.com', N'3456789012', N'Activo')
INSERT [dbo].[tblClientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Estado]) VALUES (5, N'Carlos', N'López', N'carlos.lopez@example.com', N'4567890123', N'Activo')
INSERT [dbo].[tblClientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Estado]) VALUES (6, N'Laura', N'Torres', N'laura.torres@example.com', N'5678901234', N'Activo')
INSERT [dbo].[tblClientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Estado]) VALUES (7, N'Pedro', N'Ramírez', N'pedro.ramirez@example.com', N'6789012345', N'Activo')
INSERT [dbo].[tblClientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Estado]) VALUES (8, N'Sofía', N'Hernández', N'sofia.hernandez@example.com', N'7890123456', N'Activo')
INSERT [dbo].[tblClientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Estado]) VALUES (9, N'Diego', N'Mendoza', N'diego.mendoza@example.com', N'8901234567', N'Activo')
INSERT [dbo].[tblClientes] ([ClienteID], [Nombre], [Apellido], [Email], [Telefono], [Estado]) VALUES (10, N'Valeria', N'Sánchez', N'valeria.sanchez@example.com', N'9012345678', N'Activo')
SET IDENTITY_INSERT [dbo].[tblClientes] OFF
GO
SET IDENTITY_INSERT [dbo].[tblVehiculos] ON 

INSERT [dbo].[tblVehiculos] ([VehiculoID], [Marca], [Modelo], [Año], [Precio], [Estado]) VALUES (1, N'Toyota', N'Corolla', 2020, CAST(20000.00 AS Decimal(18, 2)), N'Disponible')
INSERT [dbo].[tblVehiculos] ([VehiculoID], [Marca], [Modelo], [Año], [Precio], [Estado]) VALUES (2, N'Honda', N'Civic', 2019, CAST(22000.00 AS Decimal(18, 2)), N'Disponible')
INSERT [dbo].[tblVehiculos] ([VehiculoID], [Marca], [Modelo], [Año], [Precio], [Estado]) VALUES (3, N'Ford', N'Focus', 2021, CAST(21000.00 AS Decimal(18, 2)), N'Disponible')
INSERT [dbo].[tblVehiculos] ([VehiculoID], [Marca], [Modelo], [Año], [Precio], [Estado]) VALUES (4, N'Chevrolet', N'Malibu', 2020, CAST(23000.00 AS Decimal(18, 2)), N'Disponible')
INSERT [dbo].[tblVehiculos] ([VehiculoID], [Marca], [Modelo], [Año], [Precio], [Estado]) VALUES (5, N'Nissan', N'Altima', 2018, CAST(19000.00 AS Decimal(18, 2)), N'Disponible')
INSERT [dbo].[tblVehiculos] ([VehiculoID], [Marca], [Modelo], [Año], [Precio], [Estado]) VALUES (6, N'Hyundai', N'Elantra', 2021, CAST(18000.00 AS Decimal(18, 2)), N'Disponible')
INSERT [dbo].[tblVehiculos] ([VehiculoID], [Marca], [Modelo], [Año], [Precio], [Estado]) VALUES (7, N'Kia', N'Forte', 2020, CAST(17500.00 AS Decimal(18, 2)), N'Disponible')
INSERT [dbo].[tblVehiculos] ([VehiculoID], [Marca], [Modelo], [Año], [Precio], [Estado]) VALUES (8, N'Volkswagen', N'Jetta', 2019, CAST(20000.00 AS Decimal(18, 2)), N'Disponible')
INSERT [dbo].[tblVehiculos] ([VehiculoID], [Marca], [Modelo], [Año], [Precio], [Estado]) VALUES (9, N'Subaru', N'Impreza', 2021, CAST(21000.00 AS Decimal(18, 2)), N'Disponible')
INSERT [dbo].[tblVehiculos] ([VehiculoID], [Marca], [Modelo], [Año], [Precio], [Estado]) VALUES (10, N'Mazda', N'3', 2020, CAST(22000.00 AS Decimal(18, 2)), N'Disponible')
INSERT [dbo].[tblVehiculos] ([VehiculoID], [Marca], [Modelo], [Año], [Precio], [Estado]) VALUES (11, N'z', N'z', 2023, CAST(12.00 AS Decimal(18, 2)), N'z')
SET IDENTITY_INSERT [dbo].[tblVehiculos] OFF
GO
SET IDENTITY_INSERT [dbo].[tblVentas] ON 

INSERT [dbo].[tblVentas] ([VentaID], [VehiculoID], [ClienteID], [FechaVenta], [Monto]) VALUES (1, 1, 1, CAST(N'2023-01-15' AS Date), CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblVentas] ([VentaID], [VehiculoID], [ClienteID], [FechaVenta], [Monto]) VALUES (2, 2, 2, CAST(N'2023-01-20' AS Date), CAST(22000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblVentas] ([VentaID], [VehiculoID], [ClienteID], [FechaVenta], [Monto]) VALUES (3, 3, 3, CAST(N'2023-01-25' AS Date), CAST(21000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblVentas] ([VentaID], [VehiculoID], [ClienteID], [FechaVenta], [Monto]) VALUES (4, 4, 4, CAST(N'2023-01-30' AS Date), CAST(23000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblVentas] ([VentaID], [VehiculoID], [ClienteID], [FechaVenta], [Monto]) VALUES (5, 5, 5, CAST(N'2023-02-05' AS Date), CAST(19000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblVentas] ([VentaID], [VehiculoID], [ClienteID], [FechaVenta], [Monto]) VALUES (6, 6, 6, CAST(N'2023-02-10' AS Date), CAST(18000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblVentas] ([VentaID], [VehiculoID], [ClienteID], [FechaVenta], [Monto]) VALUES (7, 7, 7, CAST(N'2023-02-15' AS Date), CAST(17500.00 AS Decimal(18, 2)))
INSERT [dbo].[tblVentas] ([VentaID], [VehiculoID], [ClienteID], [FechaVenta], [Monto]) VALUES (8, 8, 8, CAST(N'2023-02-20' AS Date), CAST(20000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblVentas] ([VentaID], [VehiculoID], [ClienteID], [FechaVenta], [Monto]) VALUES (9, 9, 9, CAST(N'2023-02-25' AS Date), CAST(21000.00 AS Decimal(18, 2)))
INSERT [dbo].[tblVentas] ([VentaID], [VehiculoID], [ClienteID], [FechaVenta], [Monto]) VALUES (10, 10, 10, CAST(N'2023-03-01' AS Date), CAST(22000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[tblVentas] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblClien__A9D10534693F3EE5]    Script Date: 3/03/2025 09:59:25 ******/
ALTER TABLE [dbo].[tblClientes] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblVentas]  WITH CHECK ADD FOREIGN KEY([ClienteID])
REFERENCES [dbo].[tblClientes] ([ClienteID])
GO
ALTER TABLE [dbo].[tblVentas]  WITH CHECK ADD FOREIGN KEY([VehiculoID])
REFERENCES [dbo].[tblVehiculos] ([VehiculoID])
GO
/****** Object:  StoredProcedure [dbo].[uspTblVehiculosMostrar]    Script Date: 3/03/2025 09:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<David>
-- Create date: <24/02/2025>
-- Description:	<usp para Mostrar>
-- =============================================
CREATE PROCEDURE [dbo].[uspTblVehiculosMostrar] -- Sin < >
AS
BEGIN

	SET NOCOUNT ON;

	select VehiculoID,
	Marca,
	Modelo,
	Año,
	Precio,
	Estado
	from tblVehiculos;
END
GO
/****** Object:  StoredProcedure [dbo].[uspVehiculosDelete]    Script Date: 3/03/2025 09:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David
-- Create date: 24/02/2025
-- Description:	Procedimiento para eliminar vehículos
-- =============================================
CREATE PROCEDURE [dbo].[uspVehiculosDelete]
	@VehiculoID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    delete tblVehiculos
	where VehiculoID = @VehiculoID;
END
GO
/****** Object:  StoredProcedure [dbo].[uspVehiculosInsertar]    Script Date: 3/03/2025 09:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<David>
-- Create date: <24/02/2025>
-- Description:	<usp para insertar>
-- =============================================
CREATE PROCEDURE [dbo].[uspVehiculosInsertar] 
		@Marca varchar(100),
		@Modelo varchar(100),
		@Año int,
		@Precio decimal(18,2),
		@Estado varchar(100)
AS
BEGIN

	SET NOCOUNT ON;

    insert into tblVehiculos(Marca,Modelo,Año,Precio,Estado)
	values(@Marca, @Modelo, @Año, @Precio, @Estado);
END
GO
/****** Object:  StoredProcedure [dbo].[uspVehiculosUpdate]    Script Date: 3/03/2025 09:59:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		David
-- Create date: 24/02/2025
-- Description:	Procedimiento para actualizar vehículos
-- =============================================
CREATE PROCEDURE [dbo].[uspVehiculosUpdate]
		@VehiculoID INT,
		@Marca VARCHAR(100),
		@Modelo VARCHAR(100),
		@Año INT,
		@Precio DECIMAL(18,2),
		@Estado VARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE tblVehiculos
    SET
        Marca = @Marca,
        Modelo = @Modelo,
        Año = @Año,
        Precio = @Precio,
        Estado = @Estado
    WHERE VehiculoID = @VehiculoID;
END
GO
USE [master]
GO
ALTER DATABASE [db_AgenciaCarros] SET  READ_WRITE 
GO
