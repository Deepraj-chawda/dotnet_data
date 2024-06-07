CREATE DATABASE VirtualArtGallery;

USE VirtualArtGallery;


-- Create Artist Table
CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Biography TEXT,
    BirthDate DATE,
    Nationality VARCHAR(50),
    Website VARCHAR(255),
    ContactInformation VARCHAR(255)
);


-- Create Artwork Table
CREATE TABLE Artwork (
    ArtworkID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(255),
    Description TEXT,
    CreationDate DATE,
    Medium VARCHAR(50),
    ImageURL VARCHAR(255),
	ArtistID INT,
	FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
);



-- Create User Table
CREATE TABLE "User"(
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(50),
    Password VARCHAR(50),
    Email VARCHAR(100),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    ProfilePicture VARCHAR(255)
);

-- Create Gallery Table
CREATE TABLE Gallery (
    GalleryID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100),
    Description TEXT,
    Location VARCHAR(255),
    Curator INT, -- Reference to ArtistID
    OpeningHours VARCHAR(100),
    FOREIGN KEY (Curator) REFERENCES Artist(ArtistID)
);

-- Create User_Favorite_Artwork Junction Table
CREATE TABLE User_Favorite_Artwork (
    UserID INT,
    ArtworkID INT,
    PRIMARY KEY (UserID, ArtworkID),
    FOREIGN KEY (UserID) REFERENCES "User"(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID) ON DELETE CASCADE
);

-- Create Artwork_Gallery Junction Table
CREATE TABLE Artwork_Gallery (
    ArtworkID INT,
    GalleryID INT,
    PRIMARY KEY (ArtworkID, GalleryID),
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID) ON DELETE CASCADE,
    FOREIGN KEY (GalleryID) REFERENCES Gallery(GalleryID) ON DELETE CASCADE
);
 


-- Insert data into Artist table
INSERT INTO Artist (Name, Biography, BirthDate, Nationality, Website, ContactInformation)
VALUES
    ('Vincent van Gogh', 'Dutch post-impressionist painter.', '1853-03-30', 'Dutch', 'http://www.vangoghgallery.com/', 'contact@vangogh.com'),
    ('Pablo Picasso', 'Spanish painter, sculptor, printmaker, ceramicist, and stage designer.', '1881-10-25', 'Spanish', 'http://www.picasso.fr/', 'contact@picasso.com'),
    ('Leonardo da Vinci', 'Italian polymath of the High Renaissance.', '1452-04-15', 'Italian', 'http://www.leonardodavinci.com/', 'contact@leonardo.com'),
    ('Frida Kahlo', 'Mexican painter known for her many portraits and self-portraits.', '1907-07-06', 'Mexican', 'http://www.fridakahlo.com/', 'contact@frida.com'),
    ('Claude Monet', 'French painter and a founder of French Impressionist painting.', '1840-11-14', 'French', 'http://www.monetgallery.com/', 'contact@monet.com');

-- Insert data into Artwork table
INSERT INTO Artwork (Title, Description, CreationDate, Medium, ImageURL, ArtistID)
VALUES
    ('Starry Night', 'A famous night sky painting.', '1889-06-01', 'Oil on canvas', 'http://www.starrynight.com/', 1),
    ('Guernica', 'A powerful anti-war painting.', '1937-04-26', 'Oil on canvas', 'http://www.guernica.com/', 2),
    ('Mona Lisa', 'Iconic portrait of Lisa Gherardini.', '1503-01-01', 'Oil on poplar panel', 'http://www.monalisa.com/', 3),
    ('The Two Fridas', 'Depicting two versions of the artist.', '1939-06-01', 'Oil on canvas', 'http://www.fridas.com/', 4),
    ('Water Lilies', 'Series of approximately 250 oil paintings.', '1914-01-01', 'Oil on canvas', 'http://www.monetwaterlilies.com/', 5);

-- Insert data into User table
INSERT INTO "User" (Username, Password, Email, FirstName, LastName, DateOfBirth, ProfilePicture)
VALUES
    ('artlover1', 'password123', 'artlover1@email.com', 'John', 'Doe', '1990-05-15', 'johndoe.jpg'),
    ('artistfan2', 'securepass456', 'fan2@email.com', 'Jane', 'Smith', '1985-09-20', 'janesmith.jpg'),
    ('galleryvisitor3', 'gallerypass789', 'visitor3@email.com', 'Robert', 'Johnson', '1978-12-10', 'robertjohnson.jpg'),
    ('artcollector4', 'collectorpass101', 'collector4@email.com', 'Emily', 'Williams', '1982-03-25', 'emilywilliams.jpg'),
    ('curator5', 'curatorpass202', 'curator5@email.com', 'Michael', 'Brown', '1975-08-05', 'michaelbrown.jpg');

-- Insert data into Gallery table
INSERT INTO Gallery (Name, Description, Location, Curator, OpeningHours)
VALUES
    ('Modern Art Museum', 'Showcasing contemporary artworks.', '123 Main Street, Cityville', 2, 'Tue-Sun, 10am-6pm'),
    ('Classic Art Gallery', 'Exhibiting timeless masterpieces.', '456 Oak Avenue, Townsville', 1, 'Mon-Sat, 9am-5pm'),
    ('Abstract Expressions', 'Focusing on abstract art forms.', '789 Pine Road, Artville', 4, 'Wed-Fri, 12pm-8pm'),
    ('Sculpture Haven', 'Dedicated to sculptural works.', '101 Elm Street, Sculpture City', 3, 'Thu-Sat, 11am-7pm'),
    ('Impressionist Delights', 'Celebrating the beauty of impressionism.', '234 Maple Lane, Impressville', 5, 'Sat-Sun, 1pm-9pm');

-- Insert data into User_Favorite_Artwork table
INSERT INTO User_Favorite_Artwork (UserID, ArtworkID)
VALUES
    (1, 1),
    (2, 3),
    (3, 5),
    (4, 2),
    (5, 4);

-- Insert data into Artwork_Gallery table
INSERT INTO Artwork_Gallery (ArtworkID, GalleryID)
VALUES
    (1, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5);

select * from Artist;
select * from Artwork;
select * from Artwork_Gallery;
select * from Gallery;
select * from "User";
select * from User_Favorite_Artwork;
