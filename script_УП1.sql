USE [RepairRequests]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 06.11.2024 17:24:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[client_id] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
	[contact_info] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 06.11.2024 17:24:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[comment_id] [int] NOT NULL,
	[request_id] [int] NOT NULL,
	[performer_id] [int] NOT NULL,
	[comment_date] [datetime] NOT NULL,
	[text] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 06.11.2024 17:24:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[equipment_id] [int] NOT NULL,
	[serial_number] [varchar](50) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[model] [varchar](100) NULL,
	[location] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[equipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaultType]    Script Date: 06.11.2024 17:24:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaultType](
	[fault_type_id] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[fault_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Performer]    Script Date: 06.11.2024 17:24:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Performer](
	[performer_id] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
	[specialization] [varchar](100) NULL,
	[contact_info] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[performer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepairRequest]    Script Date: 06.11.2024 17:24:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairRequest](
	[request_id] [int] NOT NULL,
	[request_date] [datetime] NOT NULL,
	[equipment_id] [int] NOT NULL,
	[fault_type_id] [int] NOT NULL,
	[description] [text] NULL,
	[client_id] [int] NOT NULL,
	[status] [varchar](100) NOT NULL,
	[assigned_to] [int] NULL,
	[completion_date] [datetime] NULL,
	[report] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[request_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Client] ([client_id], [name], [contact_info]) VALUES (1, N'ООО "Рога и копыта"', N'info@rogaikopyta.ru')
INSERT [dbo].[Client] ([client_id], [name], [contact_info]) VALUES (2, N'ИП Иванов Иван Иванович', N'+79991234567')
INSERT [dbo].[Client] ([client_id], [name], [contact_info]) VALUES (3, N'ОАО "Мегаполис"', N'support@megapolis.ru')
GO
INSERT [dbo].[Comment] ([comment_id], [request_id], [performer_id], [comment_date], [text]) VALUES (1, 1, 1, CAST(N'2023-01-10T11:00:00.000' AS DateTime), N'Проверяю подключение к сети')
INSERT [dbo].[Comment] ([comment_id], [request_id], [performer_id], [comment_date], [text]) VALUES (2, 2, 2, CAST(N'2023-02-10T12:00:00.000' AS DateTime), N'Замена лампы сканера')
INSERT [dbo].[Comment] ([comment_id], [request_id], [performer_id], [comment_date], [text]) VALUES (3, 3, 3, CAST(N'2023-03-10T13:00:00.000' AS DateTime), N'Проверяю настройки Wi-Fi')
GO
INSERT [dbo].[Equipment] ([equipment_id], [serial_number], [name], [model], [location]) VALUES (1, N'SN123456', N'Принтер', N'HP LaserJet Pro', N'Офис 1')
INSERT [dbo].[Equipment] ([equipment_id], [serial_number], [name], [model], [location]) VALUES (2, N'SN789012', N'Сканер', N'Epson Perfection V39', N'Офис 2')
INSERT [dbo].[Equipment] ([equipment_id], [serial_number], [name], [model], [location]) VALUES (3, N'SN345678', N'Ноутбук', N'Dell XPS 13', N'Офис 3')
GO
INSERT [dbo].[FaultType] ([fault_type_id], [name]) VALUES (1, N'Не включается')
INSERT [dbo].[FaultType] ([fault_type_id], [name]) VALUES (2, N'Не сканирует')
INSERT [dbo].[FaultType] ([fault_type_id], [name]) VALUES (3, N'Нет подключения к интернету')
GO
INSERT [dbo].[Performer] ([performer_id], [name], [specialization], [contact_info]) VALUES (1, N'Петров Петр Петрович', N'Ремонт оргтехники', N'+79991112233')
INSERT [dbo].[Performer] ([performer_id], [name], [specialization], [contact_info]) VALUES (2, N'Сидоров Сидор Сидорович', N'Ремонт компьютеров', N'+79992223344')
INSERT [dbo].[Performer] ([performer_id], [name], [specialization], [contact_info]) VALUES (3, N'Иванов Иван Иванович', N'Сетевое оборудование', N'+79993334455')
GO
INSERT [dbo].[RepairRequest] ([request_id], [request_date], [equipment_id], [fault_type_id], [description], [client_id], [status], [assigned_to], [completion_date], [report]) VALUES (1, CAST(N'2023-01-10T10:00:00.000' AS DateTime), 1, 1, N'Принтер не включается', 1, N'В работе', 1, NULL, NULL)
INSERT [dbo].[RepairRequest] ([request_id], [request_date], [equipment_id], [fault_type_id], [description], [client_id], [status], [assigned_to], [completion_date], [report]) VALUES (2, CAST(N'2023-02-10T11:00:00.000' AS DateTime), 2, 2, N'Сканер не сканирует документы', 2, N'Завершено', 2, CAST(N'2023-03-10T12:00:00.000' AS DateTime), N'Замена лампы сканера')
INSERT [dbo].[RepairRequest] ([request_id], [request_date], [equipment_id], [fault_type_id], [description], [client_id], [status], [assigned_to], [completion_date], [report]) VALUES (3, CAST(N'2023-03-10T12:00:00.000' AS DateTime), 3, 3, N'Ноутбук не подключается к Wi-Fi', 3, N'В ожидании', NULL, NULL, NULL)
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([performer_id])
REFERENCES [dbo].[Performer] ([performer_id])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([request_id])
REFERENCES [dbo].[RepairRequest] ([request_id])
GO
ALTER TABLE [dbo].[RepairRequest]  WITH CHECK ADD FOREIGN KEY([assigned_to])
REFERENCES [dbo].[Performer] ([performer_id])
GO
ALTER TABLE [dbo].[RepairRequest]  WITH CHECK ADD FOREIGN KEY([client_id])
REFERENCES [dbo].[Client] ([client_id])
GO
ALTER TABLE [dbo].[RepairRequest]  WITH CHECK ADD FOREIGN KEY([equipment_id])
REFERENCES [dbo].[Equipment] ([equipment_id])
GO
ALTER TABLE [dbo].[RepairRequest]  WITH CHECK ADD FOREIGN KEY([fault_type_id])
REFERENCES [dbo].[FaultType] ([fault_type_id])
GO
