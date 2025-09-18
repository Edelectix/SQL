CREATE DATABASE [Digital Library];
USE [Digital Library];

CREATE TABLE Author (
    AuthorID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Birthday DATE,
    Country VARCHAR(20),
    CHECK (Country IN ('USA', 'Spain', 'UK', 'Canada', 'Japan', 'Sweden', 'China'))
);

CREATE TABLE Book (
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    AuthorID INT,
    Title VARCHAR(100) NOT NULL,
    Gender VARCHAR(20),
    Fecha_Publicacion DATE,
    Stock INT,
    CHECK (Gender IN ('Fiction','Science','Fantasy','Romance','Thriller','Comedy')),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    UserName VARCHAR(40),
    Email VARCHAR(50),
    Phone VARCHAR(20),
    Birthday DATE,
    Country VARCHAR(20),
    CHECK (Country IN ('USA', 'Spain', 'Portugal', 'Germany', 'Italy', 'Russia', 'France', 'Mexico'))
);

CREATE TABLE Loan (
    LoanID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    BookID INT,
    LoanDate DATE,
    ReturnDate DATE,
    Returned BIT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    CHECK (Returned IN (0,1))
);