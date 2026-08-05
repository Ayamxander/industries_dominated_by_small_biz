-- Which industries have the highest number of establishments but the lowest total employment level?
-- Divide total employment by total establishments
-- Group by industry
-- Only include results with 10,000 or more establishments in California.

SELECT 
  industry_name AS industry,
  SUM(establishments) AS total_establishments,
  SUM(average_monthly_employment) AS total_employment,
  ROUND(SUM(average_monthly_employment) / SUM(establishments), 0) AS avg_employment_per_establishment
FROM qcew_2004_2007
GROUP BY industry_name
HAVING SUM(establishments) >= 10000 -- Ensure total establishments per industry >= 5,000
ORDER BY total_employment ASC, total_establishments DESC -- Sort by lowest total employment first
LIMIT 100;