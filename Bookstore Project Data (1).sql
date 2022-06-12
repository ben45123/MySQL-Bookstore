#Create and use the correct database
CREATE DATABASE HanimTjiaStage4;
USE HanimTjiaStage4;

#Creates the store table and fill it with values
CREATE TABLE Store(
	StoreNo VARCHAR(10) PRIMARY KEY NOT NULL,
    PhoneNo CHAR(10),
    Street VARCHAR(50),
    City VARCHAR(25),
    State CHAR(2),
    ZipCode VARCHAR(5)
	);
    
INSERT INTO Store VALUES('1', '1111111111', 'Union Turnpike', 'Jamaica', 'NY', '11439');
INSERT INTO Store VALUES('2', '1111111112', 'Grand Ave', 'Elmhurst', 'NY', '11373');
INSERT INTO Store VALUES('3', '1111111113', 'West Blvd', 'Houston', 'TX', '11238');
INSERT INTO Store VALUES('4', '1111111114', '87 ST', 'Honolulu', 'HI', '81921');
INSERT INTO Store VALUES('5', '1111111115', 'Beverly Ave', 'Austin', 'TX', '81321');
INSERT INTO Store VALUES('6', '1111111116', '51 ST', 'Forest Hills', 'NY', '12394');
INSERT INTO Store VALUES('7', '1111111117', 'Ontario Blvd', 'Boston', 'MD', '36471');
INSERT INTO Store VALUES('8', '1111111118', 'Kilimanjaro Ave', 'Raleigh', 'MI', '62718');
INSERT INTO Store VALUES('9', '1111111119', 'East Ave', 'Phoenix', 'AZ', '38193');
INSERT INTO Store VALUES('10', '1111111120', 'Indigo Blvd', 'Charlotte', 'NC', '49281');

#Author table
CREATE TABLE Author(
	ID CHAR(10) PRIMARY KEY NOT NULL,
    LName VARCHAR(25),
    FName VARCHAR(25),
    DOB DATE
	);

INSERT INTO Author VALUES('0000000000', 'Collins', 'Suzanne', '1962-08-10');
INSERT INTO Author VALUES('1111111111', 'King', 'Stephen', '1947-09-21');
INSERT INTO Author VALUES('2222222222', 'Straub', 'Peter', '1943-02-02');
INSERT INTO Author VALUES('3333333333', 'Rowling', 'J.K.', '1965-07-31');
INSERT INTO Author VALUES('4444444444', 'Tolkien', 'J.R.R.', '1892-01-03');
INSERT INTO Author VALUES('5555555555', 'Dashner', 'James', '1972-11-26');
INSERT INTO Author VALUES('6666666666', 'Riordan', 'Rick', '1964-06-05');
INSERT INTO Author VALUES('7777777777', 'DuPrau', 'Jeanne', '1944-06-09');
INSERT INTO Author VALUES('8888888888', 'Ellis', 'Deborah', '1960-08-07');
INSERT INTO Author VALUES('9999999999', 'Golding', 'William', '1911-09-19');

#Genre author worked in
CREATE TABLE AuthorGenre(
	Type VARCHAR(25) NOT NULL,
    AuthorID CHAR(10) NOT NULL,
    PRIMARY KEY(Type, AuthorID),
    FOREIGN KEY(AuthorID) REFERENCES Author(ID)
	);
    
INSERT INTO AuthorGenre VALUES('Science fiction', '0000000000');
INSERT INTO AuthorGenre VALUES('Dark fantasy', '1111111111');
INSERT INTO AuthorGenre VALUES('Dark fantasy', '2222222222');
INSERT INTO AuthorGenre VALUES('Fantasy', '3333333333');
INSERT INTO AuthorGenre VALUES('High fantasy', '4444444444');
INSERT INTO AuthorGenre VALUES('Novel', '5555555555');
INSERT INTO AuthorGenre VALUES('Mythology', '6666666666');
INSERT INTO AuthorGenre VALUES('Science fiction', '7777777777');
INSERT INTO AuthorGenre VALUES('Children literature', '8888888888');
INSERT INTO AuthorGenre VALUES('Psychological fiction', '9999999999');

#Book table
CREATE TABLE Book(
	ISBN CHAR(13) PRIMARY KEY NOT NULL,
    Title VARCHAR(50),
    Publisher VARCHAR(50),
    PublicationDate DATE,
    OriginalPrice DECIMAL(5, 2)
	);
    
INSERT INTO Book VALUES('9780439023528', 'The Hunger Games', 'Scholastic, Inc.', '2011-12-08', 12.99);
INSERT INTO Book VALUES('9780545586177', 'Catching Fire', 'Scholastic, Inc.', '2013-06-04', 12.99);
INSERT INTO Book VALUES('9781501192272', 'The Talisman: A Novel', 'Gallery Books', '2018-04-17', 19.99);
INSERT INTO Book VALUES('9780590353403', "Harry Potter and the Sorcerer's Stone", 'Scholastic, Inc.', '1998-09-01', 26.99);
INSERT INTO Book VALUES('9780618640157', 'The Lord of The Rings', 'HarperCollins Publishers', '2005-10-12', 24.99);
INSERT INTO Book VALUES('9780385737951', 'The Maze Runner', "Random House Children's Books", '2010-08-24', 10.99);
INSERT INTO Book VALUES('9780786838653', 'The Lightning Thief', 'Disney Press', '2006-04-01', 7.99);
INSERT INTO Book VALUES('9780385371353', 'The City of Ember', "Random House Children's Books", '2013-05-14', 9.99);
INSERT INTO Book VALUES('9781554987658', 'The Breadwinner', 'Groundwood Books', '2015-05-12', 10.99);
INSERT INTO Book VALUES('9780399501487', 'Lord of the Flies', 'Penguin Publishing Group', '2003-12-16', 11.00);
    
#Genre of the book
CREATE TABLE BookGenre(
	Type VARCHAR(25) NOT NULL,
    BookISBN CHAR(13) NOT NULL,
    PRIMARY KEY(Type, BookISBN),
    FOREIGN KEY(BookISBN) REFERENCES Book(ISBN)
	);
    
INSERT INTO BookGenre VALUES('Science fiction', '9780439023528');
INSERT INTO BookGenre VALUES('Science fiction', '9780545586177');
INSERT INTO BookGenre VALUES('Dark fantasy', '9781501192272');
INSERT INTO BookGenre VALUES('Fantasy', '9780590353403');
INSERT INTO BookGenre VALUES('High fantasy', '9780618640157');
INSERT INTO BookGenre VALUES('Novel', '9780385737951');
INSERT INTO BookGenre VALUES('Mythology', '9780786838653');
INSERT INTO BookGenre VALUES('Science fiction', '9780385371353');
INSERT INTO BookGenre VALUES('Children literature', '9781554987658');
INSERT INTO BookGenre VALUES('Psychological fiction', '9780399501487');
    
#Relationship between books and authors
CREATE TABLE BooksAuthors(
	AuthorID CHAR(10) NOT NULL,
    BookISBN CHAR(13) NOT NULL,
    PRIMARY KEY(AuthorID, BookISBN),
    FOREIGN KEY(AuthorID) REFERENCES Author(ID),
    FOREIGN KEY(BookISBN) REFERENCES Book(ISBN)
	);
    
INSERT INTO BooksAuthors VALUES('0000000000', '9780439023528');
INSERT INTO BooksAuthors VALUES('0000000000', '9780545586177');
INSERT INTO BooksAuthors VALUES('1111111111', '9781501192272');
INSERT INTO BooksAuthors VALUES('2222222222', '9781501192272');
INSERT INTO BooksAuthors VALUES('3333333333', '9780590353403');
INSERT INTO BooksAuthors VALUES('4444444444', '9780618640157');
INSERT INTO BooksAuthors VALUES('5555555555', '9780385737951');
INSERT INTO BooksAuthors VALUES('6666666666', '9780786838653');
INSERT INTO BooksAuthors VALUES('7777777777', '9780385371353');
INSERT INTO BooksAuthors VALUES('8888888888', '9781554987658');
INSERT INTO BooksAuthors VALUES('9999999999', '9780399501487');

#Store orders books
CREATE TABLE BooksOrdered(
    BookISBN CHAR(13) NOT NULL,
    StoreNo VARCHAR(10) NOT NULL,
    Date DATE NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY(BookISBN, StoreNo, Date),
    FOREIGN KEY(BookISBN) REFERENCES Book(ISBN),
    FOREIGN KEY(StoreNo) REFERENCES Store(StoreNo)
	);
    
INSERT INTO BooksOrdered VALUES('9780439023528', '1', '2020-03-10', 20);
INSERT INTO BooksOrdered VALUES('9781501192272', '4', '2021-06-23', 10);
INSERT INTO BooksOrdered VALUES('9780545586177', '6', '2021-02-01', 21);
INSERT INTO BooksOrdered VALUES('9781501192272', '8', '2020-01-09', 13);
INSERT INTO BooksOrdered VALUES('9780590353403', '1', '2018-06-24', 9);
INSERT INTO BooksOrdered VALUES('9780618640157', '2', '2022-11-17', 31);
INSERT INTO BooksOrdered VALUES('9780385737951', '9', '2020-11-10', 39);
INSERT INTO BooksOrdered VALUES('9780786838653', '10', '2019-12-21', 7);
INSERT INTO BooksOrdered VALUES('9780385371353', '7', '2019-08-16', 4);
INSERT INTO BooksOrdered VALUES('9781554987658', '5', '2021-03-09', 50);
INSERT INTO BooksOrdered VALUES('9780399501487', '3', '2022-03-03', 25);
    
#Sales for books
CREATE TABLE BookOnSale(
	BookISBN CHAR(13) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Discount DECIMAL(3, 2) NOT NULL,
    PRIMARY KEY(BookISBN, StartDate, EndDate),
    FOREIGN KEY(BookISBN) REFERENCES Book(ISBN)
	);
    
INSERT INTO BookOnSale VALUES('9780385737951', '2020-11-01', '2020-11-10', 0.90);
INSERT INTO BookOnSale VALUES('9780786838653', '2019-03-10', '2019-03-21', 0.75);
INSERT INTO BookOnSale VALUES('9780786838653', '2019-05-03', '2019-05-16', 0.50);
INSERT INTO BookOnSale VALUES('9781554987658', '2021-02-23', '2021-03-09', 0.50);
INSERT INTO BookOnSale VALUES('9780399501487', '2022-02-23', '2022-03-03', 0.89);
    
#Cafe stuff
CREATE TABLE CafeItem(
	Identifier CHAR(10) PRIMARY KEY NOT NULL,
    Name VARCHAR(25),
    Category VARCHAR(25),
    OriginalPrice DECIMAL(5, 2)
	);
    
INSERT INTO CafeItem VALUES('0183928381', 'Coffee', 'Beverage', 2.99);
INSERT INTO CafeItem VALUES('7391837183', 'Beer', 'Alcohol', 3.99);
INSERT INTO CafeItem VALUES('2819372638', 'Cookie', 'Snack', 1.99);
INSERT INTO CafeItem VALUES('5938173927', 'Smoothie', 'Beverage', 2.99);
INSERT INTO CafeItem VALUES('3019826739', 'Sandwich', 'Snack', 4.99);
    
#Store orders cafe stuff
CREATE TABLE CafeItemsOrdered(
	CafeID CHAR(10) NOT NULL,
    StoreNo VARCHAR(10) NOT NULL,
    Date DATE NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY(CafeID, StoreNo, Date),
    FOREIGN KEY(CafeID) REFERENCES CafeItem(Identifier),
    FOREIGN KEY(StoreNo) REFERENCES Store(StoreNo)
	);
    
INSERT INTO CafeItemsOrdered VALUES('0183928381', '3', '2019-10-09', 20);
INSERT INTO CafeItemsOrdered VALUES('7391837183', '2', '2019-04-11', 32);
INSERT INTO CafeItemsOrdered VALUES('2819372638', '3', '2019-11-23', 19);
INSERT INTO CafeItemsOrdered VALUES('5938173927', '10', '2019-08-12', 23);
INSERT INTO CafeItemsOrdered VALUES('3019826739', '8', '2019-10-09', 40);

#Sales for cafe items
CREATE TABLE CafeItemOnSale(
	CafeID CHAR(10) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Discount DECIMAL(3, 2) NOT NULL,
    PRIMARY KEY(CafeID, StartDate, EndDate),
    FOREIGN KEY(CafeID) REFERENCES CafeItem(Identifier)
	);
    
INSERT INTO CafeItemOnSale VALUES('0183928381', '2019-05-12', '2019-05-24', 0.90);
INSERT INTO CafeItemOnSale VALUES('5938173927', '2019-10-09', '2019-10-25', 0.90);
INSERT INTO CafeItemOnSale VALUES('3019826739', '2018-03-10', '2018-04-01', 0.95);
    
#Books available
CREATE TABLE BookInStore(
	BookISBN CHAR(13) NOT NULL,
    StoreNo VARCHAR(10) NOT NULL, 
    NumberOfBooks INT NOT NULL,
    PRIMARY KEY(BookISBN, StoreNo),
    FOREIGN KEY(BookISBN) REFERENCES Book(ISBN),
    FOREIGN KEY(StoreNo) REFERENCES Store(StoreNo)
	);
    
INSERT INTO BookInStore VALUES('9780439023528', '1', 20);
INSERT INTO BookInStore VALUES('9781501192272', '4', 10);
INSERT INTO BookInStore VALUES('9780545586177', '6', 21);
INSERT INTO BookInStore VALUES('9781501192272', '8', 13);
INSERT INTO BookInStore VALUES('9780590353403', '1', 9);
INSERT INTO BookInStore VALUES('9780618640157', '2', 31);
INSERT INTO BookInStore VALUES('9780385737951', '9', 39);
INSERT INTO BookInStore VALUES('9780786838653', '10', 7);
INSERT INTO BookInStore VALUES('9780385371353', '7', 0);
INSERT INTO BookInStore VALUES('9781554987658', '5', 50);
INSERT INTO BookInStore VALUES('9780399501487', '3', 25);
    
#Cafe item available
CREATE TABLE CafeItemInStore(
	CafeID CHAR(10) NOT NULL,
    StoreNo VARCHAR(10) NOT NULL, 
    NumberOfitem INT NOT NULL,
    PRIMARY KEY(CafeID, StoreNo),
    FOREIGN KEY(CafeID) REFERENCES CafeItem(Identifier),
    FOREIGN KEY(StoreNo) REFERENCES Store(StoreNo)
	);
    
INSERT INTO CafeItemInStore VALUES('0183928381', '3', 20);
INSERT INTO CafeItemInStore VALUES('7391837183', '2', 32);
INSERT INTO CafeItemInStore VALUES('2819372638', '3', 19);
INSERT INTO CafeItemInStore VALUES('5938173927', '10', 23);
INSERT INTO CafeItemInStore VALUES('3019826739', '8', 40);

#Employee Table
CREATE TABLE Employee(
	SSN CHAR(11) PRIMARY KEY NOT NULL,
    FName VARCHAR(10), 
    LName VARCHAR(10), 
    ZipCode CHAR(5),
	Street VARCHAR(30),
    City VARCHAR(20),
    State VARCHAR(20),
    StoreId VARCHAR(10) NOT NULL,
    FOREIGN KEY(StoreId) REFERENCES Store(StoreNo)
    );
    
INSERT INTO Employee VALUES("123-45-6789", "Bob", "Builder", "73912", "12 Robert Street", "Forest Hills", "New York", "1");
INSERT INTO Employee VALUES("321-54-9876", "John", "Wall", "93362", "81 Kobe Road", "Los Angeles", "California", "10");
INSERT INTO Employee VALUES("987-12-3456", "Bryan", "Hendersen", "41623", "99 Crowder Lane", "Salt Lake City", "Utah", "1");
INSERT INTO Employee VALUES("789-56-1234", "Jenna", "Covington", "83126", "39 Howard Street", "Orlando", "Florida", "2");
INSERT INTO Employee VALUES("567-98-4321", "Brianna", "Jennings", "14438", "45 Exiter Street", "Houston", "Texas", "5");
INSERT INTO Employee VALUES("323-31-9472", "Alison", "May", "11512", "52 Serpintine Lane", "Albertson", "New York", "3");
INSERT INTO Employee VALUES("740-45-0713", "Madison", "O'Neal", "29132", "3 Newman Road", "Detroit", "Illinois", "6");

#Employee Phone Number Table
CREATE TABLE EmployeePhoneNumber(
	EmpSSN CHAR(11) NOT NULL,
    PhoneNumber CHAR(12) NOT NULL, 
    PRIMARY KEY(EmpSSN, PhoneNumber),
    FOREIGN KEY(EmpSSN) REFERENCES Employee(SSN)
    );
    
INSERT INTO EmployeePhoneNumber VALUES("987-12-3456", "917-142-1173");
INSERT INTO EmployeePhoneNumber VALUES("740-45-0713", "516-323-2468");
INSERT INTO EmployeePhoneNumber VALUES("567-98-4321", "646-389-5326");
INSERT INTO EmployeePhoneNumber VALUES("567-98-4321", "917-247-4464");
INSERT INTO EmployeePhoneNumber VALUES("123-45-6789", "516-804-9327");

#Employee Works At Store Table
CREATE TABLE EmpWorksAtStore(
	EmpSSN CHAR(11) NOT NULL,
    StoreNumber VARCHAR(10) NOT NULL,
    PositionTitle VARCHAR(25),
    FOREIGN KEY(EmpSSN) REFERENCES Employee(SSN),
    FOREIGN KEY(StoreNumber) REFERENCES Store(StoreNo),
	PRIMARY KEY(EmpSSN, StoreNumber, PositionTitle)
    );

INSERT INTO EmpWorksAtStore VALUES("987-12-3456", "2", "Bookstore Manager");
INSERT INTO EmpWorksAtStore VALUES("567-98-4321", "1", "Bookstore Sales Person");
INSERT INTO EmpWorksAtStore VALUES("740-45-0713", "6", "Bookstore Attendant");
INSERT INTO EmpWorksAtStore VALUES("123-45-6789", "4", "CafeManager");
INSERT INTO EmpWorksAtStore VALUES("323-31-9472", "5", "Cafe Sales Person");

#Employee Shift Table
CREATE TABLE Shift(
	ShiftId CHAR(10) PRIMARY KEY NOT NULL,
    DateStartTime DateTime,
    DateEndtime DateTime
    );

INSERT INTO Shift VALUES("0013040201", "2022-04-12 9:00:00", "2022-04-12 17:00:00");
INSERT INTO Shift VALUES("0030874011", "2022-04-13 9:00:00", "2022-04-13 17:00:00");
INSERT INTO Shift VALUES("0090164924", "2022-04-14 9:00:00", "2022-04-14 17:00:00");
INSERT INTO Shift VALUES("0124790753", "2022-04-15 8:00:00", "2022-04-15 16:00:00");
INSERT INTO Shift VALUES("1047587597", "2022-04-15 9:00:00", "2022-04-15 17:00:00");

#Employee Scheduled For Table
CREATE TABLE ScheduledFor(
    EmpSSN CHAR(11) NOT NULL,
    ShiftId CHAR(10) NOT NULL,
    PRIMARY KEY(EmpSSN, ShiftID),
    FOREIGN KEY(EmpSSN) REFERENCES Employee(SSN),
    FOREIGN KEY(ShiftId) REFERENCES Shift(ShiftId));
    
INSERT INTO ScheduledFor VALUES("987-12-3456", "0013040201");
INSERT INTO ScheduledFor VALUES("740-45-0713", "0013040201");
INSERT INTO ScheduledFor VALUES("740-45-0713", "0090164924");
INSERT INTO ScheduledFor VALUES("567-98-4321", "0124790753");
INSERT INTO ScheduledFor VALUES("123-45-6789", "0090164924");
INSERT INTO ScheduledFor VALUES("123-45-6789", "0124790753");
INSERT INTO ScheduledFor VALUES("789-56-1234", "0124790753");
INSERT INTO ScheduledFor VALUES("789-56-1234", "1047587597");
INSERT INTO ScheduledFor VALUES("321-54-9876", "0030874011");

#Employee Unavailable For Table
CREATE TABLE UnavailableFor(
    EmpSSN CHAR(11) NOT NULL,
    ShiftId CHAR(10) NOT NULL,
    PRIMARY KEY(EmpSSN, ShiftID),
    FOREIGN KEY(EmpSSN) REFERENCES Employee(SSN),
    FOREIGN KEY(ShiftId) REFERENCES Shift(ShiftId)
    );
    
INSERT INTO UnavailableFor VALUES("987-12-3456", "0013040201");
INSERT INTO UnavailableFor VALUES("740-45-0713", "0090164924");
INSERT INTO UnavailableFor VALUES("789-56-1234", "0124790753");
INSERT INTO UnavailableFor VALUES("123-45-6789", "0124790753");
INSERT INTO UnavailableFor VALUES("321-54-9876", "0030874011");