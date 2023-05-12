SELECT CURRENT_USER();

CREATE DATABASE vivino;

USE vivino;

SELECT * FROM wines;

SELECT * FROM meteo;

-- How many wines were reviewed in each region?

SELECT Region, COUNT(Wine) AS 'Nr.of reviewed wines'
	FROM wines
		GROUP BY Region
        ORDER BY COUNT(Wine) DESC;
        
-- From this, I decided to observe 3 biggest regions:
	-- Rioja
    -- Rib. del Duero
    -- South Cataluña (Cataluña + Terra Alta + Cariñena + Montsant + Penedés + Priorat + Costers del Segre + Tarragona)
        
-- How many wines were reviewed for each year (vintage) in these 3 regions?

SELECT Year, COUNT(Wine) AS 'Nr.of reviewed wines'
	FROM wines
		WHERE Region IN ('Rioja', 'Ribera del Duero', 'Montsant', 'Panadés', 'Cariñena', 'Costers del Segre', 
        'Cataluña', 'Terra Alta', 'Priorato', 'Tarragona')
		GROUP BY Year
        ORDER BY Year DESC;
        
-- Most reviewed wines between years 2016-2020
-- Total observed wines in this year range: 887
        
SELECT COUNT(Wine) AS 'Nr.of reviewed wines'
	FROM wines
		WHERE Region IN ('Rioja', 'Ribera del Duero', 'Montsant', 'Panadés', 'Cariñena', 'Costers del Segre', 
        'Cataluña', 'Terra Alta', 'Priorato', 'Tarragona')
			AND Year BETWEEN 2016 AND 2020;
            
-- How many reviewed wines in this year range, per observed region?
-- 200+ per region.
        
SELECT Selected_region, COUNT(Wine) AS 'Nr.of reviewed wines'
	FROM wines
		WHERE Region IN ('Rioja', 'Ribera del Duero', 'Montsant', 'Panadés', 'Cariñena', 'Costers del Segre', 
        'Cataluña', 'Terra Alta', 'Priorato', 'Tarragona')
			AND Year BETWEEN 2016 AND 2020
		GROUP BY Selected_region
        ORDER BY COUNT(Wine) DESC;
        
-- Compare weather conditions across the 3 regions, in the observed years 2016-2020.

SELECT * FROM meteo;

-- sum of precipitation:

SELECT year, ROUND(SUM(precip_rioja_sum), 2) AS 'Rioja sum precip', ROUND(SUM(precip_duero_sum), 2) AS 'Duero sum precip', 
ROUND(SUM(precip_catalunya_sum), 2) AS 'Catalunya sum precip'
	FROM meteo
		WHERE year BETWEEN 2016 AND 2020
			GROUP BY year;
            
-- median temperature:

SELECT year, ROUND(AVG(temp_rioja_mean), 2) AS 'Rioja mean temp', ROUND(AVG(temp_duero_mean), 2) AS 'Duero mean temp', 
ROUND(AVG(temp_catalunya_mean), 2) AS 'Catalunya mean temp'
	FROM meteo
		WHERE year BETWEEN 2016 AND 2020
			GROUP BY year;
            
-- Compare wine ratings across the observed years, per observed region.

SELECT * FROM wines;

SELECT Year, Selected_region, ROUND(AVG(Rating), 2) AS 'Average rating', SUM(num_review) AS 'Nr. of reviews'
	FROM wines
		WHERE Selected_region IN ('Rioja', 'Ribera del Duero', 'Catalunya Sul')
			AND Year BETWEEN 2016 AND 2020
		GROUP BY Year, Selected_region
        ORDER BY AVG(Rating) DESC;
        
-- On average, what is the best rated vintage across all 3 regions?

SELECT Year, ROUND(AVG(Rating), 2) AS 'Average rating', SUM(num_review) AS 'Nr. of reviews'
	FROM wines
		WHERE Selected_region IN ('Rioja', 'Ribera del Duero', 'Catalunya Sul')
			AND Year BETWEEN 2016 AND 2020
		GROUP BY Year
        ORDER BY AVG(Rating) DESC;
        
-- How do the weather conditions compare to ratings, for each region, in observed years?

-- Rioja:
SELECT meteo.year, ROUND(AVG(wines.Rating), 2) AS 'average rating', ROUND(AVG(temp_rioja_mean), 2) AS 'mean_temp_rioja', 
ROUND(SUM(precip_rioja_sum), 2) AS 'total precipitation'
	FROM wines
	LEFT JOIN meteo
		ON meteo.year = wines.Year
			WHERE Selected_region = 'Rioja' 
				AND meteo.year BETWEEN 2016 AND 2020
					GROUP BY meteo.year
					ORDER BY meteo.year ASC;
                
-- Ribeira del Duero:
SELECT meteo.year, ROUND(AVG(wines.Rating), 2) AS 'average rating', ROUND(AVG(temp_duero_mean), 2) AS 'mean_temp_duero', 
ROUND(SUM(precip_duero_sum), 2) AS 'total precipitation'
	FROM wines
	LEFT JOIN meteo
		ON meteo.year = wines.Year
			WHERE Selected_region = 'Ribera del Duero' 
				AND meteo.year BETWEEN 2016 AND 2020
					GROUP BY meteo.year
					ORDER BY meteo.year ASC;
                
-- South Catalunya:
SELECT meteo.year, ROUND(AVG(wines.Rating), 2) AS 'average rating', ROUND(AVG(temp_catalunya_mean), 2) AS 'mean_temp_catalunya', 
ROUND(SUM(precip_catalunya_sum), 2) AS 'total precipitation'
	FROM wines
	LEFT JOIN meteo
		ON meteo.year = wines.Year
			WHERE Selected_region = 'Catalunya Sul' 
				AND meteo.year BETWEEN 2016 AND 2020
					GROUP BY meteo.year
					ORDER BY meteo.year ASC;
                    
-- Get all ratings per selected region.

SELECT Rating, Selected_region
	FROM wines;
    
-- Best reviewed wineries.

SELECT Winery, Selected_region, SUM(num_review) AS 'nr. of reviews', ROUND(AVG(Rating), 1) AS 'Average rating'
	FROM wines
		WHERE Selected_region NOT IN ('other')
			GROUP BY Winery, Selected_region
			ORDER BY AVG(Rating) DESC
            LIMIT 20;
            
-- All ratings from 2016.

SELECT Rating FROM wines
	WHERE Year = '2016';
    
-- Total reviews per region.

SELECT Selected_region, SUM(num_review)
	FROM wines
		GROUP BY Selected_region
        ORDER BY SUM(num_review) DESC;
        
-- Rioja sample.

SELECT Rating
	FROM wines
		WHERE Selected_region = 'Rioja';
        
-- Best rated wines.

SELECT Wine, Region, Rating, Price, num_review
	FROM wines
		WHERE Rating > 4
        ORDER BY Rating DESC
        LIMIT 20;
        
-- Weather.

SELECT year, month, ROUND(precip_rioja_sum, 1) AS 'precipitation rioja', ROUND(precip_catalunya_sum, 1) AS 'precipitation catalunya',
ROUND(precip_duero_sum, 1) AS 'precipitation duero'
	FROM meteo;
    

        

            
