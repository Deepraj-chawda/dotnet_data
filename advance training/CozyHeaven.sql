CREATE DATABASE CozyHavenStay;
USE CozyHavenStay;

-- User Table
CREATE TABLE [User] (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    Gender NVARCHAR(10) NOT NULL,
    ContactNumber NVARCHAR(20) NOT NULL,
    Address NVARCHAR(255) NOT NULL,
    AccountType NVARCHAR(50) DEFAULT('Guest'),
    ProfileImage NVARCHAR(255)
);

-- Admin Table
CREATE TABLE Admin (
    AdminID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    AccountType NVARCHAR(50) DEFAULT('Admin')
);

-- HotelOwner Table
CREATE TABLE HotelOwner (
    OwnerID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    AccountType NVARCHAR(50) DEFAULT('Owner')
);

-- Hotel Table
CREATE TABLE Hotel (
    HotelID INT IDENTITY(1,1) PRIMARY KEY,
    OwnerID INT FOREIGN KEY REFERENCES HotelOwner(OwnerID) ON DELETE CASCADE,
    Name NVARCHAR(100) NOT NULL,
    Location NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX) NOT NULL,
    Amenities NVARCHAR(MAX) NOT NULL
);

-- HotelImage Table
CREATE TABLE HotelImage (
    ImageID INT IDENTITY(1,1) PRIMARY KEY,
    HotelID INT FOREIGN KEY REFERENCES Hotel(HotelID) ON DELETE CASCADE,
    ImageURL NVARCHAR(255)
);

-- Room Table
CREATE TABLE Room (
    RoomID INT IDENTITY(1,1) PRIMARY KEY,
    HotelID INT FOREIGN KEY REFERENCES Hotel(HotelID) ON DELETE CASCADE,
    RoomType NVARCHAR(50) NOT NULL,
    MaxOccupancy INT NOT NULL,
    BedType NVARCHAR(50) NOT NULL,
    BaseFare DECIMAL(10, 2) NOT NULL,
    RoomSize NVARCHAR(50) NOT NULL,
    ACStatus NVARCHAR(3) NOT NULL,
    CONSTRAINT CHK_AC_Status CHECK (ACStatus IN ('AC', 'Non-AC')),
);

-- RoomImage Table
CREATE TABLE RoomImage (
    ImageID INT IDENTITY(1,1) PRIMARY KEY,
    RoomID INT FOREIGN KEY REFERENCES Room(RoomID) ON DELETE CASCADE,
    ImageURL NVARCHAR(255)
);

-- Booking Table
CREATE TABLE Booking (
    BookingID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES [User](UserID) ON DELETE CASCADE,
    RoomID INT FOREIGN KEY REFERENCES Room(RoomID) ON DELETE CASCADE,
    NumberOfGuests INT NOT NULL,
    CheckInDate DATETIME NOT NULL,
    CheckOutDate DATETIME NOT NULL,
    TotalFare DECIMAL(10, 2) NOT NULL,
    Status NVARCHAR(20) NOT NULL,
    RefundAmount DECIMAL(10, 2)
);

-- Review Table
CREATE TABLE Review (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES [User](UserID),
    HotelID INT FOREIGN KEY REFERENCES Hotel(HotelID) ON DELETE CASCADE,
    Rating INT NOT NULL,
    Comments NVARCHAR(MAX) NOT NULL
);

-- Refund Table
CREATE TABLE Refund (
    RefundID INT IDENTITY(1,1) PRIMARY KEY,
    BookingID INT FOREIGN KEY REFERENCES Booking(BookingID) ON DELETE CASCADE,
    RefundAmount DECIMAL(10, 2) NOT NULL,
    Reason NVARCHAR(MAX),
    RefundDate DATETIME DEFAULT GETDATE(),
	RefundStatus NVARCHAR(100) DEFAULT ('In Progress')
);

-- Log Table
CREATE TABLE Log (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES [User](UserID),
    Action NVARCHAR(100),
    Timestamp DATETIME DEFAULT GETDATE()
);


-- Inserting data into User Table
INSERT INTO [User] (Name, Email, Password, Gender, ContactNumber, Address, AccountType, ProfileImage)
VALUES ('John Doe', 'john@example.com', 'password123', 'Male', '1234567890', '123 Main St, City', 'Guest', 'profile_image_url');

-- Inserting data into Admin Table
INSERT INTO Admin (Name, Email, Password, AccountType)
VALUES ('Admin Name', 'admin@example.com', 'admin_password', 'Admin');

-- Inserting data into HotelOwner Table
INSERT INTO HotelOwner (Name, Email, Password, AccountType)
VALUES ('Hotel Owner Name', 'owner@example.com', 'owner_password', 'Owner');

-- Inserting data into Hotel Table
INSERT INTO Hotel (OwnerID, Name, Location, Description, Amenities)
VALUES (1, 'Hotel ABC', '123 Street, City', 'A luxurious hotel', 'Pool, Gym, WiFi');

-- Inserting data into HotelImage Table
INSERT INTO HotelImage (HotelID, ImageURL)
VALUES (1, 'hotel_image_url');

-- Inserting data into Room Table
INSERT INTO Room (HotelID, RoomType, MaxOccupancy, BedType, BaseFare, RoomSize, ACStatus)
VALUES (1, 'Standard', 2, 'Queen', 100.00, '300 sq ft', 'AC');

-- Inserting data into RoomImage Table
INSERT INTO RoomImage (RoomID, ImageURL)
VALUES (1, 'room_image_url');

-- Inserting data into Booking Table
INSERT INTO Booking (UserID, RoomID, NumberOfGuests, CheckInDate, CheckOutDate, TotalFare, Status, RefundAmount)
VALUES (1, 1, 2, '2024-02-15', '2024-02-18', 300.00, 'Confirmed', NULL);

-- Inserting data into Review Table
INSERT INTO Review (UserID, HotelID, Rating, Comments)
VALUES (1, 1, 5, 'Great experience at this hotel!');

-- Inserting data into Refund Table
INSERT INTO Refund (BookingID, RefundAmount, Reason, RefundDate, RefundStatus)
VALUES (1, 50.00, 'Cancellation', GETDATE(), 'Processed');

-- Inserting data into Log Table
INSERT INTO Log (UserID, Action)
VALUES (1, 'User logged in');
