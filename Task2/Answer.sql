GO

CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Product_Category](
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Product_Category] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Product_Category]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO

ALTER TABLE [dbo].[Product_Category] CHECK CONSTRAINT [FK_Product_Category_Category_CategoryId]
GO

ALTER TABLE [dbo].[Product_Category]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO

ALTER TABLE [dbo].[Product_Category] CHECK CONSTRAINT [FK_Product_Category_Product_ProductId]

GO

INSERT INTO [dbo].[Product] ([ProductName])
VALUES (N'Подушка XYZ'),
		(N'Подушка "от Вина Дизеля"'),
		(N'Стол "КэСер на максималках"'),
		(N'Стол "Счастье домохозяек"'),
		(N'"Загадочный куб"')


INSERT INTO [dbo].[Category] ([CategoryName])
VALUES (N'Подушка для дома'),
		(N'Подушка для авто'),
		(N'Кухонный стол'),
		(N'Игровой компьютерный стол'),
		(N'Одежда')

INSERT INTO [dbo].[Product_Category] ([ProductId],[CategoryId])
VALUES (1,1),
		(1,2),
		(2,1),
		(2,2),
		(3,4),
		(4,3)

GO

select product.ProductName,cat.CategoryName  
from dbo.Product_Category prodCat
full join dbo.Product product on  product.ProductId = prodCat.ProductId
full join dbo.Category cat on cat.CategoryId = prodCat.CategoryId



