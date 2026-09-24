-- Junções internas e junções naturais

-- os cinco países asiáticos cujos homens de 25 anos passaram menos tempo na escola em 2009.
SELECT myas.country,
       myas.mean_years
FROM country AS c
INNER JOIN men_years_at_school AS myas ON c.country = myas.country 
WHERE c.four_regions LIKE '%asia%'
AND myas.ref_year = 2009
ORDER BY myas.mean_years
LIMIT 5;

-- liste os 10 países de maior renda per capita diária no ano de 1985, além da região e da classificação de três rendas.
SELECT c.country,
       c.wb_regions,
       c.wb3income,
       avg.mean_usd
FROM country AS c INNER JOIN avg_income AS avg 
ON c.country = avg.country
WHERE avg.ref_year = 1985
ORDER BY avg.mean_usd DESC
LIMIT 10;

-- Selecione, apenas para o Brasil, os dados de renda per capita diária, PIB, população, mortalidade infantil, 
-- fertilidade e expectativa de vida, abrangendo o período de 1900 a 2020, a cada 10 anos (1900, 1910, 1920, ..., 2020).
SELECT ai.ref_year, 
	ai.mean_usd, 
	p.tot_pop, 
	cm.tot_deaths, 
	f.mean_babies, 
	le.tot_years
FROM avg_income ai
JOIN gdp_pc gp ON ai.country = gp.country 
	AND ai.ref_year = gp.ref_year
JOIN population p ON ai.country = p.country 
	AND ai.ref_year = p.ref_year
JOIN child_mortality cm ON ai.country = cm.country 
	AND ai.ref_year = cm.ref_year
JOIN fertility f ON ai.country = f.country 
	AND ai.ref_year = f.ref_year
JOIN life_expectancy le ON ai.country = le.country 
	AND ai.ref_year = le.ref_year
WHERE ai.country = 'Brazil'
AND ai.ref_year in (1900, 1910, 1920, 1930, 1940, 1950, 1960, 1970, 1980, 1990, 2000, 2010,2020)
ORDER BY ai.ref_year;

-- os cinco países asiáticos cujos homens de 25 anos passaram menos tempo na escola em 2009, utilizando a cláusula NATURAL JOIN.  
SELECT c.country,
	   myas.mean_years
FROM country AS c 
NATURAL JOIN men_years_at_school AS myas
WHERE c.four_regions = 'asia' 
AND myas.ref_year  = 2009
ORDER BY myas.mean_years
LIMIT 5;

/* Selecione, apenas para o Brasil, os dados de renda per capita diária, PIB, população, mortalidade infantil,
 * fertilidade e expectativa de vida, abrangendo o período de 1900 a 2020, a cada 10 anos (1900, 1910, 1920, ..., 2020),
 * utilizando a cláusula NATURAL JOIN. */
SELECT ai.ref_year, 
	ai.mean_usd, 
	p.tot_pop, 
	cm.tot_deaths, 
	f.mean_babies, 
	le.tot_years
FROM avg_income ai
NATURAL JOIN gdp_pc gp
NATURAL JOIN population p
NATURAL JOIN child_mortality cm
NATURAL JOIN fertility f
NATURAL JOIN life_expectancy le
WHERE ai.country = 'Brazil'
AND ai.ref_year in (1900, 1910, 1920, 1930, 1940, 1950, 1960, 1970, 1980, 1990, 2000, 2010, 2020)
ORDER BY ai.ref_year;