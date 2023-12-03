USE publishers;

-- ## Challenge 1 - Who Have Published What At Where?

SELECT
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    titles.title AS 'TITLE',
    publishers.pub_name AS 'PUBLISHER'
FROM
    authors 
JOIN
    titleauthor USING(au_id)
JOIN
  titles USING(title_id)
JOIN
  publishers USING(pub_id);
  
SELECT COUNT(*) AS 'Total Records'
FROM titleauthor;

-- Challenge 2 Who Have Published How Many At Where?

SELECT
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    publishers.pub_name AS 'PUBLISHER',
    COUNT(titles.title_id) AS 'NUMBER OF TITLES'
FROM
    authors 
JOIN
    titleauthor USING(au_id)
JOIN
    titles USING(title_id)
JOIN
    publishers USING(pub_id)
GROUP BY
    authors.au_id, publishers.pub_name;
    
-- Challenge 3 Who are the top 3 authors who have sold the highest number of titles? 
    
SELECT
  authors.au_id AS AUTHOR_ID, 
  max(authors.au_lname) AS LAST_NAME,
  max(authors.au_fname) AS FIRST_NAME,
  sum(DISTINCT titles.ytd_sales) AS TOTAL
FROM
  authors
JOIN
  titleauthor USING(au_id)
JOIN
  titles USING(title_id)   
GROUP BY
  AUTHOR_ID
ORDER BY
  TOTAL DESC
LIMIT 3;  

-- Challenge 4 - Best Selling Authors Ranking

SELECT
    authors.au_id AS AUTHOR_ID,
    MAX(authors.au_lname) AS LAST_NAME,
    MAX(authors.au_fname) AS FIRST_NAME,
    SUM(DISTINCT titles.ytd_sales) AS TOTAL_TITLES_SOLD
FROM
    authors
JOIN
    titleauthor USING(au_id)
JOIN
    titles USING(title_id)
GROUP BY
    AUTHOR_ID
ORDER BY
    TOTAL_TITLES_SOLD DESC;