SELECT COUNT(*)
FROM data_analysts_jobs;

--There are 1793 rows in the table.

SELECT *
FROM data_analysts_jobs
LIMIT 10;

--ExxonMobil is the company on the 10th row.

SELECT 
	COUNT(CASE WHEN location = 'TN' THEN 1 END) AS TN_count_jobs,
	COUNT(CASE WHEN location = 'KY' THEN 1 END) AS KY_count_jobs,
	COUNT(CASE WHEN location IN('TN','KY') THEN 1 END) AS TN_KY_sum
FROM data_analysts_jobs;

-- There are 21 jobs in TN; 27 jobs either in TN or KY.

SELECT 
	COUNT(CASE WHEN location = 'TN' AND star_rating > 4 THEN 1 END) AS TN_jobs_over_4
FROM data_analysts_jobs;

-- There are 3 postings that have over a 4 star rating in TN.

SELECT
	COUNT(review_count BETWEEN 500 AND 1000)
FROM data_analysts_jobs;

-- There are 1536 postings that have a review count between 500 and 1000.


SELECT 
	location, 
	ROUND(AVG(star_rating), 2) AS avg_star_rating
FROM data_analysts_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_star_rating DESC;

-- Nebraska has the highest star rating at 4.20.

SELECT 
	COUNT(DISTINCT(title))
FROM data_analysts_jobs;

-- There are 881 unique job titles in the data set.

SELECT
	COUNT(DISTINCT title)
FROM data_analysts_jobs
WHERE location = 'CA';

-- There are 230 unique job titles for California.

SELECT 
	company,
	AVG(star_rating) AS avg_star_rating
FROM data_analysts_jobs
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company
ORDER BY avg_star_rating DESC;

-- There are 40 companies across all locations with over 5000 reviews. 

SELECT 
	company,
	review_count,
	ROUND(AVG(star_rating), 2) AS avg_star_rating
FROM data_analysts_jobs
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company, review_count
ORDER BY avg_star_rating DESC, review_count DESC;

-- Kaiser Permanente is the #1 company all have an average star rating of 4.20.

SELECT 
	COUNT(title)
FROM data_analysts_jobs
WHERE title ILIKE '%Analyst%';

SELECT
	COUNT(DISTINCT title)
FROM data_analysts_jobs
WHERE title ILIKE '%Analyst%';

-- There are 1669 job titles with the word 'Analyst' in them, 774 of them being unique titles.

SELECT 
	DISTINCT title
FROM data_analysts_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';

-- There are 4 jobs without 'Analyst' and 'Analytics' in their title and they all have the word 'Tableau' in their title.

--Bonus questions

SELECT 
	DISTINCT domain,
	SUM(days_since_posting) AS total_posted_days
FROM data_analysts_jobs
WHERE 
	domain IS NOT NULL 
	AND skill ILIKE '%SQL%'
GROUP BY domain, days_since_posting
ORDER BY total_posted_days DESC;

-- Banks and Financial Services, Internet and Software, Consulting and Business Services, and Health Care are the top 4.

SELECT 
	COUNT(*)
FROM data_analysts_jobs
WHERE domain = 'Banks and Financial Services'AND days_since_posting > 21;

-- 77 jobs for Banks and Financial Services

SELECT 
	COUNT(*)
FROM data_analysts_jobs
WHERE domain = 'Internet and Software'AND days_since_posting > 21;

-- 84 jobs for Internet and Software

SELECT 
	COUNT(*)
FROM data_analysts_jobs
WHERE domain = 'Consulting and Business Services'AND days_since_posting > 21;

-- 110 jobs for Consulting and Business Services

SELECT 
	COUNT(*)
FROM data_analysts_jobs
WHERE domain = 'Health Care'AND days_since_posting > 21;

-- 96 jobs for Health Care
