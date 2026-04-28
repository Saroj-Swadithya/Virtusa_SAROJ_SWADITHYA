-- 2. Overdue Logic: Write a query to find all students who haven't returned a book where the IssueDate was more than 14 days ago and ReturnDate is NULL.
SELECT S.STU_ID, S.STU_NAME, B.TITLE, I.ISSUE_DATE
FROM ISSUEDBOOKS I
JOIN STUDENTS S ON I.STUDENT_ID = S.STU_ID
JOIN BOOKS B ON I.BOOK_ID = B.BK_ID
WHERE I.RETURN_DATE IS NULL
AND I.ISSUE_DATE < CURRENT_DATE - INTERVAL 14 DAY;
-- 3. Popularity Index: Use COUNT and GROUP BY on the Category column to show which genre (e.g., Fiction, Science, History) is borrowed the most.
SELECT B.CATEGORY, COUNT(*) AS BORROW_COUNT 
FROM ISSUEDBOOKS I 
JOIN BOOKS B ON I.BOOK_ID = B.BK_ID 
GROUP BY B.CATEGORY 
ORDER BY BORROW_COUNT DESC;


-- 4. Data Cleanup: Write a DELETE or UPDATE statement to remove student records who haven't borrowed a book in over 3 years (Inactive accounts).
DELETE FROM STUDENTS
WHERE STU_ID NOT IN (
    SELECT DISTINCT STUDENT_ID
    FROM ISSUEDBOOKS
    WHERE ISSUE_DATE >= CURRENT_DATE - INTERVAL 3 YEAR
);