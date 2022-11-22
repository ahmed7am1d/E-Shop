-- Users Table
CREATE TABLE Users (
    UserId int NOT NULL PRIMARY KEY IDENTITY(1,1),
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
	Email varchar(255),
    UserPassword nvarchar(max) NOT NULL, 
	PhoneNumber nvarchar(max) NOT NULL,
	RoleId int FOREIGN KEY REFERENCES Roles(RoleId)
);

--Roles Table 
CREATE TABLE Roles (
	 RoleId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	 RoleTitle varchar(255) NOT NULL
);

-- User Addresse Table 
CREATE TABLE UserAddress (
	 UserAddressId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	 City varchar(255) NOT NULL,
	 PostCode int NOT NULL,
	 Street varchar(255) NOT NULL, 
	 UserId int FOREIGN KEY REFERENCES Users(UserId),
	 CountryId int FOREIGN KEY REFERENCES Country(CountryId)
);
-- Country Table 
CREATE TABLE Country (
	 CountryId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	 CountryName varchar(255) NOT NULL,
	 ISO int NOT NULL
);

-- Order Table
CREATE TABLE Orders (
	 OrderId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	 UserId int FOREIGN KEY REFERENCES Users(UserId),
	 OrderStatusId int FOREIGN KEY REFERENCES OrderStatus(OrderStatusId),
	 CreatedDate DATETIME DEFAULT(GETDATE()),
);

-- Order Status Table 
CREATE TABLE OrderStatus (
	 OrderStatusId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	 OrderStatusTitle varchar(250) NOT NULL,
);
-- OrderDetails Table
CREATE TABLE OrderDetails (
	 OrderDetailsId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	 OrderId int FOREIGN KEY REFERENCES Orders(OrderId),
	 ProductId int FOREIGN KEY REFERENCES Products(ProductId),
	 Quantity int NOT NULL
);

-- Product Table 
CREATE TABLE Products (
	ProductId INT NOT NULL PRIMARY KEY IDENTITY (1,1), 
	ProductName nvarchar(max) NOT NULL, 
	ProductDescription nvarchar(max) NOT NULL, 
	Quantity INT NOT NULL,
	Price FLOAT NOT NULL, 
	IsDiscount BIT NULL,
	IsNew BIT NULL,
	UpdatedDate DATETIME NULL,
	UpdatedBy int FOREIGN KEY REFERENCES Users(UserId),
	CategoryId int FOREIGN KEY REFERENCES Category(CategoryId)
);

-- Category Table 
CREATE TABLE Category (
	 CategoryId INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	 CategoryName VARCHAR(250) NOT NULL
);
