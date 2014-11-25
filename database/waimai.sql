USE [WaiMai]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2014/11/26 0:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] NOT NULL,
	[AccountName] [nvarchar](50) NOT NULL,
	[IPAddress] [varchar](20) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsDel] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Config]    Script Date: 2014/11/26 0:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[ConfigName] [nvarchar](50) NOT NULL,
	[ConfigValue] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[ConfigName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodMenu]    Script Date: 2014/11/26 0:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodMenu](
	[FoodMenuID] [int] IDENTITY(1,1) NOT NULL,
	[FoodMenuCategoryID] [int] NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Creator] [nvarchar](50) NULL,
	[EditDate] [datetime] NULL,
	[Editor] [nvarchar](50) NULL,
	[IsSale] [bit] NOT NULL,
	[IsDel] [bit] NOT NULL,
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_FoodMenu] PRIMARY KEY CLUSTERED 
(
	[FoodMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodMenuCategory]    Script Date: 2014/11/26 0:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodMenuCategory](
	[FoodMenuCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[RestaurantID] [int] NOT NULL,
	[CName] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Creator] [nvarchar](50) NULL,
	[EditDate] [datetime] NULL,
	[Editor] [nvarchar](50) NULL,
	[IsSale] [bit] NOT NULL,
	[IsDel] [bit] NOT NULL,
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_FoodMenuCategory] PRIMARY KEY CLUSTERED 
(
	[FoodMenuCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 2014/11/26 0:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[FoodMenuID] [int] NOT NULL,
	[TotalCount] [int] NOT NULL,
	[TotalPrice] [decimal](18, 1) NOT NULL,
	[NickName] [nchar](10) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Creator] [nvarchar](50) NULL,
	[EditDate] [datetime] NULL,
	[Editor] [nvarchar](50) NULL,
	[IsDel] [bit] NOT NULL,
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Recharge]    Script Date: 2014/11/26 0:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recharge](
	[RechargeID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[Status] [int] NOT NULL,
	[IsDel] [bit] NOT NULL,
 CONSTRAINT [PK_Recharge] PRIMARY KEY CLUSTERED 
(
	[RechargeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Restaurant]    Script Date: 2014/11/26 0:24:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurant](
	[RestaurantID] [int] IDENTITY(1,1) NOT NULL,
	[RestaurantName] [nvarchar](50) NOT NULL,
	[SendOutCount] [int] NOT NULL,
	[TakeoutPhone] [nvarchar](50) NOT NULL,
	[IsEnable] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Creator] [nvarchar](50) NULL,
	[EditDate] [datetime] NULL,
	[Editor] [nvarchar](50) NULL,
	[IsDel] [bit] NOT NULL,
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED 
(
	[RestaurantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Config] ([ConfigName], [ConfigValue]) VALUES (N'DoOrder', N'{"DoTime":"2014/11/26","IsDo":false}')
SET IDENTITY_INSERT [dbo].[FoodMenu] ON 

INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (1, 3, N'叉烧饭1', CAST(25.0 AS Decimal(18, 1)), CAST(0x0000A3E50150ACC9 AS DateTime), NULL, CAST(0x0000A3E50150CB9E AS DateTime), N'sys', 1, 1, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (2, 1003, N'炒斋粉', CAST(5.0 AS Decimal(18, 1)), CAST(0x0000A3E50154C32A AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (3, 1003, N'炒蛋粉', CAST(6.0 AS Decimal(18, 1)), CAST(0x0000A3E50154D384 AS DateTime), NULL, CAST(0x0000A3E8017E3466 AS DateTime), N'sys', 0, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (4, 1003, N'炒肉粉', CAST(4.0 AS Decimal(18, 1)), CAST(0x0000A3E50154E1BA AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (5, 1004, N'韭菜炒蛋饭', CAST(7.5 AS Decimal(18, 1)), CAST(0x0000A3E50154FCE8 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (6, 1004, N'芹肉片饭', CAST(12.0 AS Decimal(18, 1)), CAST(0x0000A3E5015508BC AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (7, 1004, N'青瓜肉片饭', CAST(10.0 AS Decimal(18, 1)), CAST(0x0000A3E5015517F7 AS DateTime), NULL, NULL, NULL, 1, 1, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (8, 1002, N'土豆肉片饭', CAST(12.0 AS Decimal(18, 1)), CAST(0x0000A3E5015525F3 AS DateTime), NULL, NULL, NULL, 1, 1, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (9, 1003, N'豆角炒肉片饭', CAST(12.0 AS Decimal(18, 1)), CAST(0x0000A3E5015537E6 AS DateTime), NULL, NULL, NULL, 1, 1, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (10, 1002, N'日本豆腐肉片饭', CAST(5.0 AS Decimal(18, 1)), CAST(0x0000A3E501554D27 AS DateTime), NULL, NULL, NULL, 1, 1, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (11, 1, N'脆皮烧鸭饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600C0CAAB AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (12, 1, N'切鸡腿饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600C0E09A AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (13, 1, N'油鸡腿饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600C0F4A0 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (14, 1, N'沙姜切鸡饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600C10BDD AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (15, 1, N'脆皮烧肉饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600C12083 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (16, 1, N'蜜汁叉烧饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600C131E3 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (17, 1, N'猪手饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600C14290 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (18, 1, N'酸辣猪耳饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600C163A6 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (19, 1, N'沙姜切鸡腿饭', CAST(12.0 AS Decimal(18, 1)), CAST(0x0000A3E600C17E5A AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (20, 1, N'孜然排骨饭', CAST(13.0 AS Decimal(18, 1)), CAST(0x0000A3E600C1A1BB AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (21, 1, N'脆皮烧鸭腿饭', CAST(14.0 AS Decimal(18, 1)), CAST(0x0000A3E600C1C1A1 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (22, 1, N'脆皮烧鹅饭', CAST(15.0 AS Decimal(18, 1)), CAST(0x0000A3E600C1DEE5 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (23, 1, N'脆皮烧鹅腿饭', CAST(19.0 AS Decimal(18, 1)), CAST(0x0000A3E600C1F838 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (24, 2, N'鸡亦拼烧鸭饭', CAST(13.0 AS Decimal(18, 1)), CAST(0x0000A3E600C214A9 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (25, 2, N'鸡腿拼煎蛋饭', CAST(13.0 AS Decimal(18, 1)), CAST(0x0000A3E600C244B8 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (26, 2, N'鸡亦拼叉烧饭', CAST(13.0 AS Decimal(18, 1)), CAST(0x0000A3E600C26696 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (27, 2, N'切鸡拼烧鸭饭', CAST(14.0 AS Decimal(18, 1)), CAST(0x0000A3E600C28B84 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (28, 2, N'油鸡拼叉烧饭', CAST(14.0 AS Decimal(18, 1)), CAST(0x0000A3E600C2A8EF AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (29, 2, N'黑椒鸡扒饭+煎蛋', CAST(14.0 AS Decimal(18, 1)), CAST(0x0000A3E600C2C61D AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (30, 2, N'烧鸭拼烧肉饭', CAST(15.0 AS Decimal(18, 1)), CAST(0x0000A3E600C2DCC6 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (31, 2, N'蜜汁叉烧拼烧鸭饭', CAST(15.0 AS Decimal(18, 1)), CAST(0x0000A3E600C35098 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (32, 2, N'鸡腿拼烧鸭饭', CAST(15.0 AS Decimal(18, 1)), CAST(0x0000A3E600C36C8B AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (33, 2, N'鸡腿拼叉烧饭', CAST(15.0 AS Decimal(18, 1)), CAST(0x0000A3E600C393A4 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (34, 2, N'蜜汁叉烧拼烧肉饭', CAST(15.0 AS Decimal(18, 1)), CAST(0x0000A3E600C3A6B4 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (35, 2, N'烧鸭腿煎蛋饭', CAST(16.0 AS Decimal(18, 1)), CAST(0x0000A3E600C3CE62 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (36, 2, N'招牌纸包鸡+烧鸭饭', CAST(16.0 AS Decimal(18, 1)), CAST(0x0000A3E600C3E91F AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (37, 3, N'煎蛋', CAST(2.0 AS Decimal(18, 1)), CAST(0x0000A3E600C3FA92 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (38, 3, N'咸蛋', CAST(2.0 AS Decimal(18, 1)), CAST(0x0000A3E600C40776 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (39, 3, N'白米饭', CAST(3.0 AS Decimal(18, 1)), CAST(0x0000A3E600C414A1 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (40, 3, N'烧鸭脖子', CAST(3.0 AS Decimal(18, 1)), CAST(0x0000A3E600C42AFE AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (41, 3, N'白饭加青菜', CAST(5.0 AS Decimal(18, 1)), CAST(0x0000A3E600C43EF4 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (42, 3, N'鸡翅', CAST(5.0 AS Decimal(18, 1)), CAST(0x0000A3E600C452F0 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (43, 3, N'鸡腿', CAST(7.0 AS Decimal(18, 1)), CAST(0x0000A3E600C461CF AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (44, 4, N'荷叶笼仔腊鸭饭', CAST(10.0 AS Decimal(18, 1)), CAST(0x0000A3E600C4BF04 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (45, 4, N'荷叶笼仔腊味饭', CAST(10.0 AS Decimal(18, 1)), CAST(0x0000A3E600C4D821 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (46, 4, N'荷叶笼仔滑鸡饭', CAST(10.0 AS Decimal(18, 1)), CAST(0x0000A3E600C5F9B6 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (47, 4, N'荷叶笼仔鱼腩饭', CAST(10.0 AS Decimal(18, 1)), CAST(0x0000A3E600C60F77 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (48, 4, N'荷叶笼仔排骨饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600C62C66 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (49, 4, N'荷叶笼仔牛肉饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600C6F399 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (50, 4, N'荷叶笼仔叉烧饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600C70ACD AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (51, 4, N'荷叶笼仔烧肉饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600C71F94 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (52, 4, N'荷叶梅菜扣肉饭', CAST(12.0 AS Decimal(18, 1)), CAST(0x0000A3E600C73D0D AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (53, 5, N'笼仔腊鸭拼叉烧饭', CAST(14.0 AS Decimal(18, 1)), CAST(0x0000A3E600C87137 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (54, 5, N'笼仔滑鸡评烧鸭饭', CAST(14.0 AS Decimal(18, 1)), CAST(0x0000A3E600C88FC2 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (55, 5, N'笼仔鱼腩拼叉烧饭', CAST(14.0 AS Decimal(18, 1)), CAST(0x0000A3E600C8CADB AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (56, 5, N'梅菜扣肉拼煎蛋饭', CAST(14.0 AS Decimal(18, 1)), CAST(0x0000A3E600C8E881 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (57, 5, N'笼仔腊味拼烧鸭饭', CAST(14.0 AS Decimal(18, 1)), CAST(0x0000A3E600C904A6 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (58, 5, N'梅菜排骨拼烧鸭饭', CAST(15.0 AS Decimal(18, 1)), CAST(0x0000A3E600C9227A AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (59, 5, N'梅菜牛肉拼烧鸭饭', CAST(15.0 AS Decimal(18, 1)), CAST(0x0000A3E600C93FB4 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (60, 5, N'笼仔排骨拼鸡亦饭', CAST(16.0 AS Decimal(18, 1)), CAST(0x0000A3E600C95826 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (61, 5, N'梅菜牛肉拼鸡腿饭', CAST(18.0 AS Decimal(18, 1)), CAST(0x0000A3E600C9709F AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (62, 6, N'干煸四季豆肉片饭', CAST(10.0 AS Decimal(18, 1)), CAST(0x0000A3E600C9937E AS DateTime), NULL, CAST(0x0000A3E7009FB259 AS DateTime), N'sys', 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (63, 6, N'支竹红烧肉饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600C9B37D AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (64, 6, N'西兰花肉片饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600C9C9ED AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (65, 6, N'青椒炒肉片饭', CAST(10.0 AS Decimal(18, 1)), CAST(0x0000A3E600C9E265 AS DateTime), NULL, CAST(0x0000A3E600C9ECB8 AS DateTime), N'sys', 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (66, 7, N'农家小炒肉饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600D3705B AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (67, 7, N'茄子肉末饭', CAST(10.0 AS Decimal(18, 1)), CAST(0x0000A3E600DF8C0C AS DateTime), NULL, CAST(0x0000A3E600DF948D AS DateTime), N'sys', 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (68, 7, N'酸菜红烧肉饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600DFB055 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (69, 7, N'辣子鸡饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600DFC75A AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (70, 8, N'香辣焖鸭饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E600E011DC AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (71, 8, N'茄子肉沫饭', CAST(10.0 AS Decimal(18, 1)), CAST(0x0000A3E600E029AC AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (72, 8, N'酸辣土豆肉丝饭', CAST(10.0 AS Decimal(18, 1)), CAST(0x0000A3E600E0413B AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (73, 8, N'豆腐焖肉片饭', CAST(10.0 AS Decimal(18, 1)), CAST(0x0000A3E600E0566E AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (74, 9, N'招牌纸包鸡饭', CAST(12.0 AS Decimal(18, 1)), CAST(0x0000A3E600E06D62 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (75, 9, N'黑椒鸡扒饭', CAST(12.0 AS Decimal(18, 1)), CAST(0x0000A3E600E083DB AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (76, 12, N'鱼香茄子饭', CAST(9.0 AS Decimal(18, 1)), CAST(0x0000A3E700A0942D AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (77, 12, N'凉瓜肉丝饭', CAST(9.0 AS Decimal(18, 1)), CAST(0x0000A3E700A0AFAA AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (78, 12, N'三杯茄子饭', CAST(9.0 AS Decimal(18, 1)), CAST(0x0000A3E700A0C68B AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (79, 12, N'干煸豆角饭', CAST(9.0 AS Decimal(18, 1)), CAST(0x0000A3E700A0D922 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (80, 12, N'剁椒玉子豆腐饭', CAST(9.0 AS Decimal(18, 1)), CAST(0x0000A3E700A0F513 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (81, 12, N'木耳肉丝饭', CAST(9.0 AS Decimal(18, 1)), CAST(0x0000A3E700A109A5 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (82, 12, N'清蒸鱼饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E700A12122 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (83, 12, N'剁椒蒸鱼饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E700A13D44 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (84, 12, N'御口香饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E700A174A6 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (85, 12, N'糖醋鸡丁饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E700A1A1CF AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (86, 12, N'宫保鸡丁饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E700A1C7FB AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (87, 14, N'鱼香四丁饭', CAST(9.0 AS Decimal(18, 1)), CAST(0x0000A3E700A1E805 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (88, 14, N'尖椒炒千张饭（辣）', CAST(9.0 AS Decimal(18, 1)), CAST(0x0000A3E700A20B31 AS DateTime), NULL, CAST(0x0000A3E700A50852 AS DateTime), N'sys', 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (89, 14, N'沙茶土豆片饭', CAST(9.0 AS Decimal(18, 1)), CAST(0x0000A3E700A223DD AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (90, 12, N'铁板肉片饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E700A2261A AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (91, 14, N'雪里红肉沫饭（辣）', CAST(9.0 AS Decimal(18, 1)), CAST(0x0000A3E700A24062 AS DateTime), NULL, CAST(0x0000A3E700A4F569 AS DateTime), N'sys', 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (92, 12, N'三杯鸡饭', CAST(13.0 AS Decimal(18, 1)), CAST(0x0000A3E700A25622 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (93, 14, N'莲藕肉丝饭', CAST(9.0 AS Decimal(18, 1)), CAST(0x0000A3E700A25B2B AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (94, 12, N'铁板鸡扒饭', CAST(13.0 AS Decimal(18, 1)), CAST(0x0000A3E700A2679F AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (95, 14, N'三姑六婆饭（辣）', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E700A26B2A AS DateTime), NULL, CAST(0x0000A3E700A2DDD8 AS DateTime), N'sys', 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (96, 12, N'狮子头饭', CAST(13.0 AS Decimal(18, 1)), CAST(0x0000A3E700A27AD1 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (97, 14, N'回锅肉饭（辣）', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E700A28321 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (98, 12, N'铁板煎鱼饭', CAST(13.0 AS Decimal(18, 1)), CAST(0x0000A3E700A2905B AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (99, 14, N'子姜鸡饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E700A29C26 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
GO
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (100, 12, N'香辣鸡腿饭', CAST(13.0 AS Decimal(18, 1)), CAST(0x0000A3E700A29FC0 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (101, 12, N'铁板鸡扒+西红柿炒蛋', CAST(16.0 AS Decimal(18, 1)), CAST(0x0000A3E700A2BB09 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (102, 14, N'培根小笋饭（辣）', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E700A2BF57 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (103, 14, N'扁豆小炒肉饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E700A2D324 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (104, 12, N'铁板煎鱼+三色玉米', CAST(16.0 AS Decimal(18, 1)), CAST(0x0000A3E700A2D6A7 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (105, 14, N'飞鸿排骨饭', CAST(13.0 AS Decimal(18, 1)), CAST(0x0000A3E700A30262 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (106, 12, N'三杯鸡+铁板豆腐', CAST(16.0 AS Decimal(18, 1)), CAST(0x0000A3E700A303BB AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (107, 14, N'梅菜扣肉饭', CAST(13.0 AS Decimal(18, 1)), CAST(0x0000A3E700A314E4 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (108, 14, N'沙茶鱿鱼饭（辣）', CAST(13.0 AS Decimal(18, 1)), CAST(0x0000A3E700A33C91 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (109, 14, N'鲜菇肉片饭', CAST(13.0 AS Decimal(18, 1)), CAST(0x0000A3E700A35231 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (110, 13, N'孜然白花饭', CAST(9.0 AS Decimal(18, 1)), CAST(0x0000A3E700A35314 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (111, 14, N'红烧罗非鱼饭（辣）', CAST(13.0 AS Decimal(18, 1)), CAST(0x0000A3E700A36C6F AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (112, 14, N'红烧罗非鱼饭（辣）', CAST(13.0 AS Decimal(18, 1)), CAST(0x0000A3E700A36D1A AS DateTime), NULL, NULL, NULL, 1, 1, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (113, 13, N'青笋肉丝饭', CAST(9.0 AS Decimal(18, 1)), CAST(0x0000A3E700A38C0E AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (114, 14, N'梅菜扣肉+西红柿炒蛋', CAST(16.0 AS Decimal(18, 1)), CAST(0x0000A3E700A39433 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (115, 13, N'小炒千叶豆腐饭', CAST(9.0 AS Decimal(18, 1)), CAST(0x0000A3E700A3A7D0 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (116, 14, N'沙茶猪肝+莲藕肉丝', CAST(16.0 AS Decimal(18, 1)), CAST(0x0000A3E700A3ABF5 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (117, 13, N'油焖双冬饭', CAST(9.0 AS Decimal(18, 1)), CAST(0x0000A3E700A3C492 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (118, 14, N'小笋培根+雪里红肉沫', CAST(16.0 AS Decimal(18, 1)), CAST(0x0000A3E700A3D381 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (119, 13, N'木须肉饭', CAST(9.0 AS Decimal(18, 1)), CAST(0x0000A3E700A3D455 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (120, 13, N'沙茶猪肝饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E700A3F80A AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (121, 13, N'沙葛炒腊肉饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E700A41970 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (122, 13, N'开胃鸡饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E700A4284D AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (123, 13, N'粉葛扣肉+脆笋烩腐竹', CAST(16.0 AS Decimal(18, 1)), CAST(0x0000A3E700A4378A AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (124, 13, N'蒜台鸡脯饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E700A451B6 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (125, 13, N'开胃鸡+孜然白花', CAST(16.0 AS Decimal(18, 1)), CAST(0x0000A3E700A454AB AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (126, 13, N'黑椒鸡柳饭', CAST(11.0 AS Decimal(18, 1)), CAST(0x0000A3E700A464C0 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (127, 13, N'蒜台鸭脯+小炒千叶豆腐', CAST(16.0 AS Decimal(18, 1)), CAST(0x0000A3E700A486A4 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (128, 12, N'小笋培根+莲藕肉丝', CAST(16.0 AS Decimal(18, 1)), CAST(0x0000A3E700B1EB4A AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (129, 12, N'铁板煎鱼+番茄炒蛋', CAST(16.0 AS Decimal(18, 1)), CAST(0x0000A3E700B224EA AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (130, 12, N'铁板煎鱼+番茄炒蛋', CAST(16.0 AS Decimal(18, 1)), CAST(0x0000A3E700B22598 AS DateTime), NULL, NULL, NULL, 1, 1, 1)
INSERT [dbo].[FoodMenu] ([FoodMenuID], [FoodMenuCategoryID], [MenuName], [Price], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (131, 12, N'铁板鸡扒+番茄炒蛋1', CAST(16.0 AS Decimal(18, 1)), CAST(0x0000A3E700B24801 AS DateTime), NULL, CAST(0x0000A3E700D31EC9 AS DateTime), N'sys', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[FoodMenu] OFF
SET IDENTITY_INSERT [dbo].[FoodMenuCategory] ON 

INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (1, 1, N'测试一', CAST(0x0000A3E400B78281 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (2, 1, N'在在在', CAST(0x0000A3E400DA8851 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (3, 1, N'史在在', CAST(0x0000A3E400E119B7 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (4, 1, N'大在在在', CAST(0x0000A3E400E128AD AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (5, 1, N'大在在', CAST(0x0000A3E400E14AEF AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (6, 1, N'123', CAST(0x0000A3E400FB1B29 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (7, 1, N'1231234', CAST(0x0000A3E4016FFBD7 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (8, 1, N'dddddd', CAST(0x0000A3E401713B95 AS DateTime), NULL, NULL, NULL, 1, 1, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (9, 1, N'ddddssss', CAST(0x0000A3E40171A496 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (10, 1, N'22333', CAST(0x0000A3E401720E9D AS DateTime), NULL, CAST(0x0000A3E50100E230 AS DateTime), N'sys', 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (11, 1, N'123333', CAST(0x0000A3E401839490 AS DateTime), NULL, NULL, NULL, 1, 1, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (12, 1, N'333333', CAST(0x0000A3E40183A0F0 AS DateTime), NULL, NULL, NULL, 1, 1, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (13, 1, N'44444', CAST(0x0000A3E40183AC12 AS DateTime), NULL, CAST(0x0000A3E5000D7E9A AS DateTime), N'sys', 1, 1, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (14, 1, N'1211', CAST(0x0000A3E50000BD96 AS DateTime), NULL, NULL, NULL, 1, 1, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (15, 1, N'22223333', CAST(0x0000A3E50000C8C4 AS DateTime), NULL, CAST(0x0000A3E5000D7637 AS DateTime), N'sys', 1, 1, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (16, 1, N'1111', CAST(0x0000A3E50000D296 AS DateTime), NULL, NULL, NULL, 1, 1, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (17, 1, N'12225552222', CAST(0x0000A3E50000E2C8 AS DateTime), NULL, CAST(0x0000A3E5000D8782 AS DateTime), N'sys', 1, 1, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (18, 1, N'1233111', CAST(0x0000A3E50000EF07 AS DateTime), NULL, CAST(0x0000A3E5000D8F95 AS DateTime), N'sys', 1, 1, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (19, 1, N'sssssssaaaa', CAST(0x0000A3E5001349A0 AS DateTime), NULL, CAST(0x0000A3E5001353BD AS DateTime), N'sys', 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (1002, 3, N'测试一', CAST(0x0000A3E50137E94F AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (1003, 3, N'小炒', CAST(0x0000A3E501547A0C AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (1004, 3, N'快餐', CAST(0x0000A3E501548D5A AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (1005, 1, N'传统广式烧腊推荐', CAST(0x0000A3E600B6C5B4 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (1006, 1, N'烧腊美味双拼', CAST(0x0000A3E600B6DA9D AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (1007, 1, N'开心加料', CAST(0x0000A3E600B6EA87 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (1008, 1, N'飘香荷叶笼仔饭', CAST(0x0000A3E600B706C5 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (1009, 1, N'荷叶笼仔美味双拼', CAST(0x0000A3E600B71AA2 AS DateTime), NULL, NULL, NULL, 1, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (1010, 1, N'星期一、二', CAST(0x0000A3E600B733A6 AS DateTime), NULL, NULL, NULL, 0, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (1011, 1, N'星期三、四', CAST(0x0000A3E600B76237 AS DateTime), NULL, NULL, NULL, 0, 0, 1)
INSERT [dbo].[FoodMenuCategory] ([FoodMenuCategoryID], [RestaurantID], [CName], [CreateDate], [Creator], [EditDate], [Editor], [IsSale], [IsDel], [Version]) VALUES (1012, 1, N'测试的', CAST(0x0000A3EE018ACA1C AS DateTime), NULL, NULL, NULL, 1, 0, 1)
SET IDENTITY_INSERT [dbo].[FoodMenuCategory] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (1, 2, 1, CAST(5.0 AS Decimal(18, 1)), N'大         ', CAST(0x0000A3E6001619F7 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (2, 3, 1, CAST(6.0 AS Decimal(18, 1)), N'大磊在在      ', CAST(0x0000A3E600162BBD AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (3, 10, 1, CAST(5.0 AS Decimal(18, 1)), N'小江        ', CAST(0x0000A3E6001BE278 AS DateTime), NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (4, 2, 1, CAST(5.0 AS Decimal(18, 1)), N'炒斋粉       ', CAST(0x0000A3E6001C7294 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (5, 2, 1, CAST(5.0 AS Decimal(18, 1)), N'小江        ', CAST(0x0000A3E6001FDD24 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (6, 2, 1, CAST(5.0 AS Decimal(18, 1)), N'杨海涛       ', CAST(0x0000A3E600B39787 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (7, 5, 1, CAST(7.5 AS Decimal(18, 1)), N'fffff     ', CAST(0x0000A3E600B44BBC AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (8, 93, 1, CAST(9.0 AS Decimal(18, 1)), N'江永升       ', CAST(0x0000A3E700A589BE AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (9, 90, 1, CAST(11.0 AS Decimal(18, 1)), N'叶俏锋只吃肉    ', CAST(0x0000A3E700A590A7 AS DateTime), NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (10, 92, 1, CAST(13.0 AS Decimal(18, 1)), N'吴妍        ', CAST(0x0000A3E700A5A094 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (11, 116, 1, CAST(16.0 AS Decimal(18, 1)), N'嘉莹        ', CAST(0x0000A3E700A5AF09 AS DateTime), NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (12, 101, 1, CAST(16.0 AS Decimal(18, 1)), N'周彦斌       ', CAST(0x0000A3E700A628A7 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (13, 90, 1, CAST(11.0 AS Decimal(18, 1)), N'卢成        ', CAST(0x0000A3E700A664C7 AS DateTime), NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (14, 105, 1, CAST(13.0 AS Decimal(18, 1)), N'陈建松       ', CAST(0x0000A3E700A66EC9 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (15, 96, 1, CAST(13.0 AS Decimal(18, 1)), N'段光伟       ', CAST(0x0000A3E700A71BC7 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (16, 92, 1, CAST(13.0 AS Decimal(18, 1)), N'app谢扬辉    ', CAST(0x0000A3E700A7377F AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (17, 88, 1, CAST(9.0 AS Decimal(18, 1)), N'胡祝丰       ', CAST(0x0000A3E700A74419 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (18, 92, 1, CAST(13.0 AS Decimal(18, 1)), N'柯帅        ', CAST(0x0000A3E700A79622 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (19, 98, 1, CAST(13.0 AS Decimal(18, 1)), N'花花        ', CAST(0x0000A3E700A7BD7A AS DateTime), NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (20, 88, 1, CAST(9.0 AS Decimal(18, 1)), N'刘超（app）   ', CAST(0x0000A3E700A7C495 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (21, 116, 1, CAST(16.0 AS Decimal(18, 1)), N'陈嘉茵       ', CAST(0x0000A3E700A7EBAC AS DateTime), NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (22, 96, 1, CAST(13.0 AS Decimal(18, 1)), N'余伟鹏       ', CAST(0x0000A3E700A861FB AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (23, 90, 1, CAST(11.0 AS Decimal(18, 1)), N'花花爱吃肉     ', CAST(0x0000A3E700A8AC6A AS DateTime), NULL, NULL, NULL, 1, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (24, 94, 1, CAST(13.0 AS Decimal(18, 1)), N'祖杰        ', CAST(0x0000A3E700A8CB17 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (25, 94, 1, CAST(13.0 AS Decimal(18, 1)), N'关炜健       ', CAST(0x0000A3E700A90181 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (26, 79, 1, CAST(9.0 AS Decimal(18, 1)), N'鑫鑫        ', CAST(0x0000A3E700A97FEE AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (27, 96, 1, CAST(13.0 AS Decimal(18, 1)), N'胡昌俊       ', CAST(0x0000A3E700AA6008 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (28, 109, 1, CAST(13.0 AS Decimal(18, 1)), N'华荣        ', CAST(0x0000A3E700AB51A6 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (29, 109, 1, CAST(13.0 AS Decimal(18, 1)), N'王超        ', CAST(0x0000A3E700ABA8D3 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (30, 100, 1, CAST(13.0 AS Decimal(18, 1)), N'刘珊        ', CAST(0x0000A3E700ACE61A AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (31, 82, 1, CAST(11.0 AS Decimal(18, 1)), N'叶俏锋       ', CAST(0x0000A3E700AFF410 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (32, 86, 1, CAST(11.0 AS Decimal(18, 1)), N'卢成        ', CAST(0x0000A3E700B01FF9 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (33, 98, 1, CAST(13.0 AS Decimal(18, 1)), N'huahua    ', CAST(0x0000A3E700B05FDE AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (34, 129, 1, CAST(16.0 AS Decimal(18, 1)), N'容赜        ', CAST(0x0000A3E700B25E36 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (35, 128, 1, CAST(16.0 AS Decimal(18, 1)), N'陈嘉茵       ', CAST(0x0000A3E700B2811F AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (36, 131, 1, CAST(16.0 AS Decimal(18, 1)), N'小方        ', CAST(0x0000A3E700B2935A AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (37, 21, 1, CAST(14.0 AS Decimal(18, 1)), N'小江        ', CAST(0x0000A3E801751C36 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (38, 15, 1, CAST(11.0 AS Decimal(18, 1)), N'花花        ', CAST(0x0000A3E8017535AA AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (39, 43, 1, CAST(7.0 AS Decimal(18, 1)), N'小江        ', CAST(0x0000A3EE017F21A0 AS DateTime), NULL, NULL, NULL, 0, 1)
INSERT [dbo].[Order] ([OrderID], [FoodMenuID], [TotalCount], [TotalPrice], [NickName], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (40, 67, 1, CAST(10.0 AS Decimal(18, 1)), N'小小        ', CAST(0x0000A3EE017F3DCD AS DateTime), NULL, NULL, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Restaurant] ON 

INSERT [dbo].[Restaurant] ([RestaurantID], [RestaurantName], [SendOutCount], [TakeoutPhone], [IsEnable], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (1, N'汇味美食', 0, N'29063852', 0, CAST(0x0000A3E000000000 AS DateTime), N'admin', CAST(0x0000A3E600B6A2BB AS DateTime), N'sys', 0, 1)
INSERT [dbo].[Restaurant] ([RestaurantID], [RestaurantName], [SendOutCount], [TakeoutPhone], [IsEnable], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (2, N'111111www', 11, N'11', 0, CAST(0x0000A3E501343404 AS DateTime), NULL, CAST(0x0000A3E501357DA0 AS DateTime), N'sys', 1, 1)
INSERT [dbo].[Restaurant] ([RestaurantID], [RestaurantName], [SendOutCount], [TakeoutPhone], [IsEnable], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (3, N'才记餐厅', 2, N'123453333', 1, CAST(0x0000A3E50137A0B8 AS DateTime), NULL, CAST(0x0000A3E600B693E6 AS DateTime), N'sys', 0, 1)
INSERT [dbo].[Restaurant] ([RestaurantID], [RestaurantName], [SendOutCount], [TakeoutPhone], [IsEnable], [CreateDate], [Creator], [EditDate], [Editor], [IsDel], [Version]) VALUES (4, N'茶餐厅', 1, N'342134444', 0, CAST(0x0000A3E50137CE37 AS DateTime), NULL, CAST(0x0000A3E501555F20 AS DateTime), N'sys', 0, 1)
SET IDENTITY_INSERT [dbo].[Restaurant] OFF
ALTER TABLE [dbo].[FoodMenu] ADD  CONSTRAINT [DF_FoodMenu_IsSale]  DEFAULT ((1)) FOR [IsSale]
GO
ALTER TABLE [dbo].[FoodMenuCategory] ADD  CONSTRAINT [DF_FoodMenuCategory_IsSale]  DEFAULT ((1)) FOR [IsSale]
GO
ALTER TABLE [dbo].[Restaurant] ADD  CONSTRAINT [DF_Restaurant_SendOutCount]  DEFAULT ((0)) FOR [SendOutCount]
GO
ALTER TABLE [dbo].[FoodMenu]  WITH CHECK ADD  CONSTRAINT [FK_FoodMenu_FoodMenuCategory] FOREIGN KEY([FoodMenuCategoryID])
REFERENCES [dbo].[FoodMenuCategory] ([FoodMenuCategoryID])
GO
ALTER TABLE [dbo].[FoodMenu] CHECK CONSTRAINT [FK_FoodMenu_FoodMenuCategory]
GO
ALTER TABLE [dbo].[FoodMenuCategory]  WITH CHECK ADD  CONSTRAINT [FK_FoodMenuCategory_Restaurant] FOREIGN KEY([RestaurantID])
REFERENCES [dbo].[Restaurant] ([RestaurantID])
GO
ALTER TABLE [dbo].[FoodMenuCategory] CHECK CONSTRAINT [FK_FoodMenuCategory_Restaurant]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_FoodMenu] FOREIGN KEY([FoodMenuID])
REFERENCES [dbo].[FoodMenu] ([FoodMenuID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_FoodMenu]
GO
ALTER TABLE [dbo].[Recharge]  WITH CHECK ADD  CONSTRAINT [FK_Recharge_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Recharge] CHECK CONSTRAINT [FK_Recharge_Account]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1充值成功' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Recharge', @level2type=N'COLUMN',@level2name=N'Status'
GO
