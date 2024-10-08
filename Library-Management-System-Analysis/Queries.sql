Query 1:   Find all books that are currently issued.
Solution:  SELECT 
           books.book_title, 
           books.isbn, 
           issued_status.issued_book_name, 
           issued_status.issued_date, 
           members.member_name
           FROM books
           JOIN issued_status ON books.isbn = issued_status.issued_book_isbn
           JOIN members ON issued_status.issued_member_id = members.member_id
           WHERE issued_status.issued_id NOT IN (SELECT issued_id FROM return_status);
Query 2:   List employess managing most branches.
Solution:  SELECT employees.emp_name, 
           COUNT(branch.branch_id) AS ManagedBranches
           FROM employees 
           JOIN branch  ON employees.emp_id = branch.manager_id
           GROUP BY employees.emp_name
           ORDER BY ManagedBranches DESC;
Query 3:   Find most popular books (books that are frequently issued).
Solution:  SELECT 
           issued_status.issued_book_name, 
           COUNT(issued_status.issued_book_isbn) AS IssueCount
           FROM issued_status 
           GROUP BY issued_status.issued_book_name
           ORDER BY IssueCount DESC
           LIMIT 5;
Query 4:  List members who have borrowed more than five books.
Solution: SELECT members.member_name, 
          COUNT(issued_status.issued_id) AS BooksBorrowed
          FROM members 
          JOIN issued_status  ON members.member_id = issued_status.issued_member_id
          GROUP BY members.member_name
          HAVING BooksBorrowed > 5;
Query 5:  Calculate how many times books are issued in each month.
Solution: SELECT DATE_FORMAT(issued_status.issued_date, '%Y-%m') AS Month, COUNT(issued_status.issued_id) AS BooksIssued
          FROM issued_status 
          GROUP BY Month
          ORDER BY Month;
Query 6:  Identify books that have never been issued.
Solution: SELECT book_title
          FROM books
          WHERE isbn NOT IN (SELECT issued_book_isbn FROM issued_status);
Query 7:  List members who have books that are still issued and not returned yet.
Solution: SELECT members.member_name, 
          issued_status.issued_book_name, 
          issued_status.issued_date
          FROM members 
          JOIN issued_status  ON members.member_id = issued_status.issued_member_id
          LEFT JOIN return_status ON issued_status.issued_id = return_status.issued_id
          WHERE return_status.issued_id IS NULL;
Query 8:  Calculates the total rental price of books by category.
Solution: SELECT
          books.category,
          SUM(books.rental_price),
          COUNT(*)
          FROM books
          JOIN issued_status ON issued_status.issued_book_isbn = books.isbn
          GROUP BY category;
Query 9:  Retrieve all books issued by a specific employee.
Solution: SELECT * FROM issued_status
          WHERE issued_emp_id = 'E101';
Query 10: Calculate total fine collected in the library from overdue books. Assume fine of $1 per day overdue.
Solution: SELECT 
          SUM(DATEDIFF(return_status.return_date, issued_status.issued_date) - 30) * 1 AS TotalFine
          FROM return_status
          JOIN issued_status ON return_status.issued_id = issued_status.issued_id
          WHERE DATEDIFF(return_status.return_date, issued_status.issued_date) > 30;
