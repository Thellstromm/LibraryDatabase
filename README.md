# Library Database

A SQL Server database project for a small library.  
It contains tables for books, authors, genres, physical book copies, members, and loans.

This project was created as a learning project to practice database design, relationships, primary and foreign keys, and SQL queries.

## Technologies

- SQL Server
- SQL Server Management Studio (SSMS)
- draw.io for the ER diagram

## Database Structure

The database contains the following tables:

- `Author` — authors
- `AuthorExtraDetails` — optional extra information about authors
- `Genres` — book genres
- `Book` — books and their genre
- `Book_Author` — connection table between books and authors
- `SerialNumber` — individual physical copies of books
- `Member` — library members
- `Loan` — loans of book copies to members

A book can have more than one author, and an author can have written more than one book.  
This is handled through the `Book_Author` junction table.

Each physical copy of a book has its own serial number. A loan is connected to a specific copy, not directly to the book title.

## ER Diagram

The ER diagram is available in the `docs` folder:

- `Library-ER-Diagram.drawio` — editable draw.io file
- `Library-ER-Diagram.png` — image version of the diagram

![Library ER Diagram](docs/Library-ER-Diagram.png)

## How to Run

Run the SQL files in the following order:

1. `database/01_CreateDatabase.sql`
2. `database/02_CreateTables.sql`
3. `database/03_InsertSampleData.sql`

After that, you can run the example queries in:

- `queries/04_PracticeQueries.sql`

## Example Queries

The `queries/04_PracticeQueries.sql` file contains examples of:

- Showing all loans
- Showing books and their genres
- Showing books and their authors
- Showing members with at least two registered loans
- Showing loans that have not yet been returned

## What I Learned

- Designing tables and relationships in SQL Server
- Using primary keys and foreign keys
- Creating a many-to-many relationship with a junction table
- Writing `JOIN`, `LEFT JOIN`, `GROUP BY`, and `HAVING` queries
- Organizing SQL code into separate files for setup and practice queries