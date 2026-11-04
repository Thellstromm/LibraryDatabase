USE LibraryDb;
GO

CREATE TABLE Author (
	AuthorID int IDENTITY(1,1) PRIMARY KEY,
	[Name] nvarchar(50) NOT NULL
	);

CREATE TABLE AuthorExtraDetails (
	AuthorID int PRIMARY KEY,
	BirthYear int NULL,
	Country nvarchar(50) NULL,
	CONSTRAINT FK_AuthorExtraDetails_Author FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
	);

CREATE TABLE Genres (
	GenresID int IDENTITY(1,1) PRIMARY KEY,
	GenresName nvarchar(50) NOT NULL
	);

CREATE TABLE Book (
	BookID int IDENTITY(1,1) PRIMARY KEY,
	Title nvarchar(50) NOT NULL,
	ISBN nvarchar(50) NOT NULL UNIQUE,
	GenresID int NOT NULL,
	CONSTRAINT FK_Book_Genres FOREIGN KEY (GenresID) REFERENCES Genres(GenresID)
	);

CREATE TABLE Book_Author (
	BookID int,
	AuthorID int,
	PRIMARY KEY(BookID, AuthorID),
	CONSTRAINT FK_Book_Author_Book FOREIGN KEY (BookID) REFERENCES Book(BookID),
	CONSTRAINT FK_Book_Author_Author FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
	);

CREATE TABLE SerialNumber (
	NumberID nvarchar(50) PRIMARY KEY,
	BookID int NOT NULL,
	CONSTRAINT FK_SerialNumber_Book FOREIGN KEY (BookID) REFERENCES Book(BookID)
	);

CREATE TABLE [Member] (
	MemberID int IDENTITY(1,1) PRIMARY KEY,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	Email nvarchar(50) NOT NULL UNIQUE,
	RegistrationDate date NOT NULL
	);

CREATE TABLE Loan (
	LoanID int IDENTITY(1,1) PRIMARY KEY,
	LoanDate date NOT NULL,
	[ExpireDate] date NOT NULL,
	ReturnDate date NULL,
	MemberID int NOT NULL,
	NumberID nvarchar(50) NOT NULL,
	CONSTRAINT FK_Loan_Member FOREIGN KEY (MemberID) REFERENCES [Member](MemberID),
	CONSTRAINT FK_Loan_SerialNumber FOREIGN KEY (NumberID) REFERENCES SerialNumber(NumberID)
	);