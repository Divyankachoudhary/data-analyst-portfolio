use amazon_prime;
-- Content distribution by type
-- Question 1: How many Movies vs TV Shows are available on Amazon Prime?
select type, count(*) as total_titles
from titles
group by type;

-- Average quality & popularity by content type
-- Question 2: How do Movies and TV Shows compare in IMDb score and TMDB popularity?
select 
type,
count(*) as total_titles,
round(avg(imdb_score),2) as avg_imdb_score,
round(avg(tmdb_popularity),2) as avg_tbdm_popularity
from titles
group by type;
 
 -- Content growth over years
 -- Question 3: How has Amazon Prime’s content library grown over time?
 SELECT 
    release_year,
    COUNT(*) AS total_titles
FROM titles
GROUP BY release_year
ORDER BY release_year;
  
-- Content aging analysis
-- Question 4 : How does content performance differ between old, mid, and recent releases?  
 SELECT 
    CASE 
        WHEN release_year < 2000 THEN 'Old Content'
        WHEN release_year BETWEEN 2000 AND 2015 THEN 'Mid Content'
        ELSE 'Recent Content'
    END AS content_age,
    COUNT(*) AS total_titles,
    ROUND(AVG(imdb_score), 2) AS avg_imdb_score
FROM titles
GROUP BY content_age;

-- Top genres by average IMDb rating

-- Question: Which genres deliver the highest average IMDb ratings?
SELECT 
    genres,
    COUNT(*) AS total_titles,
    ROUND(AVG(imdb_score), 2) AS avg_imdb_score
FROM titles
WHERE imdb_score IS NOT NULL
GROUP BY genres
ORDER BY avg_imdb_score DESC
LIMIT 15;


-- Genre-wise popularity
-- Question 6: Which genres are most popular based on TMDB popularity?
SELECT 
    genres,
    ROUND(AVG(tmdb_popularity), 2) AS avg_popularity
FROM titles
GROUP BY genres
ORDER BY avg_popularity DESC;

-- Age certification distribution
-- Question 7 : What is the distribution of content across age certifications?
SELECT 
    age_certification,
    COUNT(*) AS total_titles
FROM titles
GROUP BY age_certification
ORDER BY total_titles DESC;

-- Runtime impact on ratings
-- Question 8 : Do longer movies tend to have better IMDb ratings?
SELECT 
    CASE 
        WHEN runtime < 90 THEN 'Short'
        WHEN runtime BETWEEN 90 AND 120 THEN 'Medium'
        ELSE 'Long'
    END AS runtime_category,
    ROUND(AVG(imdb_score), 2) AS avg_imdb_score
FROM titles
WHERE type = 'Movie'
GROUP BY runtime_category;

-- Top 10 highest-rated movies
-- Question 9 : What are the top 10 highest-rated movies on Amazon Prime?
SELECT 
    title,
    imdb_score
FROM titles
WHERE type = 'Movie'
ORDER BY imdb_score DESC
LIMIT 10;

 -- Most popular TV shows
-- Question 10 : Which TV shows have the highest TMDB popularity?
SELECT 
    title,
    tmdb_popularity
FROM titles
WHERE type = 'TV Show'
ORDER BY tmdb_popularity DESC
LIMIT 10;

-- Ranking content by popularity (WINDOW FUNCTION)
-- Question 11 : How can we rank all content by popularity?
SELECT 
    title,
    type,
    tmdb_popularity,
    RANK() OVER (ORDER BY tmdb_popularity DESC) AS popularity_rank
FROM titles;

-- Top-performing content per type
-- Question 12: What is the most popular Movie and TV Show?
WITH ranked_content AS (
    SELECT 
        title,
        type,
        tmdb_popularity,
        RANK() OVER (PARTITION BY type ORDER BY tmdb_popularity DESC) AS rank_within_type
    FROM titles
)
SELECT *
FROM ranked_content
WHERE rank_within_type = 1;

-- Countries producing most content

-- Question 13: Which countries produce the most Amazon Prime content?

SELECT 
    production_countries,
    COUNT(*) AS total_titles
FROM titles
GROUP BY production_countries
ORDER BY total_titles DESC;

-- Actors with highest appearances

-- Question 14 : Which actors appear most frequently in Amazon Prime content?

SELECT 
    name,
    COUNT(*) AS total_appearances
FROM credits
WHERE role = 'Actor'
GROUP BY name
ORDER BY total_appearances DESC
LIMIT 10;

-- Content without cast data (data quality check)
--  Which titles have incomplete cast information ?
SELECT 
    t.title,
    COUNT(c.name) AS total_cast_members
FROM titles t
JOIN credits c 
    ON t.id = c.id
WHERE c.role = 'Actor'
GROUP BY t.title
HAVING COUNT(c.name) < 3
ORDER BY total_cast_members;





