USE LibraryDb;
GO

INSERT INTO Author
([Name])
VALUES
('Astrid Lindgren'),
('Selma Lagerlöf'),
('August Strindberg');


INSERT INTO AuthorExtraDetails
(AuthorID, BirthYear, Country)
VALUES
(1,1907,'Sverige'),
(2,1858,'Sverige');

INSERT INTO Genres
(GenresName)
VALUES
('Barnbok'),
('Roman'),
('Drama');

INSERT INTO Book
(Title, ISBN, GenresID)
VALUES
('Äventyret i skogen', 'TEST-001', 1),
('Staden vid havet', 'TEST-002', 2),
('Den sista akten', 'TEST-003', 3);


INSERT INTO Book_Author
(BookID, AuthorID)
VALUES
(1,1),
(1,2),
(2,2),
(3,3);

INSERT INTO SerialNumber
(NumberID, BookID)
VALUES
('EX-001', 1),
('EX-002', 1),
('EX-003', 2),
('EX-004', 3);

INSERT INTO [Member]
(FirstName, LastName, Email, RegistrationDate)
VALUES
('Anna', 'Andersson', 'anna@example.com', '2026-10-01'),
('Erik', 'Svensson', 'erik@example.com', '2026-10-05'),
('Sara', 'Lind', 'sara@example.com', '2026-10-10');

INSERT INTO Loan
(LoanDate, [ExpireDate], ReturnDate, MemberID, NumberID)
VALUES
('2026-10-12', '2026-10-26', '2026-10-24', 1, 'EX-001'),
('2026-10-15', '2026-10-29', NULL, 2, 'EX-003'),
('2026-10-20', '2026-11-03', NULL, 1, 'EX-002');