create database population;
select*
from Populationdata2023

## The dataset is quite simple and will not allow us to answer complicated question. It is composed of 14 colums and 193 row.
    country_name , country_code with the population of the year 1990, 2000 and from 2014-2023

## What is the maximum and minimum of population for years in all the countries?


SELECT '2023' AS Year, MIN(yr2023) AS min_population, MAX(yr2023) as max_population
FROM Populationdata2023
UNION ALL
SELECT '2022', MIN(yr2022), MAX(yr2022)
FROM Populationdata2023
UNION ALL
SELECT '2021', MIN(yr2021), MAX(yr2021)
FROM Populationdata2023
UNION ALL
SELECT '2020', MIN(yr2020), MAX(yr2020)
FROM Populationdata2023
UNION ALL
SELECT '2019', MIN(yr2019), MAX(yr2019)
FROM Populationdata2023
UNION ALL
SELECT '2018', MIN(yr2018), MAX(yr2018)
FROM Populationdata2023
UNION ALL
SELECT '2017', MIN(yr2017), MAX(yr2017)
FROM Populationdata2023
UNION ALL
SELECT '2016', MIN(yr2016), MAX(yr2016)
FROM Populationdata2023
UNION ALL
SELECT '2015', MIN(yr2015), MAX(yr2015)
FROM Populationdata2023
UNION ALL
SELECT '2014', MIN(yr2014), MAX(yr2014)
FROM Populationdata2023
UNION ALL
SELECT '2000', MIN(yr2000), MAX(yr2000)
FROM Populationdata2023
UNION ALL
SELECT '1990', MIN(yr1990), MAX(yr1990)
FROM Populationdata2023;

## The country with the maximum and minimum population in 2023 and retrieving the population data for that country across other years

WITH MaxCountry2023 AS (
    SELECT country_name
    FROM Populationdata2023
    WHERE yr2023 = (SELECT MAX(yr2023) FROM Populationdata2023)
)
SELECT 
    pd.country_name,
    pd.yr2023 AS population_2023,
    pd.yr2022 AS population_2022,
    pd.yr2021 AS population_2021,
    pd.yr2020 AS population_2020,
    pd.yr2019 AS population_2019,
    pd.yr2018 AS population_2018,
    pd.yr2017 AS population_2017,
    pd.yr2016 AS population_2016,
    pd.yr2015 AS population_2015,
    pd.yr2014 AS population_2014,
    pd.yr2000 AS population_2000,
    pd.yr1990 AS population_1990
FROM 
    Populationdata2023 pd
JOIN 
    MaxCountry2023 mc
ON 
    pd.country_name = mc.country_name;

	WITH MinCountry2023 AS (
    SELECT country_name
    FROM Populationdata2023
    WHERE yr2023 = (SELECT MIN(yr2023) FROM Populationdata2023)
)
SELECT 
    pd.country_name,
    pd.yr2023 AS population_2023,
    pd.yr2022 AS population_2022,
    pd.yr2021 AS population_2021,
    pd.yr2020 AS population_2020,
    pd.yr2019 AS population_2019,
    pd.yr2018 AS population_2018,
    pd.yr2017 AS population_2017,
    pd.yr2016 AS population_2016,
    pd.yr2015 AS population_2015,
    pd.yr2014 AS population_2014,
    pd.yr2000 AS population_2000,
    pd.yr1990 AS population_1990
FROM 
    Populationdata2023 pd
JOIN 
    MinCountry2023 mc
ON 
    pd.country_name = mc.country_name;

## Top 10 country with highest population in 2023 vs in 2014


    SELECT TOP 10
        country_name AS country_2023
    FROM Populationdata2023
    ORDER BY yr2023 DESC
  
    SELECT TOP 10
        country_name AS country_2014
    FROM Populationdata2023
    ORDER BY yr2014 DESC
    
