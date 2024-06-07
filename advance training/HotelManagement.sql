CREATE DATABASE  CozyHavenStay;

USE CozyHavenStay;

-- Create Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    Role NVARCHAR(50) NOT NULL,
    -- Add other personal details columns here
);

-- Create Hotels table
CREATE TABLE Hotels (
    HotelID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Location NVARCHAR(255) NOT NULL,
    Facilities NVARCHAR(500) NOT NULL
);

-- Create Rooms table
CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY IDENTITY(1,1),
    HotelID INT FOREIGN KEY REFERENCES Hotels(HotelID),
    RoomSize DECIMAL(10, 2) NOT NULL,
    BedType NVARCHAR(50) NOT NULL,
    MaximumOccupancy INT NOT NULL,
    BaseFare DECIMAL(10, 2) NOT NULL,
    AC BIT NOT NULL
);

-- Create Bookings table
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    RoomID INT FOREIGN KEY REFERENCES Rooms(RoomID),
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    NumberOfGuests INT NOT NULL,
    TotalFare DECIMAL(10, 2) NOT NULL,
    Status NVARCHAR(50) NOT NULL
);


-- Insert data into Users table
INSERT INTO Users (Username, Email, Password, Role)
VALUES ('john_doe', 'john@example.com', 'hashed_password_123', 'user'),
       ('jane_smith', 'jane@example.com', 'hashed_password_456', 'user'),
       ('hotel_owner1', 'owner1@example.com', 'hashed_password_owner1', 'hotel owner'),
       ('hotel_owner2', 'owner2@example.com', 'hashed_password_owner2', 'hotel owner'),
       ('admin', 'admin@example.com', 'hashed_password_admin', 'administrator');

-- Insert data into Hotels table
INSERT INTO Hotels (Name, Location, Facilities)
VALUES ('Cozy Inn', 'New York', 'Dining, Parking, Free Wi-Fi'),
       ('Seaside Resort', 'California', 'Dining, Parking, Free Wi-Fi, Room Service, Swimming Pool'),
       ('Mountain Lodge', 'Colorado', 'Dining, Parking, Free Wi-Fi, Room Service, Fitness Center');

-- Insert data into Rooms table
INSERT INTO Rooms (HotelID, RoomSize, BedType, MaximumOccupancy, BaseFare, AC)
VALUES (1, 30.0, 'Single Bed', 1, 50.00, 1),
       (1, 40.0, 'Double Bed', 2, 80.00, 1),
       (2, 50.0, 'King Size Bed', 4, 120.00, 1),
       (2, 60.0, 'King Size Bed', 6, 150.00, 1),
       (3, 35.0, 'Double Bed', 2, 70.00, 0),
       (3, 45.0, 'King Size Bed', 4, 100.00, 1);

-- Insert data into Bookings table
INSERT INTO Bookings (UserID, RoomID, CheckInDate, CheckOutDate, NumberOfGuests, TotalFare, Status)
VALUES (1, 1, '2024-02-15', '2024-02-18', 1, 150.00, 'Booked'),
       (2, 3, '2024-03-10', '2024-03-15', 2, 300.00, 'Booked'),
       (3, 5, '2024-04-05', '2024-04-10', 3, 450.00, 'Booked');


