/******************** 
* Steven Lassalle   *
* 03/14/2019        *
* MilesTechBootCamp *
*********************/

DROP TABLE IF EXISTS Taverns;
DROP TABLE IF EXISTS TavernEmployees;
DROP TABLE IF EXISTS ReceivedSupplies;
DROP TABLE IF EXISTS Supplies;
DROP TABLE IF EXISTS TavernSales;
DROP TABLE IF EXISTS ServiceStatus;
DROP TABLE IF EXISTS TavernServices;
DROP TABLE IF EXISTS Guests;
DROP TABLE IF EXISTS GuestStatus;
DROP TABLE IF EXISTS Classes;

CREATE TABLE Taverns(
	id int IDENTITY(1,1) PRIMARY KEY,
	tavernName varchar(255),
	tavernLocation varchar(255),
	tavernOwner varchar(255),
	numFloors int
);

CREATE TABLE TavernEmployees(
	id int IDENTITY(1,1) PRIMARY KEY,
	employeeName varchar(100),
	employeeJob varchar(50),
	jobDescription varchar(MAX)
);

CREATE TABLE Supplies(
	id int IDENTITY(1,1) PRIMARY KEY,
	supplyName varchar(150),
	supplyUnits varchar(50),
	supplyQuantity int,
	updatedDate date,
	tavernId int FOREIGN KEY REFERENCES Taverns(id)
);

CREATE TABLE ReceivedSupplies(
	id int IDENTITY(1,1) PRIMARY KEY,
	supplyId int FOREIGN KEY REFERENCES Supplies(id),
	tavernId int FOREIGN KEY REFERENCES Taverns(id),
	cost decimal,
	quantityReceived int,
	dayReceived int
);

CREATE TABLE TavernServices(
	id int IDENTITY(1,1) PRIMARY KEY,
	serviceName varchar(100),
	statusId int, /*alter into a foreign key later*/
	tavernId int FOREIGN KEY REFERENCES Taverns(id)
);

CREATE TABLE ServiceStatus(
	id int IDENTITY(1,1) PRIMARY KEY,
	statusName varchar(50)
);

CREATE TABLE TavernSales(
	id int IDENTITY(1,1) PRIMARY KEY,
	serviceId int FOREIGN KEY REFERENCES ServiceStatus(id),
	guestName varchar(50),
	price decimal,
	datePurchased date,
	quantityPurchased int,
	tavernId int FOREIGN KEY REFERENCES Taverns(id)
);

CREATE TABLE Classes(
	id int IDENTITY(1,1) PRIMARY KEY,
	className varchar(100),
	classLevel int
);

CREATE TABLE Guests(
	id int IDENTITY(1,1) PRIMARY KEY,
	guestName varchar(50),
	aboutGuest varchar(MAX),
	guestBirthday date,
	guestCakeday date,
	guestStatusId int, /*Foreign Key is added later as an alter table. */
	classId int FOREIGN KEY REFERENCES Classes(id)
);

CREATE TABLE GuestStatus(
	id int IDENTITY(1,1) PRIMARY KEY,
	statusName varchar(25),
);

INSERT INTO Taverns (tavernName, tavernLocation, tavernOwner, numFloors) VALUES ('Bell Hop', 'NJ', 'Jorge Santos', 3);
INSERT INTO Taverns (tavernName, tavernLocation, tavernOwner, numFloors) VALUES ('Longhorn', 'NY', 'Phillip Thorn', 2);
INSERT INTO Taverns (tavernName, tavernLocation, tavernOwner, numFloors) VALUES ('Love Shack', 'CA', 'Tina Love', 1);
INSERT INTO Taverns (tavernName, tavernLocation, tavernOwner, numFloors) VALUES ('Far Cry', 'FL', 'Leanne Farley', 3);
INSERT INTO Taverns (tavernName, tavernLocation, tavernOwner, numFloors) VALUES ('Low Cranes', 'ID', 'Jon Stamos', 2);

INSERT INTO TavernEmployees (employeeName, employeeJob, jobDescription) VALUES ('Oscar Lue', 'Host', 'Greet guest and walk them to their tables.');
INSERT INTO TavernEmployees (employeeName, employeeJob, jobDescription) VALUES ('Dan Junior', 'Head Chef', 'Cook the greatest meals ever made.');
INSERT INTO TavernEmployees (employeeName, employeeJob, jobDescription) VALUES ('Tony Luke', 'Bartender', 'Create and serve drinks to guest.');
INSERT INTO TavernEmployees (employeeName, employeeJob, jobDescription) VALUES ('Bruno Mars', 'Performer', 'Sing for our guest because we are that cool.');
INSERT INTO TavernEmployees (employeeName, employeeJob, jobDescription) VALUES ('Bob Landry', 'Host', 'Greet guest and walk them to their tables.');

INSERT INTO Supplies (supplyName, supplyUnits, supplyQuantity, updatedDate, tavernId) VALUES ('Bud Light', 'Ounces', 10, '2019-03-07', 2);
INSERT INTO Supplies (supplyName, supplyUnits, supplyQuantity, updatedDate, tavernId) VALUES ('French Fries', 'Pounds', 15, '2019-03-02', 1);
INSERT INTO Supplies (supplyName, supplyUnits, supplyQuantity, updatedDate, tavernId) VALUES ('Ciroc', 'Liters', 8, '2019-02-20', 2);
INSERT INTO Supplies (supplyName, supplyUnits, supplyQuantity, updatedDate, tavernId) VALUES ('Burger Meat', 'Pounds', 20, '2019-03-09', 3);
INSERT INTO Supplies (supplyName, supplyUnits, supplyQuantity, updatedDate, tavernId) VALUES ('Yuengling', 'Ounces', 5, '2019-03-01', 4);

INSERT INTO ReceivedSupplies (supplyId, tavernId, cost, quantityReceived, dayReceived) VALUES (2, 5, 12.50, 3, 02);
INSERT INTO ReceivedSupplies (supplyId, tavernId, cost, quantityReceived, dayReceived) VALUES (5, 5, 40.00, 5, 15);
INSERT INTO ReceivedSupplies (supplyId, tavernId, cost, quantityReceived, dayReceived) VALUES (4, 3, 50.25, 2, 09);
INSERT INTO ReceivedSupplies (supplyId, tavernId, cost, quantityReceived, dayReceived) VALUES (1, 3, 30.75, 1, 04);
INSERT INTO ReceivedSupplies (supplyId, tavernId, cost, quantityReceived, dayReceived) VALUES (3, 1, 45.35, 6, 30);

INSERT INTO ServiceStatus (statusName) VALUES ('Completed.');
INSERT INTO ServiceStatus (statusName) VALUES ('In Progress.');
INSERT INTO ServiceStatus (statusName) VALUES ('Incompleted.');

ALTER TABLE TavernServices ADD FOREIGN KEY (statusId) REFERENCES ServiceStatus(id);
INSERT INTO TavernServices (serviceName, statusId, tavernId) VALUES ('Shoe Shine.',1 , 1);
INSERT INTO TavernServices (serviceName, statusId, tavernId) VALUES ('Host for all guest that enter the Tavern.',2 , 3);
INSERT INTO TavernServices (serviceName, statusId, tavernId) VALUES ('Call taxi for guests that need them.',2 , 2);
INSERT INTO TavernServices (serviceName, statusId, tavernId) VALUES ('Clean guests car while they are drinking.',3 , 5);

INSERT INTO TavernSales (serviceId, guestName, price, datePurchased, quantityPurchased, tavernId) VALUES (1, 'Bob', 5.00, '2019-03-02', 1, 3);
INSERT INTO TavernSales (serviceId, guestName, price, datePurchased, quantityPurchased, tavernId) VALUES (2, 'Charles', 10.00, '2019-03-06', 2, 1);
INSERT INTO TavernSales (serviceId, guestName, price, datePurchased, quantityPurchased, tavernId) VALUES (3, 'Lori', 10.00, '2019-03-10', 3, 4);
INSERT INTO TavernSales (serviceId, guestName, price, datePurchased, quantityPurchased, tavernId) VALUES (2, 'Stephanie', 3.00, '2019-03-01', 1, 2);

INSERT INTO GuestStatus (statusName) VALUES ('Excited.');
INSERT INTO GuestStatus (statusName) VALUES ('Angry.');
INSERT INTO GuestStatus (statusName) VALUES ('Scared.');
INSERT INTO GuestStatus (statusName) VALUES ('Confused.');
INSERT INTO GuestStatus (statusName) VALUES ('Paralyzed.');

INSERT INTO Classes (className, classLevel) VALUES ('Warrior', 15);
INSERT INTO Classes (className, classLevel) VALUES ('Thief', 10);
INSERT INTO Classes (className, classLevel) VALUES ('White Mage', 18);
INSERT INTO Classes (className, classLevel) VALUES ('Dragoon', 20);
INSERT INTO Classes (className, classLevel) VALUES ('Ninja', 15);

ALTER TABLE Guests ADD FOREIGN KEY (guestStatusId) REFERENCES GuestStatus(id);
INSERT INTO Guests (guestName, aboutGuest, guestBirthday, guestCakeday, guestStatusId, classId) VALUES ('Todd Bowles', 'Loves to sneak around.', '2010-01-09', '2012-04-25', 1, 2);
INSERT INTO Guests (guestName, aboutGuest, guestBirthday, guestCakeday, guestStatusId, classId) VALUES ('Jon Snow', 'Strong fighter with a lot of heart.', '1992-04-01', '2001-09-01', 2, 1);
INSERT INTO Guests (guestName, aboutGuest, guestBirthday, guestCakeday, guestStatusId, classId) VALUES ('Sora', 'Heart made of light.', '2001-06-24', '2005-08-03', 4, 5);
INSERT INTO Guests (guestName, aboutGuest, guestBirthday, guestCakeday, guestStatusId, classId) VALUES ('Van Helsing', 'Destroy all dragons.', '1995-12-25', '2019-10-05', 3, 4);
INSERT INTO Guests (guestName, aboutGuest, guestBirthday, guestCakeday, guestStatusId, classId) VALUES ('Tony Forty', 'Manage party health.', '2004-04-19', '2008-07-10', 5, 3);