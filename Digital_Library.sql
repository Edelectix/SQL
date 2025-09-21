CREATE DATABASE Digital_Library;
USE Digital_Library;

CREATE TABLE Author (
    AuthorID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Birthday DATE,
    Country VARCHAR(20),

    CONSTRAINT CK_Author_Country CHECK (Country IN ('USA', 'Spain', 'UK', 'Canada', 'Japan', 'Sweden', 'China'))
);

CREATE TABLE Book (
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    AuthorID INT,
    Title VARCHAR(100) NOT NULL,
    Gender VARCHAR(20),
    Fecha_Publicacion DATE,
    Stock VARCHAR(3),

    CONSTRAINT CK_Gender CHECK (Gender IN ('Fiction','Science','Fantasy','Romance','Thriller','Comedy')),
    CONSTRAINT CK_Stock CHECK (Stock IN ('Yes','No')),
);

CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    BookID INT,
    UserName VARCHAR(40),
    Email VARCHAR(50),
    Phone NUMBER,
    Birthday DATE,
    Country VARCHAR(20),

    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    CONSTRAINT CK_User_Country CHECK (Country IN ('USA', 'Spain', 'Portugal', 'Germany', 'Italy', 'Russia', 'France', 'Mexico'))
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
    CONSTRAINT CK_Returned CHECK (Returned IN (0,1))
);

------------------------------ DAY 2 ------------------------------

---ADDING DATA---

INSERT INTO AUTHOR (Name, Birthday, Country) VALUES
('J.K. Rowling', '1965-07-31', 'UK'),
('Cressida Cowell', '1966-06-15','UK'),
('Stephen King', '1947-09-21', 'USA'),
('George R.R. Martin', '1948-09-20', 'USA'),
('Miguel de Cervantes', '1547-09-29', 'Spain'),
('Oscar Wilde', '1854-10-16', 'Ireland'),
('Federico García Lorca', '1898-06-05', 'Spain');

INSERT INTO Book (AuthorID, Title, Gender, Fecha_Publicacion, Stock) VALUES
(1, 'Harry Potter and the Philosopher''s Stone', 'Fantasy', '1997-06-26', 'Yes'),
(1, 'Harry Potter and the Chamber of Secrets', 'Fantasy', '1998-07-02', 'Yes'),
(2, 'How to Train Your Dragon', 'Fantasy', '2003-04-01', 'Yes'),
(2, 'How to Train Your Dragon: The Book of Dragons', 'Fantasy', '2004-04-01', 'No'),
(3, 'The Shining', 'Horror', '1977-01-28', 'Yes'),
(3, 'It', 'Horror', '1986-09-15', 'No'),
(4, 'A Game of Thrones', 'Fantasy', '1996-08-06', 'No'),
(4, 'A Clash of Kings', 'Fantasy', '1998-11-16', 'Yes'),
(5, 'Don Quixote', 'Fiction', '1605-01-16', 'No'),
(6, 'The Picture of Dorian Gray', 'Fiction', '1890-06-20', 'Yes'),
(7, 'Blood Wedding', 'Drama', '1933-03-08', 'Yes');

INSERT INTO Users (BookID, UserName, Email, Phone, Birthday, Country) VALUES
(1, 'Pedro Garcia', 'pedrogarcia@gmail.com', 123456789, '2003-08-30', 'Spain'),
(2, 'Maria Lopez', 'marialopez@gmail.com', 987654321, '1995-05-15', 'Mexico'),
(3, 'Koseki Bijou', 'bijoukoseki@gmail.com', 456789123, '2000-12-01', 'Japan'),
(4, 'John Smith', 'johnsmith@gmail.com', 321654987, '1988-03-22', 'USA'),
(5, 'Anna Müller', 'Annamuller@gmail.com', 654321987, '1992-11-11', 'Germany'),
(6, 'Luca Rossi', 'lucarossi@gmail.com', 789123456, '1998-07-07', 'Italy'),
(7, 'Sofia Petrova', 'sofiapetrova@gmail.com', 147258369, '1990-09-09', 'Russia'),
(8, 'Emma Dubois', 'emmadubois@gmail.com', 369258147, '1993-04-04', 'France'),
(9, 'Carlos Silva', 'carlossilva@gmail.com', 258369147, '1985-02-28', 'Portugal'),
(10, 'Laura Martinez', 'lauramartinez@gmail.com', 159753486, '1996-06-06', 'Spain');

INSERT INTO Loan (UserID, BookID, LoanDate, ReturnDate, Returned) VALUES
(1, 3, '2020-09-05', '2020-09-20', 1),
(2, 1, '2008-03-15', '2008-03-30', 1),
(3, 5, '2021-01-10', '2021-01-25', 0),
(4, 2, '2019-07-22', '2019-08-06', 0),
(5, 7, '2022-11-11', '2022-11-26', 1),
(6, 4, '2023-05-01', '2023-05-16', 0),
(7, 6, '2018-12-12', '2018-12-27', 1),
(8, 8, '2021-06-30', '2021-07-15', 0),
(9, 10, '2017-04-20', '2017-05-05', 1),
(10, 9, '2022-02-14', '2022-03-01', 0);

