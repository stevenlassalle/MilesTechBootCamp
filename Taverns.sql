DROP TABLE IF EXISTS Taverns;
CREATE TABLE Taverns(
	id int PRIMARY KEY,
	tavernName varchar(255),
	tavernLocation varchar(255),
	tavernOwner varchar(255),
	numFloors int
);

DROP TABLE IF EXISTS TavernEmployees;
CREATE TABLE TavernEmployees(
	id int PRIMARY KEY,
	employeeName varchar(100),
	employeeJob varchar(50),
	jobDescription varchar(MAX)
);

DROP TABLE IF EXISTS Supplies;
CREATE TABLE Supplies(
	id int PRIMARY KEY,
	supplyName varchar(150),
	supplyUnits varchar(50),
	supplyQuantity int,
	updatedDate date,
	tavernId int
);

DROP TABLE IF EXISTS ReceivedSupplies;
CREATE TABLE ReceivedSupplies(
	id int PRIMARY KEY,
	supplyId int,
	TavernId int,
	cost decimal,
	quantityReceived int,
	dayReceived int
);

DROP TABLE IF EXISTS TavernServices;
CREATE TABLE TavernServices(
	id int PRIMARY KEY,
	serviceName varchar(100),
	statusId int,
	tavernId int
);

DROP TABLE IF EXISTS Rats;
CREATE TABLE Rats(
	id int PRIMARY KEY,
	ratName varchar(50),
	numFloor int
);

DROP TABLE IF EXISTS ServiceStatus;
CREATE TABLE ServiceStatus(
	id int PRIMARY KEY,
	statusName varchar(50)
);

DROP TABLE IF EXISTS TavernSales;
CREATE TABLE TavernSales(
	id int PRIMARY KEY,
	serviceDone varchar(100),
	guestName varchar(50),
	price decimal,
	datePurchased date,
	quantityPurchased int,
	tavernId int,
);