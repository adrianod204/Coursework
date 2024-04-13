-- Create and load database --

CREATE DATABASE QuantigrationUpdates;

USE QuantigrationUpdates;

-- Creating tables for customer, order, and RMA data --

CREATE TABLE Customers(CustomerID int, FirstName VARCHAR(25),
                                                 LastName VARCHAR(25),
                                                          Street VARCHAR(50),
                                                                 City VARCHAR(50),
                                                                      State VARCHAR(25),
                                                                            ZipCode VARCHAR(10),
                                                                                    Telephone VARCHAR(15),
                                                                                              PRIMARY KEY (CustomerID));


CREATE TABLE Orders (OrderID INT, CustomerID INT, SKU VARCHAR(20),
                                                      Description VARCHAR(100),
                                                                  PRIMARY KEY (OrderID),
                     FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));


CREATE TABLE RMA (RMAID INT, OrderID INT, Step VARCHAR(50),
                                               Status VARCHAR(15),
                                                      Reason VARCHAR(15),
                                                             PRIMARY KEY (RMAID),
                  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID));

-- Selecting the count of customers that are located in Framingham, Massachussetts --

SELECT COUNT(*)
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE City = "Framingham"
    AND State = "Massachusetts";

-- Selecting all customers that are in the state of Massachusetts --

SELECT *
FROM Customers
WHERE State = 'Massachusetts';

-- Insert 4 new records into Customers, and Orders tables --

INSERT INTO Customers
VALUES(100004, 'Luke', 'Skywalker', '15 Maiden Lane', 'New York', 'NY', '10222', '212-555-1234'),
      (100005, 'Winston', 'Smith', '123 Sycamore Street', 'Greensboro', 'NC', '27401', '919-555-6623'),
      (100006, 'MaryAnne', 'Jenkins', '1 Coconut Way', 'Jupiter', 'FL', '33458', '321-555-6623'),
      (100007, 'Janet', 'Williams', '55 Redondo Beach Blvd', 'Torrence', 'CA', '905601', '310-555-5678');


INSERT INTO Orders
VALUES(1204305, 100004, 'ADV-24-10C', 'Advanced Switch 10GigE Copper 24 port'),
      (1204306, 100005, 'ADV-48-10F', 'Advanced Switch 10 GigE Copper/Fiber 44 port copper 4 port fiber'),
      (1204307, 100006, 'ENT-24-10F', 'Enterprise Switch 10GigE SFP+ 24 Port'),
      (1204308, 100007, 'ENT-48-10F', 'Enterprise Switch 10GigE SFP+ 48 port');

-- Retrieving count of all customers located in Woonsocket, Rhode Island --

SELECT COUNT(*)
FROM Customers
WHERE City = 'Woonsocket';

-- Retrieve status, step of RMA record with OrderID of 5175 and update it --

SELECT Status,
       Step
FROM RMA
WHERE OrderID = 5175;


UPDATE RMA
SET Status = 'Complete',
    Step = 'Credit Customer Account'
WHERE OrderID = 5175;

-- Delete all records from RMA where Reason = 'Rejected' --

DELETE
FROM RMA
WHERE Reason = 'Rejected';

-- Create view "Collaborators" where all instances of "Customer" are renamed to "Collaborator" --

CREATE VIEW Collaborator AS
SELECT CustomerID AS CollaboratorID,
       FirstName,
       LastName,
       Street,
       City,
       State,
       ZipCode,
       Telephone
FROM Customers;

-- Export Orders data to .CSV file --

SELECT *
FROM Orders INTO OUTFILE '/home/codio/workspace/Order-Results02.csv' FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n';