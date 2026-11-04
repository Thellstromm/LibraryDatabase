USE LibraryDb;
GO

-- 1. Show all loans.
SELECT *
FROM Loan;

-- 2. Show books and their genres.
SELECT Title, GenresName
FROM Book AS b
INNER JOIN Genres AS g
ON b.GenresID = g.GenresID;

-- 3. Show books and their authors.
SELECT Title, [Name]
FROM Book AS b
INNER JOIN Book_Author AS ba
ON b.BookID = ba.BookID
INNER JOIN Author AS a
ON a.AuthorID = ba.AuthorID;

-- 4. Show members who have at least two registered loans.
SELECT m.MemberID, m.FirstName, m.LastName, COUNT(l.MemberID) AS LoanCount
FROM [Member] AS m
LEFT JOIN Loan AS l
ON m.MemberID = l.MemberID
GROUP BY m.MemberID, m.FirstName, m.LastName
HAVING COUNT(l.MemberID) >= 2;

-- 5. Show loans that have not yet been returned,
--    including the member, book title, and serial number.
SELECT m.FirstName, m.LastName, b.Title, sn.NumberID, l.[ExpireDate]
FROM Loan AS l
INNER JOIN [Member] AS m
ON l.MemberID = m.MemberID
INNER JOIN SerialNumber AS sn
ON l.NumberID = sn.NumberID
INNER JOIN Book AS b
ON b.BookID = sn.BookID
WHERE l.ReturnDate IS NULL;