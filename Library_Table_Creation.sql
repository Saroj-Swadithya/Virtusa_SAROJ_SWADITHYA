/*The "Digital Library" Audit
Business Case: A local community college has a database of books and student borrows. They are struggling to track "Overdue" books and want to know which categories of books are most popular to decide what to buy next.
Problem Statement
Create a relational system to track book loans and generate a "Penalty Report" for books not returned within 14 days.
Student Tasks:
1.	Table Creation: Create Books, Students, and IssuedBooks (with IssueDate and ReturnDate).
2.	Overdue Logic: Write a query to find all students who haven't returned a book where the IssueDate was more than 14 days ago and ReturnDate is NULL.
3.	Popularity Index: Use COUNT and GROUP BY on the Category column to show which genre (e.g., Fiction, Science, History) is borrowed the most.
4.	Data Cleanup: Write a DELETE or UPDATE statement to remove student records who haven't borrowed a book in over 3 years (Inactive accounts).
Deliverable: A .sql file containing the DDL (table creation) and the analytical queries.*/

CREATE TABLE BOOKS (BK_ID INT PRIMARY KEY, TITLE VARCHAR(50) NOT NULL, AUTHOR VARCHAR(60), CATEGORY VARCHAR(40));

CREATE TABLE STUDENTS (STU_ID INT PRIMARY KEY, STU_NAME VARCHAR(80) NOT NULL, DEPT VARCHAR(50), JOIN_DATE DATE);

CREATE TABLE ISSUEDBOOKS (ISSUE_ID INT PRIMARY KEY, BOOK_ID INT, STUDENT_ID INT, ISSUE_DATE DATE NOT NULL, RETURN_DATE DATE, 
CONSTRAINT FK_BOOK FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BK_ID),
CONSTRAINT FK_STUDENT FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS(STU_ID));
