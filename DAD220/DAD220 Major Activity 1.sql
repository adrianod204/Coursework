CREATE DATABASE Quantigration_RMA;

USE Quantigration_RMA;


CREATE TABLE Customers(CustomerID INT, FirstName VARCHAR(25),
                                                 LastName VARCHAR(25),
                                                          Street VARCHAR(50),
                                                                 City VARCHAR(50),
                                                                      State VARCHAR(25),
                                                                            ZipCode VARCHAR(15),
                                                                                    Telephone VARCHAR(15),
                                                                                              PRIMARY KEY (CustomerID));


CREATE TABLE Orders(OrderID INT, CustomerID INT, SKU VARCHAR(20),
                                                     Description VARCHAR(20),
                                                                 PRIMARY KEY (OrderID),
                    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID));


CREATE TABLE RMA(RMAID INT, OrderID INT, Step VARCHAR(50),
                                              Status VARCHAR(15),
                                                     Reason VARCHAR(15),
                                                            PRIMARY KEY (RMAID),
                 FOREIGN KEY (OrderID) REFERENCES Orders(OrderID));


INSERT INTO Customers
VALUES(1001, 'Bill', 'Withers', '8423 Canterbury Street', 'Rowlett', 'TX', '75088', '(105) 491-5026'),
      (1002, 'Jon', 'Jones', '336 Bald Hill Court', 'Sterling Heights', 'MI', '48313', '(238) 106-5227'),
      (1003, 'Quincy', 'Jones', '9991 W. Ohio Circle', 'Port Huron', 'MI', '48060', '(655) 357-8845'),
      (1004, 'Jane', 'Doe', '948 W. Henry Smith Circle', 'Hoboken', 'NJ', '07030', '(854) 197-6608'),
      (1005, 'John', 'Appleseed', '42 Cleveland Street', 'Tallahassee', 'FL', '32303', '(206) 306-1456'),
      (1006, 'Lewell', 'Carter', '9692 West Street', 'Zeeland', 'MI', '49464', '(556) 206-5967'),
      (1007, 'Bill', 'Kreugman', '67 Myrtle Street', 'Redondo Beach', 'CA', '90278', '(313) 776-5922'),
      (1008, 'Lou', 'Chestnut', '55 Oak Valley Drive', 'Bay Shore', 'NY', '11706', '(212) 579-0337'),
      (1009, 'Ahmed', 'Abdur-Rahman', '64 Grant Dr.', 'Grand Rapids', 'MI', '49503', '(204) 296-0643'),
      (1010, 'Gordon', 'Freeman', '774 Front Drive', 'Palm Harbor', 'FL', '34683', '(213), 706-5880');


SELECT *
FROM Customers;


CREATE VIEW Collaborator AS
SELECT CustomerID AS CollaboratorID,
FROM Customers;

DESCRIBE Collaborator;


SELECT *
FROM Collaborator
LIMIT 5;

