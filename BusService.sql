USE [master]
GO
/****** Object:  Database [BusService]    Script Date: 8/22/2016 1:44:27 PM ******/
CREATE DATABASE [BusService]
GO
ALTER DATABASE [BusService] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BusService].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BusService] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BusService] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BusService] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BusService] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BusService] SET ARITHABORT OFF 
GO
ALTER DATABASE [BusService] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BusService] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BusService] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BusService] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BusService] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BusService] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BusService] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BusService] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BusService] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BusService] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BusService] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BusService] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BusService] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BusService] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BusService] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BusService] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BusService] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BusService] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BusService] SET  MULTI_USER 
GO
ALTER DATABASE [BusService] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BusService] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BusService] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BusService] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BusService]
GO
/****** Object:  Table [dbo].[bus]    Script Date: 8/22/2016 1:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bus](
	[busId] [int] IDENTITY(1,1) NOT NULL,
	[busNumber] [int] NOT NULL,
	[status] [nvarchar](50) NULL,
	[comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_bus] PRIMARY KEY CLUSTERED 
(
	[busId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[busRoute]    Script Date: 8/22/2016 1:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[busRoute](
	[busRouteCode] [nvarchar](10) NOT NULL,
	[routeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_busRoute] PRIMARY KEY CLUSTERED 
(
	[busRouteCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[busStop]    Script Date: 8/22/2016 1:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[busStop](
	[busStopNumber] [int] NOT NULL,
	[location] [nvarchar](50) NULL,
	[locationHash] [int] NOT NULL CONSTRAINT [DF_busStop_locationHash]  DEFAULT ((0)),
	[goingDowntown] [bit] NOT NULL CONSTRAINT [DF_busStop_goingDowntown]  DEFAULT ((1)),
 CONSTRAINT [PK_busStop] PRIMARY KEY CLUSTERED 
(
	[busStopNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[country]    Script Date: 8/22/2016 1:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[country](
	[countryCode] [char](2) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[postalPattern] [varchar](max) NULL,
	[phonePattern] [varchar](max) NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[countryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[driver]    Script Date: 8/22/2016 1:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[driver](
	[driverId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NULL,
	[lastName] [varchar](50) NULL,
	[fullName] [varchar](100) NULL,
	[homePhone] [varchar](50) NULL,
	[workPhone] [varchar](50) NULL,
	[street] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[postalCode] [varchar](10) NULL,
	[provinceCode] [char](2) NULL,
	[dateHired] [date] NULL,
 CONSTRAINT [PK_driver] PRIMARY KEY CLUSTERED 
(
	[driverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[province]    Script Date: 8/22/2016 1:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[province](
	[provinceCode] [char](2) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[countryCode] [char](2) NOT NULL,
	[taxCode] [varchar](50) NULL,
	[taxRate] [float] NOT NULL CONSTRAINT [DF_province_taxRate]  DEFAULT ((0)),
	[capital] [varchar](50) NULL,
 CONSTRAINT [PK_province] PRIMARY KEY CLUSTERED 
(
	[provinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[routeSchedule]    Script Date: 8/22/2016 1:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[routeSchedule](
	[routeScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[busRouteCode] [nvarchar](10) NULL CONSTRAINT [DF_routeSchedule_busRouteCode]  DEFAULT ((2)),
	[startTime] [time](7) NOT NULL,
	[isWeekDay] [bit] NOT NULL CONSTRAINT [DF_busScedule_WeekDaySchedule]  DEFAULT ((1)),
	[comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_busScedule] PRIMARY KEY CLUSTERED 
(
	[routeScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[routeStop]    Script Date: 8/22/2016 1:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[routeStop](
	[routeStopId] [int] IDENTITY(1,1) NOT NULL,
	[busRouteCode] [nvarchar](10) NULL CONSTRAINT [DF_routeStop_busRouteCode]  DEFAULT ((2)),
	[busStopNumber] [int] NULL,
	[offsetMinutes] [int] NULL,
 CONSTRAINT [PK_routeStop] PRIMARY KEY CLUSTERED 
(
	[routeStopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[trip]    Script Date: 8/22/2016 1:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trip](
	[tripId] [int] IDENTITY(1,1) NOT NULL,
	[routeScheduleId] [int] NOT NULL,
	[tripDate] [datetime] NOT NULL,
	[driverId] [int] NOT NULL,
	[busId] [int] NOT NULL,
	[comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_trip] PRIMARY KEY CLUSTERED 
(
	[tripId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tripStop]    Script Date: 8/22/2016 1:44:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tripStop](
	[tripStopId] [int] IDENTITY(1,1) NOT NULL,
	[tripId] [int] NOT NULL,
	[busStopNumber] [int] NOT NULL,
	[tripStopTime] [time](7) NOT NULL,
	[comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_tripStop] PRIMARY KEY CLUSTERED 
(
	[tripStopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[bus] ON 

INSERT [dbo].[bus] ([busId], [busNumber], [status], [comments]) VALUES (1, 199701, N'available', NULL)
INSERT [dbo].[bus] ([busId], [busNumber], [status], [comments]) VALUES (2, 199702, N'annual overhaul', NULL)
INSERT [dbo].[bus] ([busId], [busNumber], [status], [comments]) VALUES (3, 199802, N'available', NULL)
INSERT [dbo].[bus] ([busId], [busNumber], [status], [comments]) VALUES (4, 199801, N'available', NULL)
INSERT [dbo].[bus] ([busId], [busNumber], [status], [comments]) VALUES (5, 201302, N'available', N'wheelchair accessible')
INSERT [dbo].[bus] ([busId], [busNumber], [status], [comments]) VALUES (6, 200002, N'available', NULL)
INSERT [dbo].[bus] ([busId], [busNumber], [status], [comments]) VALUES (7, 200003, N'available', NULL)
INSERT [dbo].[bus] ([busId], [busNumber], [status], [comments]) VALUES (8, 200001, N'available', N'15 passenger mini-bus')
INSERT [dbo].[bus] ([busId], [busNumber], [status], [comments]) VALUES (9, 201303, N'available', NULL)
INSERT [dbo].[bus] ([busId], [busNumber], [status], [comments]) VALUES (10, 201301, N'available', NULL)
SET IDENTITY_INSERT [dbo].[bus] OFF
INSERT [dbo].[busRoute] ([busRouteCode], [routeName]) VALUES (N'1', N'Stanley Park')
INSERT [dbo].[busRoute] ([busRouteCode], [routeName]) VALUES (N'14', N'Bathurst')
INSERT [dbo].[busRoute] ([busRouteCode], [routeName]) VALUES (N'18', N'Guelph Street')
INSERT [dbo].[busRoute] ([busRouteCode], [routeName]) VALUES (N'19', N'Victoria South')
INSERT [dbo].[busRoute] ([busRouteCode], [routeName]) VALUES (N'2', N'Charels St. Terminal to Highland Hills Mall')
INSERT [dbo].[busRoute] ([busRouteCode], [routeName]) VALUES (N'3', N'Ottawa South')
INSERT [dbo].[busRoute] ([busRouteCode], [routeName]) VALUES (N'51', N'Hespeler Road')
INSERT [dbo].[busRoute] ([busRouteCode], [routeName]) VALUES (N'56', N'Dunbar')
INSERT [dbo].[busRoute] ([busRouteCode], [routeName]) VALUES (N'58', N'Elmwood')
INSERT [dbo].[busRoute] ([busRouteCode], [routeName]) VALUES (N'6', N'Bridge')
INSERT [dbo].[busRoute] ([busRouteCode], [routeName]) VALUES (N'60', N'Northview Acres')
INSERT [dbo].[busRoute] ([busRouteCode], [routeName]) VALUES (N'66', N'Winston')
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1000, N'Frederick/King', 1351, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1012, N'River/Manchester', 1601, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1013, N'River/Halliwell', 1493, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1014, N'River/Hickson', 1286, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1015, N'River/Walkway To Secord', 2170, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1016, N'River/Ottawa', 1191, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1030, N'Ottawa/Oldfield', 1474, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1071, N'River/Ottawa', 1191, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1072, N'River/Walkway To Secord', 2170, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1073, N'River/Halliwell', 1493, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1074, N'River/Manchester', 1601, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1126, N'Conestoga Mall', 1353, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1204, N'Davenport/Northfield', 2033, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1206, N'Davenport/Northfield', 2033, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1208, N'Frobisher/Davenport', 1990, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1209, N'151 Frobisher Dr.', 1375, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1210, N'Frobisher/McMurray', 1859, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1215, N'McMurray/Northland', 1865, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1216, N'Bathurst/McMurray', 1772, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1217, N'Bathurst/Rankin', 1568, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1218, N'Rupert/Bathurst', 1598, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1219, N'Rupert/Northland', 1691, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1220, N'Northland/Frobisher', 1981, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1221, N'Wyman/Colby Dr.', 1400, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1222, N'Colby Dr./Colby Crt.', 1756, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1223, N'621 Colby Dr.', 950, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1224, N'612 Colby Dr.', 950, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1225, N'601 Colby Dr.', 948, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1226, N'Colby Dr./Colby Dr.', 1641, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1235, N'Queen/Rooshill', 1401, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1253, N'Queen/Shepherd', 1376, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1254, N'Queen/Shepherd', 1376, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1255, N'Winston/Queen', 1311, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1256, N'Winston/Edward', 1400, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1265, N'Winston/Cooper', 1417, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1266, N'Winston/Darren', 1405, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1267, N'Winston/Karl', 1195, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1268, N'Winston/Gunn', 1209, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1269, N'Winston/Westbury', 1670, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1270, N'Winston/Scottsdale', 1847, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1271, N'Winston/Hipel', 1299, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1272, N'Winston/Edward', 1400, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1273, N'Winston/Queen', 1311, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1274, N'Queen/Rooshill', 1401, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1275, N'Groh/Holiday Inn', 1486, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1276, N'Groh/Holiday Inn Dr.', 1746, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1277, N'Groh/Holiday Inn Dr.', 1746, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1289, N'Laurel/Eagle', 1202, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1290, N'Eagle/Arlington', 1531, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1384, N'Hespeler/Munch', 1378, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1388, N'Cambridge Centre', 1535, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1392, N'Dunbar/Hespeler', 1539, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1393, N'Dunbar/Briarwood', 1652, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1394, N'Dunbar/Daleview', 1532, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1395, N'Dunbar/Biscayne', 1529, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1396, N'Dunbar/Eastdowns', 1667, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1397, N'Dunbar/Pine', 1111, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1398, N'Dunbar/St. George', 1593, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1399, N'Dunbar/Grand Valley', 1860, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1400, N'Concession/Grand Valley', 2300, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1401, N'Bishop/King', 1117, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1402, N'Bishop/Hamilton', 1552, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1403, N'Hamilton/Montrose', 1794, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1404, N'Hamilton/Union', 1460, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1405, N'Beck/Hamilton', 1312, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1406, N'Homuth/Bernhardt', 1662, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1407, N'Homuth/Frederick', 1651, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1408, N'Rose/Lowther', 1261, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1409, N'Rose/Westminster', 1709, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1410, N'Rose/Argyle', 1132, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1411, N'Argyle/Rose', 1132, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1412, N'Argyle/Hamilton', 1551, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1413, N'Hamilton/Westminster', 2128, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1414, N'Westminster/King', 1693, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1415, N'Westminster/Duke', 1693, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1416, N'Westminster/Lawrence', 2117, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1417, N'Eagle/Speedville', 1626, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1418, N'Concession/Garden', 1748, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1419, N'Concession/Dolph', 1658, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1420, N'Langs / Concession', 1656, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1421, N'Langs / Walter', 1235, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1422, N'Langs / Valentine', 1546, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1423, N'Langs / Trico', 1125, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1424, N'Langs / Industrial', 1667, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1425, N'Langs / Hespeler', 1436, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1426, N'Hespeler/Langs', 1372, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1427, N'480 Hespeler Road', 1434, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1428, N'Hespeler/Bishop', 1484, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1445, N'Bishop/Pineview', 1563, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1456, N'Smart!Centres Cambridge', 2202, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1457, N'Smart!Centres South', 1839, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1458, N'Hespeler/Eagle', 1349, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1459, N'588 Hespeler Road', 1443, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1460, N'Hespeler/Wauchope', 1699, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1461, N'Hespeler/Wilmot', 1507, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1462, N'Hespeler/Jaffray', 1578, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1463, N'Water/Augusta', 1292, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1464, N'Galt Collegiate', 1441, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1465, N'Ainslie/Simcoe', 1364, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1466, N'Ainslie/Park Hill', 1579, 1)
GO
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1467, N'Ainslie/Dickson', 1471, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1469, N'Ainslie/Colborne', 1576, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1471, N'Ainslie/Market', 1368, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1472, N'Water/Samuelson', 1513, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1473, N'Galt Collegiate', 1441, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1474, N'Water/Todd', 957, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1475, N'Hespeler/Avenue', 1483, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1476, N'167 Hespeler Rd.', 1274, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1477, N'Hespeler/Bishop', 1484, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1478, N'499 Hespeler Rd.', 1282, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1479, N'Hespeler/Langs', 1372, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1480, N'561 Hespeler Rd.', 1272, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1481, N'Hespeler/Eagle', 1349, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1482, N'Smart!Centres South', 1839, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1483, N'Smart!Centres Cambridge', 2202, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1518, N'Ainslie St. Terminal', 1846, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1553, N'Fairview Park Terminal', 2119, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1559, N'kingsway/wilson', 1592, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1605, N'Wellington/Main', 1559, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1606, N'Beverly/Kerr', 1244, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1607, N'Beverly/Mill', 1238, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1667, N'Stanley Park Mall', 1588, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1670, N'Ottawa/Montcalm', 1498, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1671, N'Ottawa/Mcgee', 1152, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1697, N'wilson/fairway', 1470, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1698, N'wilson/webster', 1479, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1699, N'wilson/kuntz electroplating', 2820, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1700, N'wilson/wabanaki', 1545, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1701, N'wabanaki/kevco', 1413, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1702, N'wabanaki/manitou', 1642, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1703, N'manitou/sasaga', 1436, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1704, N'421 manitou dr', 1194, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1705, N'manitou/cayuga', 1446, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1706, N'doon village/millwood', 2122, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1707, N'doon village/wlkwy wheatfield', 2910, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1708, N'doon village/bechtel', 1978, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1709, N'bechtel/pathfinder', 1835, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1710, N'bechtel/anvil', 1312, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1711, N'bechtel/wheatfeild', 1827, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1712, N'pioneer/black walnut', 2009, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1713, N'pioneer/vintage', 1551, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1714, N'pioneer/doon village', 2005, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1715, N'pioneer/upper canada', 1989, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1717, N'pioneer/old carriage', 1982, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1718, N'pioneer/homer watson', 2040, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1719, N'green valley/pioneer', 2015, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1720, N'green valley/arrowhead', 2218, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1721, N'green valley/mill park', 2153, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1722, N'old mill/roos', 1279, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1723, N'pinnacle/old mill', 1670, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1724, N'pinnacle/amherst', 1645, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1725, N'pinnacle/doon valley', 2006, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1727, N'doon valley/conestoga', 2127, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1729, N'conestoga college residence', 2704, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1731, N'college rec centre', 1750, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1732, N'conestoga college door 3', 2292, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1733, N'conestoga college daycare', 2487, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1734, N'doon valley/orchard mill', 2365, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1735, N'doon valley/pinnacle', 2006, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1736, N'pinnacle/doon valley', 2006, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1737, N'pinnacle/amherst', 1645, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1738, N'pinnacle/old mill', 1670, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1739, N'old mill/roos', 1279, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1740, N'green valley/mill park', 2153, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1741, N'green valley/arrowhead', 2218, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1742, N'green valley/pioneer', 2015, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1743, N'pioneer/homer watson', 2040, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1744, N'pioneer/old carriage', 1982, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1745, N'pioneer/bechtel', 1528, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1746, N'pioneer/bechtel', 1528, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1747, N'pioneer/upper canada', 1989, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1748, N'pioneer/doon village', 2005, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1749, N'pioneer/perin', 1343, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1750, N'pioneer/black walnut', 2009, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1751, N'bechtel/sabrina', 1510, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1752, N'bechtel/anvil', 1312, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1753, N'doon village/bechtel', 1978, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1754, N'doon village/wlkwy wheatfield', 2910, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1755, N'doon village/farrier', 1998, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1756, N'manitou/cayuga', 1446, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1757, N'334 manitou dr', 1197, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1758, N'manitou/wabanaki', 1642, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1759, N'wabanaki/kevco', 1413, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1760, N'wabanaki/wilson', 1545, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1761, N'wilson/wabanaki', 1545, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1762, N'wilson/kuntz electroplating', 2820, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1763, N'wilson/goodrich', 1562, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1764, N'wilson/fairway', 1470, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1768, N'Forest Glen Plaza', 1585, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1889, N'King/Queen', 950, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1890, N'King/Ontario', 1172, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1891, N'King/College', 1139, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1892, N'King/Francis', 1150, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1893, N'King/Victoria', 1273, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1894, N'King/Breithaupt', 1488, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1895, N'King/Wellington', 1499, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1920, N'Northfield/Wissler', 1831, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1922, N'Bridge/Labrador', 1443, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1925, N'Bridge/Eastbridge', 1654, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1941, N'Bridge/Bridle', 1230, 1)
GO
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1942, N'Bridge/Woolwich', 1480, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1943, N'Lancaster/Jones', 1483, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1944, N'Lancaster/General', 1674, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (1945, N'Lancaster/Lang', 1358, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2020, N'Lancaster/Lang', 1358, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2021, N'Lancaster/General', 1674, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2022, N'Bridge/Woolwich', 1480, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2023, N'Bridge/Bridle', 1230, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2044, N'Bridge/Labrador', 1443, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2060, N'Wyman/Colby Dr.', 1400, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2061, N'Rupert/Northland', 1691, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2062, N'Bathurst/Rupert', 1598, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2063, N'Bathurst/Rankin', 1567, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2064, N'McMurray/Bathurst', 1772, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2065, N'McMurray/Northfield', 1966, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2066, N'McMurray/Frobisher', 1859, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2067, N'Frobisher/Davenport', 2022, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2088, N'Northfield/Wissler', 1831, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2097, N'Beverly/Dundas', 1447, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2098, N'Beverly/Samuelson', 1791, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2099, N'Samuelson/Beverly', 1791, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2100, N'Moscrip/Elmwood', 1571, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2101, N'Elmwood/Brock', 1335, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2102, N'Elmwood/Jarvis', 1461, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2103, N'Elmwood/Brooklyne', 1787, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2104, N'Avenue/Gail', 1104, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2108, N'Elgin/Avenue', 1218, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2109, N'Elgin/Winter', 1239, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2110, N'Elgin/Galt', 998, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2111, N'Elgin/Bronson', 1343, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2112, N'Clyde/Mill', 1006, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2113, N'Franklin/Clyde', 1429, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2114, N'470 Frankin Blvd. ', 1402, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2115, N'Franklin/Savage', 1531, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2116, N'Hilltop / Franklin', 1664, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2117, N'Hilltop / Alison', 1457, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2118, N'Lauris/Linnwood', 1577, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2119, N'Dundas/Dundas', 1325, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2120, N'Chalmers/Dundas', 1533, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2121, N'Chalmers / McNaughton', 1938, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2122, N'McNaughton/Lincoln', 1842, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2123, N'McNaughton/Oak', 1406, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2124, N'McNaughton/Shade', 1608, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2125, N'Main / Harris', 1117, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2319, N'Weber/Queen', 1058, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2359, N'Weber/Scottt', 1189, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2361, N'Krug/Samuel', 1071, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2362, N'Krug/Lydia', 955, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2363, N'Krug/East', 853, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2364, N'Krug/Melrose', 1183, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2365, N'Krug/Dumfries', 1287, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2366, N'Krug/Becker', 1044, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2367, N'Becker/Belleview', 1562, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2368, N'Smithson/Belleview', 1827, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2369, N'Krug/Cambridge', 1350, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2370, N'Krug/Eton', 862, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2371, N'Krug/Sherwood', 1299, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2372, N'Krug/River', 976, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2382, N'Holborn/River', 1291, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2383, N'Holborn/Old Chicopee', 1890, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2384, N'Old Chicopee/Ottawa', 1790, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2385, N'Lackner/Ottawa', 1375, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2386, N'Lackner/Banbury', 1474, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2387, N'Lorraine/Wimbleton', 1820, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2388, N'Lorraine/Herritage', 1798, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2389, N'Confederation/Lorraine', 2220, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2390, N'Confenration/Tupper', 1941, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2391, N'Confederation/Amber', 1879, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2392, N'Confederation/Carson', 2006, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2393, N'Carson/Lorraine', 1489, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2394, N'Lorraine/Birkshire', 1806, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2395, N'Krug/River', 976, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2396, N'Krug/Sherwood', 1299, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2400, N'Krug/Becker', 1044, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2401, N'Krug/Dumfries', 1287, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2402, N'Krug/Melrose', 1183, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2403, N'Krug/East', 853, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2404, N'Krug/Lydia', 955, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2405, N'Krug/Samuel', 1071, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2406, N'Krig/Rose', 853, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2407, N'Krug/Lancaster', 1381, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2408, N'Weber/Scott', 1073, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2409, N'Wellington/Moore', 1620, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2410, N'Wellington/Waterloo', 1951, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2411, N'Wellington/Duke', 1499, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2412, N'Wellington/Weber', 1607, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2413, N'Wellington/Ahrens', 1715, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2414, N'Wellington/Margaret', 1925, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2415, N'Wellington/St. Leger', 1878, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2416, N'Wellington/Major', 1611, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2417, N'Lancaster/Louisa', 1593, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2418, N'Lancaster/Hill', 1365, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2419, N'Lancaster/Guelph', 1585, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2420, N'Lancaster/Arnold', 1580, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2421, N'Lancaster/Ash', 1256, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2423, N'Lancaster/Hamel', 1459, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2424, N'Lancaster/Bridge', 1561, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2440, N'Lancaster/Hamel', 1459, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2441, N'Lancaster/Union', 1493, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2442, N'Lancaster/Ash', 1256, 1)
GO
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2443, N'Lancaster/Arnold', 1580, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2444, N'Lancaster/Guelph', 1585, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2445, N'Lancaster/Hill', 1365, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2446, N'Lancaster/Louisa', 1593, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2447, N'Wellington/Major', 1611, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2448, N'Wellington/St. Leger', 1878, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2449, N'Wellington/Margaret', 1925, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2450, N'Wellington/Ahrens', 1715, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2451, N'Wellington/Duke', 1499, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2452, N'Wellington/Waterloo', 1951, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2453, N'Wellington/Moore', 1620, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2454, N'Wellington/King', 1499, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2455, N'King/Breithaupt', 1488, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2456, N'King/Victoria', 1273, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2457, N'King/Water', 955, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2458, N'King/Gaukel', 1041, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2459, N'Weber/Young', 1078, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2461, N'Weber/Water', 1063, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2462, N'Weber/Wellington', 1607, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2463, N'Weber/Wilhelm', 1270, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2464, N'Weber/Blucher', 1257, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2465, N'Weber/Raitar', 1159, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2466, N'Weber/Roger', 1059, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2467, N'Union/Weber', 1069, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2468, N'Union/Ellis', 1073, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2469, N'Union/Margaret', 1387, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2471, N'Margaret/Fairfield', 1768, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2472, N'Margaret/Guelph', 1479, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2473, N'Guelph/Floyd', 1170, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2474, N'St. Leger/Guelph', 1432, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2475, N'St. Leger/Fairfield', 1721, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2476, N'St. Leger/Prueter', 1562, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2477, N'St. Leger/Union', 1340, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2478, N'Union/Boehmer', 1274, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2479, N'Union/Oxford', 1194, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2480, N'Union/Bond', 955, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2481, N'Union/Lancaster', 1493, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2482, N'Maple/Union', 1063, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2483, N'Maple/Arnold', 1150, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2484, N'Maple/Guelph', 1155, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2485, N'Guelph/Clifton', 1379, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2486, N'Guelph/Englewood', 1592, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2487, N'Guelph/Edwin', 1163, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2488, N'Guelph/St. Leger', 1432, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2489, N'Guelph/Crestwood', 1614, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2490, N'Guelph/Margaret', 1479, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2491, N'Margaret/Breithaupt Centre', 2555, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2492, N'Union/Margaret', 1387, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2493, N'Union/Ellis', 1073, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2494, N'Weber/Roger', 1059, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2495, N'Weber/Raitar', 1159, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2496, N'Weber/Guelph', 1161, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2497, N'Weber/Blucher', 1257, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2498, N'Weber/Wilhelm', 1270, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2499, N'Weber/Wellington', 1607, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2500, N'Weber/Victoria', 1381, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2501, N'Weber/Water', 1063, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2502, N'Weber/Ontario', 1280, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2503, N'Weber/Queen', 1058, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2555, N'Charles St. Terminal', 1843, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2559, N'Charles St. Terminal', 1843, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2705, N'Queen/Schneider', 1474, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2706, N'Queen/Courtland', 1497, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2707, N'Queen/Courtland', 1497, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2713, N'Benton/Church', 1266, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2714, N'Benton/Courtland', 1601, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2715, N'Courtland/Peter', 1499, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2716, N'Courtland/Madison', 1702, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2751, N'Courtland/Madison', 1702, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2752, N'Courtland/Peter', 1499, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2753, N'Courtland/Benton', 1601, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2842, N'Weber/Frederick', 1459, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2863, N'GRT Strasburg Transit Garage', 2614, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2864, N'Chandler/Bonfield', 1651, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2865, N'Elmsdale/Chendler', 1659, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2866, N'Elmsdale/Ottawa', 1478, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2867, N'Ottawa/Howland', 1388, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2868, N'Ottawa/Walkway/Chandler', 2255, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2869, N'Ottawa/Westmount', 1653, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2870, N'Ottawa/Howe', 1074, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2871, N'Williamsburg/Ottawa', 1937, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2872, N'Williamsburg/Pinedale', 2115, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2873, N'Williamsburg/Dinison', 2037, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2874, N'Williamsburg/Dinison', 2037, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2875, N'Dunsmere/Bosworth', 1738, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2876, N'Dunsmere/Radcliffe', 1779, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2877, N'Dunsmere/Colebrook', 1810, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2878, N'Dunsmere/Laurentian', 1925, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2879, N'Laurentian/Briar Knoll', 2130, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2880, N'Laurentian/Block Line', 2005, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2882, N'Block Line/McLennan Park', 2172, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2883, N'Block Line/Rittenhouse', 2140, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2884, N'Strasburg/Block Line', 1919, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2885, N'Block Line/Strasburg', 1919, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2887, N'Block Line/McLennan Park', 2172, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2888, N'Block Line/Laurential', 2003, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2889, N'Laurentian/Briar Knoll', 2130, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2890, N'Dunsmere/Laurentian', 1925, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2891, N'Dunsmere/Colebrook', 1810, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2892, N'Dunsmere/Radcliffe', 1778, 1)
GO
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2893, N'Dunsmere/Westmount', 1864, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2895, N'Williamsburg/Littlefield', 2451, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2896, N'Williamsburg/Pinedale', 2115, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2897, N'williamsburg/Nine Pines', 2282, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2898, N'Ottawa/Pinedale', 1473, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2899, N'Ottawa/Westmount', 1653, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2900, N'Ottawa/Path to Chandler', 2160, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2901, N'Ottawa/Howland', 1388, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2902, N'Elmsdale/Ottawa', 1478, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2903, N'Elmsdale/Chendler', 1659, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2904, N'Chandler/Bonfield', 1651, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2905, N'GRT Strasburg Transit Garage', 2614, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2906, N'Ottawa/Strasburg', 1628, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2907, N'Ottawa/Alpine', 1272, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2908, N'Ottawa/Imperial', 1490, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2909, N'479 Ottawa St.', 1097, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2910, N'Ottawa/Hoffman', 1374, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2911, N'Mill/Ottawa', 1069, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2912, N'Mill/Borden', 1047, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2913, N'Mill/Heiman', 1039, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2914, N'Mill/Stirling', 1289, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2929, N'Stirling/Mill', 1289, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2930, N'Mill/Heiman', 1039, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2931, N'Mill/Borden', 1047, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2932, N'399 Mill St.', 872, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2933, N'Mill/Ottawa', 1069, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2934, N'Ottawa/Hoffman', 1374, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2935, N'Ottawa/Kehl', 1059, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2936, N'Ottawa/Homer Watson', 1846, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2937, N'Ottawa/Alpine', 1272, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (2975, N'Highland Hill Mall', 1646, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3068, N'Queen/St. George', 1435, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3069, N'Queen/Schneider', 1474, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3070, N'Mill/Iron Horse Trail', 1938, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3071, N'Mill/Lansdowne', 1384, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3072, N'Spadina/Wentworth', 1729, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3073, N'Spadina/Highland', 1550, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3074, N'Stirling/Highland', 1690, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3075, N'Stirling/Lorne', 1403, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3076, N'Stirling/Mausser', 1627, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3077, N'Stirling/Lakeside Park', 2123, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3102, N'Stirling/Mausser', 1627, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3103, N'Stirling/Lorne', 1403, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3105, N'Highland/Spadina', 1550, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3106, N'Spadina/Mill', 1149, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3107, N'Mill/Lansdowne', 1384, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3108, N'Mill/Queen', 955, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3109, N'Victoria/Halls', 1380, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3110, N'Victoria/Joseph', 1497, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3111, N'Victoria/Bramm', 1375, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3112, N'Victoria/Henry', 1398, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3113, N'Victoria/Patricia', 1693, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3114, N'Victoria/Belmount', 1718, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3115, N'Victoria/Alice', 1358, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3116, N'Victoria/Paulander', 1804, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3117, N'Victoria/Westmount', 1862, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3118, N'Chopin/Westmount', 1638, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3119, N'Chopin/Hazelglen', 1578, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3126, N'Hazelglen/Victoria', 1802, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3128, N'Victoria/Fenwick', 1591, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3129, N'Victoria/Fischer-Hallman', 2398, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3130, N'Victoria/Stoke', 1462, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3131, N'Victoria/Path To Wexford', 2271, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3132, N'Victoria/Westforest', 2022, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3133, N'Westforest/Hidden Creek', 2235, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3134, N'Westforest/Westmeadow', 2181, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3135, N'Bankside/Westforest', 1926, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3136, N'Walkway To Highland', 1794, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3137, N'Bankside/Bankside Pk', 1868, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3138, N'Bankside/Bankside Cres', 2078, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3139, N'Bankside/Eastforest', 1904, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3142, N'Victoria/Fischer-Hallman', 2235, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3202, N'Bankside/Golden Terrance', 2301, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3204, N'Walkway To Hidden Creek', 2105, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3205, N'Bankside/Westforest', 1926, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3206, N'Westforest/Westmeadow', 2181, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3207, N'Westforest/Victoria', 1958, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3208, N'Victoria/Eastforest', 1936, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3209, N'Victoria/Path To Wexford', 2271, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3210, N'Victoria/Oprington', 1840, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3212, N'Victoria/Monte Carlo', 1924, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3214, N'Hazelglen/Mooregate', 1900, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3215, N'Hazelglen/Chopin', 1578, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3216, N'Chopin/Westmount', 1638, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3217, N'Westmount/Karn', 1425, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3218, N'Victoria/Westmount', 1862, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3219, N'Victoria/Paulander', 1804, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3220, N'Victoria/Lawrence', 1697, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3221, N'Victoria/Patricia', 1693, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3222, N'Victoris/West', 1317, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3224, N'Victoria/Park', 1278, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3225, N'Victoria/Michael', 1571, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3226, N'Victoria/King', 1273, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3227, N'Victoria/Joseph', 1497, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3229, N'Ottawa/Strasburg', 1628, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3393, N'Davenport/Old Abbey', 1796, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3411, N'Cooper/Jamieson', 1485, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3510, N'Winston/Heather', 1506, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3522, N'Laurel / North', 1247, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3526, N'Westminster / Laurel', 1913, 0)
GO
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3527, N'Hespeler/Abbotsford', 1901, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3537, N'Hespeler/Can-Amera', 1676, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3538, N'Hespeler/Can-Amera', 1676, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3539, N'Hespeler/Isherwood', 1819, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3564, N'Victoria/Belmount', 1718, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3565, N'Victoria/West', 1299, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3566, N'280 Victoria St. S.', 1457, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3574, N'River/Gibson', 1177, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3575, N'Frederick/Weber', 1459, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3578, N'Krug/Cedar', 935, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3580, N'Weber/Via Rail Station', 2030, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3592, N'Northland/Frobisher', 1981, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3618, N'Courtland/Stirling', 1895, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3639, N'Highland/Highland Hills Mall', 2607, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3657, N'Lancaster/Hwy. 85 Ramp', 1903, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3673, N'Bridge/Crimson', 1367, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3679, N'Bridge/Dansbury', 1476, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3680, N'Bridge/Crimson', 1367, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3744, N'Wellington/Weber', 1607, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3783, N'Bridge/Whitmore', 1483, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3784, N'Bridge/Lexington', 1588, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3789, N'Bridge/Lexington', 1588, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3790, N'Bridge/Whitmore', 1483, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3860, N'Avenue/Elgin', 1218, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3871, N'Broklyne/Glen', 1339, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3921, N'Winston/Franklin', 1622, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3922, N'Winston/Gunn', 1209, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3923, N'Winston/Fieldstone', 1838, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3924, N'Winston/Handorf', 1507, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3925, N'Winston/Cooper', 1417, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3926, N'Cooper/Adler', 1151, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3927, N'Ellis/Cooper', 1168, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3928, N'Ellis/McLaughlin', 1548, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3929, N'Ellis/Adler', 1040, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3930, N'Jamieson/Townline', 1717, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3931, N'Jamieson/Lardner', 1581, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (3932, N'Jamieson/Patton', 1499, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (4028, N'Bridge/Path To Brigantine', 2319, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (4029, N'Bridge/Path To Wissler', 2037, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (4030, N'Bridge/Bechtel Park', 1761, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (4031, N'Bridge/Path To Auburn', 1913, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (4032, N'Bridge/University', 1726, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (4033, N'Bridge/University', 1726, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (4034, N'Bridge/Dansbury', 1476, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (4035, N'Bridge/Eastbridge', 1654, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (4037, N'Bridge/Chesapeake', 1638, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (4038, N'Bridge/Chesapeake', 1638, 1)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (4050, N'Bridge/Northfield', 1675, 0)
INSERT [dbo].[busStop] ([busStopNumber], [location], [locationHash], [goingDowntown]) VALUES (4051, N'Bridge/Northfield', 1675, 1)
INSERT [dbo].[country] ([countryCode], [name], [postalPattern], [phonePattern]) VALUES (N'CA', N'Canada', N'[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJKLMNPRSTVWXYZ] ?\d[ABCEGHJKLMNPRSTVWXYZ]\d', N'((\d{3}-)|(\(\d{3}\) ))\d{3}-\d{4}')
INSERT [dbo].[country] ([countryCode], [name], [postalPattern], [phonePattern]) VALUES (N'FR', N'France', N'\d{5}', N'(0 ?\d{3} (\d{2} \d{4}|\d{3} \d{3})')
INSERT [dbo].[country] ([countryCode], [name], [postalPattern], [phonePattern]) VALUES (N'JA', N'Japan', N'\d{3}(-(\d{4}|\d{2}))?', N'(0\d{1,4}-|\(0\d{1,4}\) ?)\d{1,4}-\d{4}')
INSERT [dbo].[country] ([countryCode], [name], [postalPattern], [phonePattern]) VALUES (N'US', N'United States of America', N'\d{5}(-\d{4})?', N'((\d{3}-)|(\(\d{3}\) ))\d{3}-\d{4}')
SET IDENTITY_INSERT [dbo].[driver] ON 

INSERT [dbo].[driver] ([driverId], [firstName], [lastName], [fullName], [homePhone], [workPhone], [street], [city], [postalCode], [provinceCode], [dateHired]) VALUES (1, N'Gordon', N'Ramsey', N'Ramsey, Gordon', N'519-777-1212', N'519-748-5220', N'299 Doon Vallye Drive', N'Kitchener', N'K8V 4C4', N'ON', CAST(N'1990-06-23' AS Date))
INSERT [dbo].[driver] ([driverId], [firstName], [lastName], [fullName], [homePhone], [workPhone], [street], [city], [postalCode], [provinceCode], [dateHired]) VALUES (2, N'Shania', N'Twain', N'Twain, Shania', N'519-777-2222', N'519-748-5221', N'299 Doon Vallye Drive', N'Kitchener', N'K8V 4C4', N'ON', CAST(N'1990-06-23' AS Date))
INSERT [dbo].[driver] ([driverId], [firstName], [lastName], [fullName], [homePhone], [workPhone], [street], [city], [postalCode], [provinceCode], [dateHired]) VALUES (3, N'Adel', N'Adkins', N'Adkins, Adel', N'519-777-8888', N'519-748-5222', N'299 Doon Vallye Drive', N'Kitchener', N'K8V 4C4', N'ON', CAST(N'1990-06-23' AS Date))
INSERT [dbo].[driver] ([driverId], [firstName], [lastName], [fullName], [homePhone], [workPhone], [street], [city], [postalCode], [provinceCode], [dateHired]) VALUES (4, N'Moriah', N'Carey', N'Carey, Moria', N'519-777-6565', N'519-748-5223', N'299 Doon Vallye Drive', N'Kitchener', N'K8V 4C4', N'ON', CAST(N'1990-06-23' AS Date))
INSERT [dbo].[driver] ([driverId], [firstName], [lastName], [fullName], [homePhone], [workPhone], [street], [city], [postalCode], [provinceCode], [dateHired]) VALUES (5, N'Russell', N'Crowe', N'Crowe, Russell', N'519-777-2222', N'519-748-5224', N'299 Doon Vallye Drive', N'Kitchener', N'K8V 4C4', N'ON', CAST(N'1990-06-23' AS Date))
INSERT [dbo].[driver] ([driverId], [firstName], [lastName], [fullName], [homePhone], [workPhone], [street], [city], [postalCode], [provinceCode], [dateHired]) VALUES (6, N'Johnny', N'Depp', N'Depp, Johnny', N'519-777-5555', N'519-748-5225', N'299 Doon Vallye Drive', N'Kitchener', N'K8V 4C4', N'ON', CAST(N'1990-06-23' AS Date))
INSERT [dbo].[driver] ([driverId], [firstName], [lastName], [fullName], [homePhone], [workPhone], [street], [city], [postalCode], [provinceCode], [dateHired]) VALUES (7, N'Bill', N'Nightly', N'Nighy, Bill', N'519-777-7777', N'519-748-5226', N'299 Doon Valley Drive', N'Kitchener', N'K8V 4C4', N'ON', CAST(N'1990-06-23' AS Date))
INSERT [dbo].[driver] ([driverId], [firstName], [lastName], [fullName], [homePhone], [workPhone], [street], [city], [postalCode], [provinceCode], [dateHired]) VALUES (8, N'Alan', N'Rickman', N'Rickman, Alan', N'519-777-3933', N'519-748-5227', N'299 Doon Valley Drive', N'Kitchener', N'K8V 4C4', N'ON', CAST(N'1990-06-23' AS Date))
INSERT [dbo].[driver] ([driverId], [firstName], [lastName], [fullName], [homePhone], [workPhone], [street], [city], [postalCode], [provinceCode], [dateHired]) VALUES (9, N'Sandra', N'Bullock', N'Bullock, Sandra', N'519-777-4949', N'519-748-5228', N'299 Doon Vallye Drive', N'Kitchener', N'K8V 4C4', N'ON', CAST(N'1990-06-23' AS Date))
INSERT [dbo].[driver] ([driverId], [firstName], [lastName], [fullName], [homePhone], [workPhone], [street], [city], [postalCode], [provinceCode], [dateHired]) VALUES (10, N'David', N'Turton', N'Turton, David', N'519-777-3030', N'510-748-5229', N'299 Doon Vallye Drive', N'Kitchener', N'K8V 4C4', N'ON', CAST(N'1990-06-23' AS Date))
SET IDENTITY_INSERT [dbo].[driver] OFF
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [taxCode], [taxRate], [capital]) VALUES (N'AB', N'Alberta', N'CA', N'GST', 0.05, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [taxCode], [taxRate], [capital]) VALUES (N'BC', N'British Columbia', N'CA', N'GST+PST', 0.12, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [taxCode], [taxRate], [capital]) VALUES (N'CA', N'California', N'US', N'retail', 0.1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [taxCode], [taxRate], [capital]) VALUES (N'MB', N'Manitoba', N'CA', N'GST+PST', 0.13, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [taxCode], [taxRate], [capital]) VALUES (N'MI', N'Michigan', N'US', N'retail', 0.06, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [taxCode], [taxRate], [capital]) VALUES (N'NB', N'New Brunswick', N'CA', N'HST', 0.13, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [taxCode], [taxRate], [capital]) VALUES (N'NL', N'Newfoundland and Labrador', N'CA', N'HST', 0.13, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [taxCode], [taxRate], [capital]) VALUES (N'NS', N'Nova Scotia', N'CA', N'HST', 0.15, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [taxCode], [taxRate], [capital]) VALUES (N'NT', N'Northwest Territories', N'CA', N'GST', 0.05, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [taxCode], [taxRate], [capital]) VALUES (N'NU', N'Nunavut', N'CA', N'GST', 0.05, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [taxCode], [taxRate], [capital]) VALUES (N'NY', N'New York', N'US', N'retail', 0.08875, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [taxCode], [taxRate], [capital]) VALUES (N'ON', N'Ontario', N'CA', N'HST', 0.13, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [taxCode], [taxRate], [capital]) VALUES (N'PE', N'Price Edward Island', N'CA', N'HST', 0.14, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [taxCode], [taxRate], [capital]) VALUES (N'QC', N'Quebec', N'CA', N'GST+QST', 0.14975, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [taxCode], [taxRate], [capital]) VALUES (N'SK', N'Saskatchewan', N'CA', N'GST+PST', 0.1, NULL)
INSERT [dbo].[province] ([provinceCode], [name], [countryCode], [taxCode], [taxRate], [capital]) VALUES (N'YT', N'Yukon Territory', N'CA', N'GST', 0.05, NULL)
SET IDENTITY_INSERT [dbo].[routeSchedule] ON 

INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (1, N'1', CAST(N'06:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (2, N'1', CAST(N'06:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (3, N'1', CAST(N'07:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (4, N'1', CAST(N'07:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (6, N'1', CAST(N'08:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (7, N'1', CAST(N'08:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (8, N'1', CAST(N'09:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (10, N'1', CAST(N'09:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (11, N'1', CAST(N'10:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (12, N'1', CAST(N'10:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (13, N'1', CAST(N'11:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (14, N'1', CAST(N'11:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (15, N'1', CAST(N'12:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (16, N'1', CAST(N'12:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (17, N'1', CAST(N'13:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (18, N'1', CAST(N'13:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (19, N'1', CAST(N'14:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (20, N'1', CAST(N'14:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (21, N'1', CAST(N'15:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (22, N'1', CAST(N'15:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (23, N'1', CAST(N'16:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (24, N'1', CAST(N'16:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (25, N'1', CAST(N'17:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (26, N'1', CAST(N'17:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (27, N'1', CAST(N'18:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (28, N'1', CAST(N'18:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (29, N'1', CAST(N'19:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (30, N'1', CAST(N'19:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (31, N'1', CAST(N'20:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (33, N'1', CAST(N'21:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (34, N'1', CAST(N'21:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (35, N'1', CAST(N'22:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (37, N'1', CAST(N'23:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (38, N'1', CAST(N'23:59:59' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (62, N'51', CAST(N'06:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (63, N'51', CAST(N'06:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (64, N'51', CAST(N'06:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (65, N'51', CAST(N'07:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (66, N'51', CAST(N'07:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (67, N'51', CAST(N'07:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (68, N'51', CAST(N'07:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (69, N'51', CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (70, N'51', CAST(N'08:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (71, N'51', CAST(N'08:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (72, N'51', CAST(N'08:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (73, N'51', CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (74, N'51', CAST(N'09:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (75, N'51', CAST(N'09:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (76, N'51', CAST(N'09:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (77, N'51', CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (78, N'51', CAST(N'10:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (79, N'51', CAST(N'10:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (80, N'51', CAST(N'10:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (81, N'51', CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (82, N'51', CAST(N'11:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (83, N'51', CAST(N'11:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (84, N'51', CAST(N'11:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (85, N'51', CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (86, N'51', CAST(N'12:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (87, N'51', CAST(N'12:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (88, N'51', CAST(N'12:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (89, N'51', CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (90, N'51', CAST(N'13:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (91, N'51', CAST(N'13:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (92, N'51', CAST(N'13:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (93, N'51', CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (94, N'51', CAST(N'14:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (95, N'51', CAST(N'14:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (96, N'51', CAST(N'14:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (97, N'51', CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (98, N'51', CAST(N'15:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (99, N'51', CAST(N'15:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (100, N'51', CAST(N'15:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (101, N'51', CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (102, N'51', CAST(N'16:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (103, N'51', CAST(N'16:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (104, N'51', CAST(N'16:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (105, N'51', CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (106, N'51', CAST(N'17:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (107, N'51', CAST(N'17:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (108, N'51', CAST(N'17:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (109, N'51', CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (110, N'51', CAST(N'18:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (111, N'51', CAST(N'18:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (112, N'51', CAST(N'19:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (113, N'51', CAST(N'19:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (114, N'51', CAST(N'20:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (115, N'51', CAST(N'20:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (116, N'51', CAST(N'21:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (117, N'51', CAST(N'21:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (118, N'51', CAST(N'22:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (119, N'51', CAST(N'22:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (120, N'51', CAST(N'23:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (121, N'51', CAST(N'23:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (122, N'51', CAST(N'06:15:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (123, N'51', CAST(N'06:30:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (124, N'51', CAST(N'07:15:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (125, N'51', CAST(N'07:45:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (126, N'51', CAST(N'08:15:00' AS Time), 0, NULL)
GO
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (127, N'51', CAST(N'08:45:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (128, N'51', CAST(N'09:15:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (129, N'51', CAST(N'09:45:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (130, N'51', CAST(N'10:15:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (131, N'51', CAST(N'10:45:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (132, N'51', CAST(N'11:15:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (133, N'51', CAST(N'11:45:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (134, N'51', CAST(N'12:15:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (135, N'51', CAST(N'12:45:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (136, N'51', CAST(N'13:15:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (137, N'51', CAST(N'13:45:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (138, N'51', CAST(N'14:15:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (139, N'51', CAST(N'14:45:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (140, N'51', CAST(N'15:15:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (141, N'51', CAST(N'15:45:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (142, N'51', CAST(N'16:15:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (143, N'51', CAST(N'16:45:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (144, N'51', CAST(N'17:15:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (145, N'51', CAST(N'17:45:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (146, N'51', CAST(N'18:15:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (147, N'51', CAST(N'18:45:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (148, N'51', CAST(N'19:15:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (149, N'51', CAST(N'19:45:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (150, N'51', CAST(N'20:15:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (151, N'51', CAST(N'20:45:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (152, N'51', CAST(N'21:15:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (153, N'51', CAST(N'21:45:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (154, N'51', CAST(N'22:15:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (155, N'51', CAST(N'22:45:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (156, N'51', CAST(N'23:15:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (157, N'51', CAST(N'23:45:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (158, N'19', CAST(N'06:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (159, N'19', CAST(N'06:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (160, N'19', CAST(N'07:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (161, N'19', CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (162, N'19', CAST(N'08:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (163, N'19', CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (164, N'19', CAST(N'02:55:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (165, N'19', CAST(N'03:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (166, N'19', CAST(N'04:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (167, N'19', CAST(N'04:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (168, N'19', CAST(N'05:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (169, N'19', CAST(N'05:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (170, N'19', CAST(N'06:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (171, N'19', CAST(N'06:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (172, N'19', CAST(N'05:30:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (173, N'19', CAST(N'06:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (174, N'66', CAST(N'05:50:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (175, N'66', CAST(N'06:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (176, N'66', CAST(N'06:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (177, N'66', CAST(N'07:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (178, N'66', CAST(N'07:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (179, N'66', CAST(N'08:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (180, N'66', CAST(N'08:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (181, N'66', CAST(N'09:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (182, N'66', CAST(N'09:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (183, N'66', CAST(N'10:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (184, N'66', CAST(N'10:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (185, N'66', CAST(N'11:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (186, N'66', CAST(N'11:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (187, N'66', CAST(N'12:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (188, N'66', CAST(N'12:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (189, N'66', CAST(N'13:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (190, N'66', CAST(N'13:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (191, N'66', CAST(N'14:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (192, N'66', CAST(N'14:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (193, N'66', CAST(N'15:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (194, N'66', CAST(N'15:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (195, N'66', CAST(N'16:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (196, N'66', CAST(N'16:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (197, N'66', CAST(N'17:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (198, N'66', CAST(N'17:45:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (199, N'66', CAST(N'18:15:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (223, N'56', CAST(N'06:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (224, N'56', CAST(N'06:30:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (225, N'56', CAST(N'07:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (226, N'56', CAST(N'07:30:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (227, N'56', CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (228, N'56', CAST(N'08:30:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (229, N'56', CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (230, N'56', CAST(N'09:30:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (231, N'56', CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (232, N'56', CAST(N'10:30:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (233, N'56', CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (234, N'56', CAST(N'11:30:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (235, N'56', CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (238, N'56', CAST(N'13:30:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (241, N'56', CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (242, N'56', CAST(N'15:30:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (243, N'56', CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (244, N'56', CAST(N'16:00:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (245, N'56', CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (246, N'56', CAST(N'17:30:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (247, N'56', CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (250, N'56', CAST(N'19:30:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (253, N'56', CAST(N'21:00:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (256, N'56', CAST(N'23:00:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (259, N'14', CAST(N'06:23:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (260, N'14', CAST(N'06:40:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (261, N'14', CAST(N'07:10:00' AS Time), 1, NULL)
GO
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (262, N'14', CAST(N'07:40:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (263, N'14', CAST(N'08:10:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (264, N'14', CAST(N'08:40:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (265, N'14', CAST(N'14:30:00' AS Time), 1, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (266, N'14', CAST(N'16:00:00' AS Time), 0, NULL)
INSERT [dbo].[routeSchedule] ([routeScheduleId], [busRouteCode], [startTime], [isWeekDay], [comments]) VALUES (267, N'14', CAST(N'06:54:00' AS Time), 0, NULL)
SET IDENTITY_INSERT [dbo].[routeSchedule] OFF
SET IDENTITY_INSERT [dbo].[routeStop] ON 

INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (91, N'51', 2555, 1)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (92, N'51', 1469, 1)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (93, N'51', 1466, 2)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (94, N'51', 1471, 2)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (95, N'51', 1472, 4)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (96, N'51', 1464, 5)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (97, N'51', 1474, 5)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (98, N'51', 1475, 7)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (99, N'51', 3527, 8)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (100, N'51', 1476, 8)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (101, N'51', 1384, 9)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (102, N'51', 3537, 10)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (103, N'51', 1388, 16)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (104, N'51', 1428, 17)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (105, N'51', 1478, 18)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (106, N'51', 1426, 19)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (107, N'51', 1480, 20)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (108, N'51', 1458, 21)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (109, N'51', 1456, 22)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (110, N'51', 2559, 26)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (111, N'3', 2713, 2)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (112, N'3', 2559, 0)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (113, N'3', 2714, 3)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (114, N'3', 2715, 3)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (115, N'3', 2716, 4)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (116, N'3', 3618, 5)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (117, N'3', 2929, 5)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (118, N'3', 2930, 6)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (119, N'3', 2931, 7)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (120, N'3', 2932, 7)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (121, N'3', 2933, 8)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (122, N'3', 2934, 8)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (123, N'3', 2935, 9)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (124, N'3', 2936, 10)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (125, N'3', 2937, 10)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (126, N'3', 3229, 11)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (127, N'3', 2863, 12)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (128, N'3', 2864, 13)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (129, N'3', 2864, 14)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (130, N'3', 2865, 14)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (131, N'3', 2866, 15)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (132, N'3', 2867, 15)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (133, N'3', 2868, 16)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (134, N'3', 2869, 17)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (135, N'3', 2870, 18)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (136, N'3', 2871, 18)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (137, N'3', 2872, 19)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (138, N'3', 2873, 19)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (139, N'3', 2874, 20)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (140, N'3', 2875, 20)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (141, N'3', 2876, 21)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (142, N'3', 2877, 22)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (143, N'3', 2878, 22)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (144, N'3', 2879, 23)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (145, N'3', 2880, 24)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (146, N'3', 2882, 24)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (147, N'3', 2883, 25)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (148, N'3', 2884, 26)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (149, N'3', 2559, 27)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (150, N'19', 2555, 0)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (151, N'19', 1892, 2)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (152, N'19', 3109, 3)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (153, N'19', 3227, 2)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (154, N'19', 3111, 3)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (155, N'19', 3112, 4)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (156, N'19', 3566, 5)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (157, N'19', 3113, 5)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (158, N'19', 3114, 7)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (159, N'19', 3115, 8)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (160, N'19', 3116, 8)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (161, N'19', 3117, 9)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (162, N'19', 3119, 12)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (163, N'19', 3118, 11)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (164, N'19', 3126, 13)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (165, N'19', 3128, 14)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (166, N'19', 3129, 14)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (167, N'19', 3130, 15)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (168, N'19', 3131, 15)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (169, N'19', 3132, 17)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (170, N'19', 3133, 18)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (171, N'19', 3134, 19)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (172, N'19', 3205, 19)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (173, N'19', 3136, 20)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (174, N'19', 3137, 20)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (175, N'19', 2559, 21)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (176, N'66', 1254, 1)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (177, N'66', 1235, 1)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (178, N'66', 1255, 3)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (179, N'66', 1256, 3)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (180, N'66', 3510, 4)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (181, N'66', 3921, 5)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (182, N'66', 3922, 6)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (183, N'66', 3923, 6)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (184, N'66', 3924, 7)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (185, N'66', 3925, 9)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (186, N'66', 3926, 10)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (187, N'66', 3927, 10)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (188, N'66', 3928, 10)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (189, N'66', 3929, 11)
GO
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (190, N'66', 3930, 14)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (191, N'66', 3931, 14)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (192, N'66', 3932, 14)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (193, N'66', 3411, 15)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (194, N'66', 1265, 16)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (195, N'66', 1266, 17)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (196, N'66', 1267, 18)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (197, N'66', 1268, 18)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (198, N'66', 1269, 18)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (199, N'66', 1270, 20)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (200, N'66', 1271, 21)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (201, N'66', 1272, 21)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (202, N'66', 1273, 22)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (203, N'66', 1274, 23)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (204, N'66', 1253, 23)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (205, N'66', 1275, 25)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (206, N'56', 1012, 15)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (207, N'56', 1518, 44)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (208, N'56', 1013, 15)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (209, N'56', 1000, 21)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (213, N'56', 1518, 0)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (214, N'56', 1393, 10)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (215, N'56', 1395, 15)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (216, N'56', 1394, 20)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (217, N'56', 1396, 25)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (218, N'56', 1397, 30)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (219, N'18', 2555, 0)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (220, N'18', 1000, 2)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (221, N'18', 2319, 3)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (222, N'18', 2459, 6)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (223, N'18', 2461, 6)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (224, N'18', 3580, 7)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (225, N'18', 2462, 8)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (226, N'18', 2463, 8)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (227, N'18', 2464, 9)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (228, N'18', 2465, 10)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (229, N'18', 2467, 11)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (230, N'18', 2466, 10)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (231, N'18', 2468, 11)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (232, N'18', 2469, 11)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (233, N'18', 2471, 13)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (234, N'18', 2472, 13)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (235, N'18', 2473, 14)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (236, N'18', 2474, 14)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (237, N'18', 2475, 14)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (238, N'18', 2559, 25)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (239, N'18', 2477, 15)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (240, N'18', 2478, 17)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (241, N'18', 2479, 17)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (242, N'18', 2480, 17)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (243, N'18', 2481, 18)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (244, N'18', 2482, 18)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (245, N'18', 2483, 19)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (246, N'18', 2484, 19)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (247, N'14', 2555, 0)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (249, N'14', 1206, 1)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (251, N'14', 1208, 2)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (252, N'14', 1209, 3)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (253, N'14', 1210, 3)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (254, N'14', 1215, 4)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (255, N'14', 1216, 5)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (256, N'14', 1217, 5)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (257, N'14', 1218, 6)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (259, N'14', 1219, 7)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (260, N'14', 1220, 8)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (261, N'14', 1221, 9)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (262, N'14', 1222, 9)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (263, N'14', 1224, 11)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (264, N'14', 1225, 11)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (265, N'14', 1223, 10)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (266, N'14', 1226, 12)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (267, N'14', 2060, 13)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (268, N'14', 3592, 14)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (269, N'14', 1219, 15)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (270, N'14', 2062, 16)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (271, N'14', 2063, 17)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (272, N'14', 2064, 18)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (273, N'14', 2065, 19)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (274, N'14', 2066, 20)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (275, N'14', 2067, 22)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (276, N'14', 1204, 23)
INSERT [dbo].[routeStop] ([routeStopId], [busRouteCode], [busStopNumber], [offsetMinutes]) VALUES (277, N'14', 2555, 25)
SET IDENTITY_INSERT [dbo].[routeStop] OFF
SET IDENTITY_INSERT [dbo].[trip] ON 

INSERT [dbo].[trip] ([tripId], [routeScheduleId], [tripDate], [driverId], [busId], [comments]) VALUES (1, 262, CAST(N'2015-01-23 00:00:00.000' AS DateTime), 1, 9, N'construction diversion')
INSERT [dbo].[trip] ([tripId], [routeScheduleId], [tripDate], [driverId], [busId], [comments]) VALUES (2, 262, CAST(N'2014-12-12 00:00:00.000' AS DateTime), 9, 3, N'stop 1151 added')
INSERT [dbo].[trip] ([tripId], [routeScheduleId], [tripDate], [driverId], [busId], [comments]) VALUES (3, 260, CAST(N'2014-12-12 00:00:00.000' AS DateTime), 9, 3, N'new stop')
INSERT [dbo].[trip] ([tripId], [routeScheduleId], [tripDate], [driverId], [busId], [comments]) VALUES (4, 265, CAST(N'2014-12-12 00:00:00.000' AS DateTime), 9, 3, N'new stop')
SET IDENTITY_INSERT [dbo].[trip] OFF
ALTER TABLE [dbo].[driver]  WITH CHECK ADD  CONSTRAINT [FK_driver_province] FOREIGN KEY([provinceCode])
REFERENCES [dbo].[province] ([provinceCode])
GO
ALTER TABLE [dbo].[driver] CHECK CONSTRAINT [FK_driver_province]
GO
ALTER TABLE [dbo].[province]  WITH CHECK ADD  CONSTRAINT [FK_province_country] FOREIGN KEY([countryCode])
REFERENCES [dbo].[country] ([countryCode])
GO
ALTER TABLE [dbo].[province] CHECK CONSTRAINT [FK_province_country]
GO
ALTER TABLE [dbo].[routeSchedule]  WITH CHECK ADD  CONSTRAINT [FK_routeSchedule_busRoute] FOREIGN KEY([busRouteCode])
REFERENCES [dbo].[busRoute] ([busRouteCode])
GO
ALTER TABLE [dbo].[routeSchedule] CHECK CONSTRAINT [FK_routeSchedule_busRoute]
GO
ALTER TABLE [dbo].[routeStop]  WITH CHECK ADD  CONSTRAINT [FK_routeStop_busRoute] FOREIGN KEY([busRouteCode])
REFERENCES [dbo].[busRoute] ([busRouteCode])
GO
ALTER TABLE [dbo].[routeStop] CHECK CONSTRAINT [FK_routeStop_busRoute]
GO
ALTER TABLE [dbo].[routeStop]  WITH CHECK ADD  CONSTRAINT [FK_routeStop_busStop] FOREIGN KEY([busStopNumber])
REFERENCES [dbo].[busStop] ([busStopNumber])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[routeStop] CHECK CONSTRAINT [FK_routeStop_busStop]
GO
ALTER TABLE [dbo].[trip]  WITH CHECK ADD  CONSTRAINT [FK_trip_bus] FOREIGN KEY([busId])
REFERENCES [dbo].[bus] ([busId])
GO
ALTER TABLE [dbo].[trip] CHECK CONSTRAINT [FK_trip_bus]
GO
ALTER TABLE [dbo].[trip]  WITH CHECK ADD  CONSTRAINT [FK_trip_driver] FOREIGN KEY([driverId])
REFERENCES [dbo].[driver] ([driverId])
GO
ALTER TABLE [dbo].[trip] CHECK CONSTRAINT [FK_trip_driver]
GO
ALTER TABLE [dbo].[trip]  WITH CHECK ADD  CONSTRAINT [FK_trip_routeSchedule] FOREIGN KEY([routeScheduleId])
REFERENCES [dbo].[routeSchedule] ([routeScheduleId])
GO
ALTER TABLE [dbo].[trip] CHECK CONSTRAINT [FK_trip_routeSchedule]
GO
ALTER TABLE [dbo].[tripStop]  WITH CHECK ADD  CONSTRAINT [FK_tripStop_busStop] FOREIGN KEY([busStopNumber])
REFERENCES [dbo].[busStop] ([busStopNumber])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tripStop] CHECK CONSTRAINT [FK_tripStop_busStop]
GO
ALTER TABLE [dbo].[tripStop]  WITH CHECK ADD  CONSTRAINT [FK_tripStop_trip] FOREIGN KEY([tripId])
REFERENCES [dbo].[trip] ([tripId])
GO
ALTER TABLE [dbo].[tripStop] CHECK CONSTRAINT [FK_tripStop_trip]
GO
USE [master]
GO
ALTER DATABASE [BusService] SET  READ_WRITE 
GO
