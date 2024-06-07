/* coding challenge 3*/

CREATE DATABASE carrental;
USE carrental;

CREATE TABLE Vehicle (
    vehicleID INT PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    dailyRate DECIMAL(10, 2),
    status INT CHECK (status IN (1, 0)),
    passengerCapacity INT,
    engineCapacity INT
);



CREATE TABLE Customer (
    customerID INT PRIMARY KEY,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    email VARCHAR(255),
    phoneNumber VARCHAR(20)
);


CREATE TABLE Lease (
    leaseID INT PRIMARY KEY,
    vehicleID INT,
    customerID INT,
    startDate DATE,
    endDate DATE,
    type VARCHAR(20),
    FOREIGN KEY (vehicleID) REFERENCES Vehicle(vehicleID),
    FOREIGN KEY (customerID) REFERENCES Customer(customerID)
);

CREATE TABLE Payment (
    paymentID INT PRIMARY KEY,
    leaseID INT,
    paymentDate DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (leaseID) REFERENCES Lease(leaseID)
);

INSERT INTO Vehicle VALUES
	(1,'Toyota','Camry',2022,50.00,'1',4,1450),
    (2,'Honda','Civic',2023,45.00,'1',7,1500),
    (3,'Ford','Focus',2022,48.00,'0',4,1400),
    (4,'Nissan','Altima',2023,52.00,'1',7,1200),
    (5,'Cheverlet','Malibu',2022,47.00,'1',4,1800),
    (6,'Hyundai','Sonata',2023,49.00,'0',7,1400),
    (7,'BMW','3 Series',2023,60.00,'1',7,2499),
    (8,'Mercedes','C-Class',2022,58.00,'1',8,2599),
    (9,'Audi','A4',2022,55.00,'0',4,2500),
    (10,'Lexus','ES',2023,54.00,'1',4,2500);
    
INSERT INTO Customer(customerid,firstname,lastname,phonenumber) VALUES
	(1,'John','Doe','555-555-5555'),
	(2,'Jane','smith','555-123-4567'),
    (3,'Robert','Johnson','555-789-1234'),
    (4,'Sarah','Brown','555-456-7890'),
    (5,'David','Lee','555-787-6543'),
    (6,'Laura','hall','555-234-5678'),
    (7,'micheal','davis','555-876-5432'),
    (8,'emma','wilson','555-423-1098'),
    (9,'william','taylor','555-321-6547'),
    (10,'olivia','adams','555-765-4321');
UPDATE customer SET email = CONCAT(firstname,lastname,'@example.com');

INSERT INTO Lease VALUES
(1,1,1,'2023-01-01','2023-01-05','daily'),
(2,2,2,'2023-02-15','2023-02-28','monthly'),
(3,3,3,'2023-03-10','2023-03-15','daily'),
(4,4,4,'2023-04-20','2023-04-30','monthly'),
(5,5,5,'2023-05-05','2023-05-10','daily'),
(6,4,3,'2023-06-15','2023-06-30','monthly'),
(7,7,7,'2023-07-01','2023-07-10','daily'),
(8,8,8,'2023-08-12','2023-08-15','monthly'),
(9,3,3,'2023-09-07','2023-09-10','daily'),
(10,10,10,'2023-10-10','2023-10-31','monthly');

INSERT INTO Payment VALUES
	(1,1,'2023-01-03',200),
    (2,2,'2023-02-03',1000),
    (3,3,'2023-03-03',75),
    (4,4,'2023-04-03',900),
    (5,5,'2023-05-03',60),
    (6,6,'2023-06-03',1200),
    (7,7,'2023-07-03',40),
    (8,8,'2023-08-03',1100),
    (9,9,'2023-09-03',80),
    (10,10,'2023-10-03',1500);

    


/*1 task*/
UPDATE Vehicle
SET dailyRate = 68
WHERE make = 'Mercedes';




/*2 task*/
DELETE FROM Payment WHERE leaseID IN (SELECT leaseID FROM Lease WHERE customerID=1);
DELETE FROM Lease WHERE customerID = 1;
DELETE FROM Customer WHERE customerID = 1;




/*3 task*/
EXEC sp_rename 'Payment.paymentDate', 'transactionDate', 'COLUMN';



/*4 task*/
SELECT *
FROM Customer
WHERE email = 'janesmith@example.com';

/*5 task*/
SELECT * 
FROM Lease
WHERE customerID = (SELECT customerID FROM Customer WHERE firstName = 'Jane' AND lastName = 'smith');


/*6 task*/
SELECT * FROM Payment
WHERE leaseID IN (SELECT leaseID FROM Lease 
WHERE customerID = (SELECT customerID FROM Customer WHERE phoneNumber = '555-456-7890'));



/*7 task*/
SELECT AVG(dailyRate) AS averageDailyRate
FROM Vehicle
WHERE status = 1;



/*8 task*/
SELECT TOP 1 *
FROM Vehicle
ORDER BY dailyRate DESC;



/*9 task*/
SELECT *FROM Vehicle
WHERE vehicleID IN (SELECT vehicleID FROM Lease WHERE customerID = 
(SELECT customerID FROM Customer WHERE firstName = 'Jane' AND lastName = 'smith'));



/*10 task*/
SELECT TOP 1 * FROM Lease
ORDER BY startDate DESC;


/*11 task*/
SELECT * FROM Payment
WHERE YEAR(transactionDate) = 2023;



/*12 task*/
SELECT * FROM Customer
WHERE customerID NOT IN (SELECT DISTINCT customerID FROM Payment);



/*13 task*/
SELECT V.*, SUM(P.amount) AS totalPayments
FROM Vehicle V
LEFT JOIN Lease L ON V.vehicleID = L.vehicleID
LEFT JOIN Payment P ON L.leaseID = P.leaseID
GROUP BY V.vehicleID, V.make, V.model, V.year, V.dailyRate, V.status, V.passengerCapacity, V.engineCapacity;

/*14 task*/
SELECT C.*, SUM(P.amount) AS totalPayments
FROM Customer C
LEFT JOIN Lease L ON C.customerID = L.customerID
LEFT JOIN Payment P ON L.leaseID = P.leaseID
GROUP BY C.customerID, C.firstName, C.lastName, C.email, C.phoneNumber;


/*15 task*/
SELECT L.*, V.*
FROM Lease L
LEFT JOIN Vehicle V ON L.vehicleID = V.vehicleID;

/*16 task*/
SELECT L.*, C.*, V.*
FROM Lease L
JOIN Customer C ON L.customerID = C.customerID
JOIN Vehicle V ON L.vehicleID = V.vehicleID;

/*17 task*/
SELECT TOP 1 C.*, SUM(P.amount) AS totalPayments
FROM Customer C
LEFT JOIN Lease L ON C.customerID = L.customerID
LEFT JOIN Payment P ON L.leaseID = P.leaseID
GROUP BY C.customerID, C.firstName, C.lastName, C.email, C.phoneNumber
ORDER BY totalPayments DESC;



/*18 task*/
SELECT V.*, L.*, C.*
FROM Vehicle V
LEFT JOIN Lease L ON V.vehicleID = L.vehicleID
LEFT JOIN Customer C ON L.customerID = C.customerID;


    

