create  Database Project2;
use Project2;

Create TABLE Library (
    LibraryID INT PRIMARY KEY,
    LibraryName NVARCHAR(100) NOT NULL,
    Location NVARCHAR(150)
);

Create TABLE Members (
    MemberID INT PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    JoinDate DATE
);

Create TABLE Staff (
    StaffID INT PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Position NVARCHAR(50),
    LibraryID INT,
    FOREIGN KEY (LibraryID) REFERENCES Library(LibraryID)
);

Create TABLE Book (
    BookID INT PRIMARY KEY,
    Title NVARCHAR(150) NOT NULL,
    ISBN NVARCHAR(20),
    Genre NVARCHAR(50),
    Status NVARCHAR(20), 
    LibraryID INT,
    FOREIGN KEY (LibraryID) REFERENCES Library(LibraryID)
);

Create TABLE Loan (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    Status NVARCHAR(20),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

Create TABLE Payment (
    PaymentID INT PRIMARY KEY,
    LoanID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    FOREIGN KEY (LoanID) REFERENCES Loan(LoanID)
);

Create TABLE Review (
    ReviewID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    Rating INT ,
    Comment NVARCHAR(244),
    ReviewDate DATE,
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

Insert into Library (LibraryID, LibraryName, Location)
VALUES
(1, 'Central Library', 'Muscat'),
(2, 'Science Library', 'Sohar'),
(3,' Math Library', 'ALRustaq'),
(4, ' Islamic Library', 'Nizwa');

Insert  into Members (MemberID, FullName, Email, Phone, JoinDate)
VALUES
(1, 'Fatma Al-Mamari', 'fatma@gmail.com', '96891234567', '2025-01-15'),
(2, 'Salim Al-Balushi', 'salim@gmail.com', '96892345678', '2025-03-10'),
(3, 'Aisha Al-Rashdi', 'aisha@gmail.com', '96893456789', '2025-06-01'),
(4,' Basma AL-Rajhi' , 'basma@gmail.com', '9876666666', '2025-06-02'),
(5, 'Moza AL-Mamari', 'Moza@gmail.com', '987766778', '2025-07-09'),
(6,'Hamed AL-Balushi','Hamed@gmail.com','98765467', '2025-08-10'),
(7,'Jokah AL-Salmi', 'Jokah@gmail.com', '9876543', '2025-09-11'),
(8, 'Houda AL-Rajhi' , 'Houda@gmail.com', '9987665','2025-10-12'),
(9, 'Omar AL-Senani', 'Omar@gmail.com' ,'965432455', '2025-11-13'),
(10,'Hassan AL-Badri','Hassan@gmail.com','99876544','2025-12-14');

Insert into Staff (StaffID, FullName, Position, LibraryID)
VALUES
(1, 'Ahmed Al-Hinai', 'Librarian', 1),
(2, 'Mona Al-Kindi', 'Assistant', 2),
(3,'Zahrah AL-Saidi', 'Manager',3),
(4,'Bader AL-Badri', 'Librarian',4);

Insert into Book (BookID, Title, ISBN, Genre, Status, LibraryID)
VALUES
(1, 'Database Systems', '978-0133970777', 'Technology', 'Available', 1),
(2, 'Clean Code', '978-0132350884', 'Programming', 'Issued', 1),
(3, 'Physics Basics', '978-0321780097', 'Science', 'Available', 2),
(4, 'Introduction to Algorithms', '978-0262033848', 'Technology', 'Issued', 3),
(5, 'Operating System Concepts', '978-1118063330', 'Technology', 'Available', 4),
(6, 'Artificial Intelligence', '978-0136042594', 'Technology', 'Available', 3),
(7, 'Discrete Mathematics', '978-0073383095', 'Mathematics', 'Issued', 2),
(8, 'Computer Networks', '978-0132126953', 'Technology', 'Available', 1),
(9, 'Data Science Handbook', '978-1491912058', 'Data Science', 'Issued', 3),
(10, 'Software Engineering', '978-0132350881', 'Programming', 'Available', 2),
(11, 'Web Development Basics', '978-1491950296', 'Programming', 'Available', 1),
(12, 'Cyber Security Essentials', '978-1119097891', 'Security', 'Issued', 3),
(13, 'Machine Learning Guide', '978-1449369415', 'Technology', 'Available', 2),
(14, 'Cloud Computing', '978-0134757599', 'Technology', 'Available', 4),
(15, 'Digital Electronics', '978-0073380643', 'Electronics', 'Issued', 1),
(16, 'Linear Algebra', '978-0321982385', 'Mathematics', 'Available', 2),
(17, 'Big Data Analytics', '978-0134468651', 'Data Science', 'Issued', 3),
(18, 'Mobile App Development', '978-0134685991', 'Programming', 'Available', 1),
(19, 'Software Testing', '978-0321774096', 'Programming', 'Available', 2),
(20, 'Computer Architecture', '978-0128119051', 'Technology', 'Issued', 3);

Insert into Loan (LoanID, BookID, MemberID, LoanDate, DueDate, ReturnDate, Status)
VALUES
(1,  1,  1, '2024-01-05', '2024-01-20', '2024-01-18', 'Returned'),
(2,  2,  2, '2024-01-07', '2024-01-22', NULL,         'Issued'),
(3,  3,  3, '2024-01-10', '2024-01-25', '2024-01-24', 'Returned'),
(4,  4,  4, '2024-01-12', '2024-01-27', NULL,         'Overdue'),
(5,  5,  5, '2024-01-15', '2024-01-30', NULL,         'Issued'),
(6,  6,  6, '2024-02-01', '2024-02-16', '2024-02-14', 'Returned'),
(7,  7,  7, '2024-02-03', '2024-02-18', NULL,         'Issued'),
(8,  8,  8, '2024-02-05', '2024-02-20', NULL,         'Overdue'),
(9,  9,  9, '2024-02-07', '2024-02-22', '2024-02-21', 'Returned'),
(10, 10, 10, '2024-02-10', '2024-02-25', NULL,         'Issued'),
(11, 11, 1, '2024-02-12', '2024-02-27', '2024-02-26', 'Returned'),
(12, 12, 2, '2024-02-15', '2024-03-01', NULL,         'Issued'),
(13, 13, 3, '2024-02-18', '2024-03-04', NULL,         'Overdue'),
(14, 14, 4, '2024-02-20', '2024-03-06', '2024-03-05', 'Returned'),
(15, 15, 5, '2024-02-22', '2024-03-08', NULL,         'Issued');

Insert into  Payment (PaymentID, LoanID, Amount, PaymentDate)
VALUES
(1, 1, 5.00, '2024-12-10'),
(2,2,4.00,'2024-11-12'),
(3,3, 3.00, '2024-01-11'),
(4,4,5.00,'2024-02-12');

Insert into  Review (ReviewID, BookID, MemberID, Rating, Comment, ReviewDate)
VALUES
(1, 1, 1, 5, 'Excellent reference book', '2024-11-26'),
(2, 2, 2, 4, 'Very useful for clean coding practices', '2024-12-05'),
(3,3,3,6, 'Excellent reference book' ,'2024-01-06'),
(4,4,4,7,'Very useful for clean coding practices','2024-02-07');


--1. Library Book Inventory Report--
SELECT 
    l.LibraryName,
    COUNT(b.BookID) AS TotalBooks,
    SUM(CASE WHEN b.Status = 'Available' THEN 1 ELSE 0 END) AS AvailableBooks,
    SUM(CASE WHEN b.Status IN ('Issued', 'Overdue') THEN 1 ELSE 0 END) AS BooksOnLoan
FROM Library l
LEFT JOIN Book b ON l.LibraryID = b.LibraryID
GROUP BY l.LibraryName;

---2--Active Borrowers Analysis---

SELECT 
    m.FullName AS MemberName,
    m.Email,
    b.Title AS BookTitle,
    l.LoanDate,
    l.DueDate,
    l.Status
FROM Loan l
JOIN Members m ON m.MemberID = l.MemberID
JOIN Book b ON l.BookID = b.BookID
WHERE l.Status IN ('Issued', 'Overdue');

--3-Overdue Loans with Member Details----
SELECT 
    m.FullName AS MemberName,
    m.Phone,
    b.Title AS BookTitle,
    lib.LibraryName,
    DATEDIFF(DAY, l.DueDate, GETDATE()) AS DaysOverdue,
    ISNULL(p.Amount, 0) AS FinePaid
FROM Loan l
JOIN Members m ON l.MemberID = m.MemberID
JOIN Book b ON l.BookID = b.BookID
JOIN Library lib ON b.LibraryID = lib.LibraryID
LEFT JOIN Payment p ON l.LoanID = p.LoanID
WHERE l.Status = 'Overdue';

--4. Staff Performance Overview--
Select
    lib.LibraryName,
    s.FullName AS StaffName,
    s.Position,
    Count(b.BookID) AS BooksManaged
FROM Staff s
JOIN Library lib ON s.LibraryID = lib.LibraryID
LEFT JOIN Book b ON lib.LibraryID = b.LibraryID
GROUP BY lib.LibraryName, s.FullName, s.Position;

---5- Book Popularity Repor---
Select 
    b.Title,
    b.ISBN,
    b.Genre,
    Count(l.LoanID) AS TotalLoans,
    AVG(r.Rating) AS AvgRating
FROM Book b
JOIN Loan l ON b.BookID = l.BookID
LEFT JOIN Review r ON b.BookID = r.BookID
GROUP BY b.BookID, b.Title, b.ISBN, b.Genre
HAVING COUNT(l.LoanID) >= 3;

--6-Member Reading History---
SELECT 
    m.FullName AS MemberName,
    b.Title AS BookTitle,
    l.LoanDate,
    l.ReturnDate,
    r.Rating,
    r.Comment
FROM Members m
JOIN Loan l ON m.MemberID = l.MemberID
JOIN Book b ON l.BookID = b.BookID
LEFT JOIN Review r ON m.MemberID = r.MemberID AND b.BookID = r.BookID
ORDER BY m.FullName, l.LoanDate;

--7- Revenue Analysis by Genre---
SELECT 
    b.Genre,
    count(l.LoanID) AS TotalLoans,
    SUM(ISNULL(p.Amount, 0)) AS TotalFines,
    AVG(ISNULL(p.Amount, 0)) AS AvgFinePerLoan
FROM Book b
JOIN Loan l ON b.BookID = l.BookID
LEFT JOIN Payment p ON l.LoanID = p.LoanID
GROUP BY b.Genre;


---8-Monthly Loan Statistics-----
Select 
    Datename(month, LoanDate) AS MonthName,
    Count(*) AS TotalLoans,
    SUM(CASE WHEN Status = 'Returned' THEN 1 ELSE 0 END) AS TotalReturned,
    SUM(CASE WHEN Status IN ('Issued','Overdue') THEN 1 ELSE 0 END) AS TotalActiveLoans
FROM Loan
WHERE YEAR(LoanDate) = YEAR(GETDATE())
GROUP BY DATENAME(MONTH, LoanDate), MONTH(LoanDate)
ORDER BY MONTH(LoanDate);

---9- Member Engagement Metrics----
SELECT 
    m.MemberID,
    m.FullName,
    Count(l.LoanID) AS TotalBooksBorrowed,
    SUM(CASE WHEN l.Status IN ('Issued','Overdue') THEN 1 ELSE 0 END) AS BooksCurrentlyOnLoan,
    COALESCE(SUM(p.Amount), 0) AS TotalFinesPaid,
    AVG(r.Rating) AS AverageRatingGiven
FROM Members m
JOIN Loan l ON m.MemberID = l.MemberID
LEFT JOIN Payment p ON l.LoanID = p.LoanID
LEFT JOIN Review r ON m.MemberID = r.MemberID
GROUP BY m.MemberID, m.FullName
HAVING Count(l.LoanID) >= 1
ORDER BY m.MemberID;

---10- Library Performance Comparison----

SELECT 
    L.LibraryName,
    Count(b.BookID) AS TotalBooks,
    Count(DISTINCT Ln.MemberID) AS ActiveMembers,
    ISNULL(SUM(P.Amount), 0) AS TotalRevenue,
    CAST(
        COUNT(b.BookID) * 1.0 /
        NULLIF(COUNT(DISTINCT Ln.MemberID), 0)
        AS DECIMAL(10,2)
    ) AS AvgBooksPerMember
FROM Library L
LEFT JOIN Book B ON L.LibraryID = B.LibraryID
LEFT JOIN Loan LN ON B.BookID = LN.BookID
LEFT JOIN Payment P ON LN.LoanID = P.LoanID
GROUP BY L.LibraryName;

-----11. High-Value Books Analysis---
ALTER TABLE Book
ADD Price DECIMAL(10,2);

SELECT 
    B.Title,
    B.Genre,
    B.Price,
    AVG(B2.Price) AS GenreAvgPrice,
    B.Price - AVG(B2.Price) AS PriceDifference
FROM Book B
JOIN Book B2 ON B.Genre = B2.Genre
GROUP BY B.Title, B.Genre, B.Price
HAVING B.Price > AVG(B2.Price);

---12- Payment Pattern Analysis---

alter table Payment
ADD Paymentmethod varchar (50);

Update Payment set Paymentmethod= 'Cash' Where PaymentID =1;
Update Payment set Paymentmethod= 'Card' WHERE PaymentID =2;
Update Payment set Paymentmethod= 'Cash' Where PaymentID =3;
Update Payment set Paymentmethod= 'Card' WHERE PaymentID =4;
ALTER TABLE Payment
DROP COLUMN Paymentmethod;
SELECT 
    PaymentMethod,
    Count(*) AS TotalTransactions,
    SUM(Amount) AS TotalAmount,
    AVG(Amount) AS AvgPaymentAmount,
    CAST(
        SUM(Amount) * 100 /
        (SELECT SUM(Amount) FROM Payment)
        AS int
    ) AS RevenuePercentage
FROM Payment
GROUP BY PaymentMethod;


---13. vw_CurrentLoans---

CREATE VIEW vw_CurrentLoans
AS
SELECT
    l.LoanID,
    m.MemberID,
    m.FullName AS MemberName,
    m.Email,
    m.Phone,
    b.BookID,
    b.Title AS BookTitle,
    b.Genre,
	b.ISBN,
    l.LoanDate,
    l.DueDate,
    l.Status,
    CASE
        WHEN l.DueDate < GETDATE() THEN 'Overdue'
		Else' Issued'
		End AS LoanStatus
FROM Loan l
JOIN Members m ON l.MemberID = m.MemberID
JOIN Book b ON l.BookID = b.BookID
WHERE l.ReturnDate IS null;

---14--vw_LibraryStatistics---

Create VIEW vw_LibraryStatistics AS
SELECT
    l.LibraryID,
    l.LibraryName,

    ----Total books owned by the library ----
    COUNT(DISTINCT b.BookID) AS TotalBooks,

   ---- Available books -----
    COUNT(DISTINCT CASE 
        WHEN b.Status = 'Available' THEN b.BookID 
    END) AS AvailableBooks,

    --- Active members (borrowed at least one book from this library) ----
    COUNT(DISTINCT CASE 
        WHEN lo.LoanID IS NOT NULL THEN lo.MemberID 
    END) AS ActiveMembers,

    ---- Active loans for this library's books ----
    COUNT(DISTINCT CASE 
        WHEN lo.Status IN ('Issued', 'Overdue') THEN lo.LoanID 
    END) AS ActiveLoans,

    --- Total staff working at the library ----
    COUNT(DISTINCT s.StaffID) AS TotalStaff,

    --- Total revenue from fines (payments for this library's book loans) ----
    ISNULL(SUM(p.Amount), 0) AS TotalRevenue

FROM Library l
LEFT JOIN Book b
    ON l.LibraryID = b.LibraryID
LEFT JOIN Loan lo
    ON b.BookID = lo.BookID
LEFT JOIN Payment p
    ON lo.LoanID = p.LoanID
LEFT JOIN Staff s
    ON l.LibraryID = s.LibraryID

GROUP BY
    l.LibraryID,
    l.LibraryName;
	
	--15- vw_BookDetailsWithReviews----
CREATE VIEW vw_BookDetailsWithReviews
AS
SELECT
    b.BookID,
    b.Title,
    b.ISBN,
    b.Genre,
    b.Status AS AvailabilityStatus,
    COUNT(r.ReviewID) AS TotalReviews,
    AVG(CAST(r.Rating AS FLOAT)) AS AverageRating,
    MAX(r.ReviewDate) AS LatestReviewDate
FROM Book b
LEFT JOIN Review r ON b.BookID = r.BookID
GROUP BY
    b.BookID,
    b.Title,
    b.ISBN,
    b.Genre,
    b.Status;

	-----16. sp_IssueBook----

	CREATE PROCEDURE sp_IssueBook
    @MemberID INT,
    @BookID INT,
    @DueDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if book exists and is available
    IF NOT EXISTS (
        SELECT 1 FROM Book 
        WHERE BookID = @BookID AND Status = 'Available'
    )
    BEGIN
        PRINT 'Error: Book is not available.';
        RETURN;
    END

    -- Check if member has overdue loans
    IF EXISTS (
        SELECT 1 FROM Loan
        WHERE MemberID = @MemberID AND Status = 'Overdue'
    )
    BEGIN
        PRINT 'Error: Member has overdue loans.';
        RETURN;
    END

    -- Create new loan
    INSERT INTO Loan (LoanID, BookID, MemberID, LoanDate, DueDate, Status)
    VALUES (
        (SELECT ISNULL(MAX(LoanID),0)+1 FROM Loan),
        @BookID,
        @MemberID,
        GETDATE(),
        @DueDate,
        'Issued'
    );

    -- Update book status
    UPDATE Book
    SET Status = 'Issued'
    WHERE BookID = @BookID;

    PRINT 'Book issued successfully.';
END;
GO

	------17-sp_ReturnBook----

	CREATE PROCEDURE sp_ReturnBook
    @LoanID INT,
    @ReturnDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @DueDate DATE, @BookID INT, @Fine DECIMAL(10,2) = 0;

    -- Get loan details
    SELECT 
        @DueDate = DueDate,
        @BookID = BookID
    FROM Loan
    WHERE LoanID = @LoanID AND Status <> 'Returned';

    IF @BookID IS NULL
    BEGIN
        PRINT 'Invalid Loan ID or book already returned.';
        RETURN;
    END

    -- Calculate fine
    IF @ReturnDate > @DueDate
    BEGIN
        SET @Fine = DATEDIFF(DAY, @DueDate, @ReturnDate) * 2;
    END

    -- Update loan
    UPDATE Loan
    SET Status = 'Returned',
        ReturnDate = @ReturnDate
    WHERE LoanID = @LoanID;

    -- Update book availability
    UPDATE Book
    SET Status = 'Available'
    WHERE BookID = @BookID;

    -- Insert payment if fine exists
    IF @Fine > 0
    BEGIN
        INSERT INTO Payment (PaymentID, LoanID, Amount, PaymentDate)
        VALUES (
            (SELECT ISNULL(MAX(PaymentID),0)+1 FROM Payment),
            @LoanID,
            @Fine,
            GETDATE()
        );
    END

    SELECT @Fine AS TotalFine;
END;
GO


----18- sp_GetMemberReport-----

CREATE PROCEDURE sp_GetMemberReport
    @MemberID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Member basic information
    SELECT * 
    FROM Members
    WHERE MemberID = @MemberID;

    -- 2. Current active loans
    SELECT 
        L.LoanID, B.Title, L.LoanDate, L.DueDate, L.Status
    FROM Loan L
    JOIN Book B ON L.BookID = B.BookID
    WHERE L.MemberID = @MemberID
      AND L.Status IN ('Issued', 'Overdue');

    -- 3. Loan history
    SELECT 
        L.LoanID, B.Title, L.LoanDate, L.ReturnDate, L.Status
    FROM Loan L
    JOIN Book B ON L.BookID = B.BookID
    WHERE L.MemberID = @MemberID;

    -- 4. Total fines paid
    SELECT 
        SUM(P.Amount) AS TotalFinesPaid
    FROM Payment P
    JOIN Loan L ON P.LoanID = L.LoanID
    WHERE L.MemberID = @MemberID;

    -- 5. Reviews written
    SELECT 
        B.Title, R.Rating, R.Comment, R.ReviewDate
    FROM Review R
    JOIN Book B ON R.BookID = B.BookID
    WHERE R.MemberID = @MemberID;
END;
GO

-----19. sp_MonthlyLibraryRepor-----

CREATE PROCEDURE sp_MonthlyLibraryReport
    @LibraryID INT,
    @Month INT,
	@Year INT
AS
BEGIN
    SET NOCOUNT ON;
	---- Total loans issued----
    SELECT COUNT(*) AS TotalLoansIssued
    FROM Loan L
    JOIN Book B ON L.BookID = B.BookID
    WHERE B.LibraryID = @LibraryID
      AND MONTH(L.LoanDate) = @Month;


     -- Total books returned---
    SELECT COUNT(*) AS TotalBooksReturned
    FROM Loan L
    JOIN Book B ON L.BookID = B.BookID
    WHERE B.LibraryID = @LibraryID
      AND MONTH(L.ReturnDate) = @Month;

	  -- Total revenue collected---
    SELECT SUM(P.Amount) AS TotalRevenue
    FROM Payment P
    JOIN Loan L ON P.LoanID = L.LoanID
    JOIN Book B ON L.BookID = B.BookID
    WHERE B.LibraryID = @LibraryID
      AND MONTH(P.PaymentDate) = @Month;

	   -- Most borrowed genre---
    SELECT TOP 1 
        B.Genre, COUNT(*) AS BorrowCount
    FROM Loan L
    JOIN Book B ON L.BookID = B.BookID
    WHERE B.LibraryID = @LibraryID
      AND MONTH(L.LoanDate) = @Month
	  GROUP BY B.Genre
    ORDER BY BorrowCount DESC;

	 -- Top 3 most active members--
    SELECT TOP 3
        M.FullName,
        COUNT(*) AS TotalLoans
    FROM Loan L
    JOIN Members M ON L.MemberID = M.MemberID
    JOIN Book B ON L.BookID = B.BookID
    WHERE B.LibraryID = @LibraryID
      AND MONTH(L.LoanDate) = @Month
	  GROUP BY M.FullName
    ORDER BY TotalLoans DESC;
END;
GO









	SELECT* FROM Book












