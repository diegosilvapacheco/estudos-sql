-- Funções sumarizadoras

-- preço médio das ações entre 20-02-2020 a 20-03-2020 e amplitude de variação positiva
SELECT "Date",
       (p."Close" + p."Open")/2 AS mean,
        p."Close" - p."Open" as "range"
FROM petrobras p
WHERE p.Date BETWEEN '2020-02-20' AND '2020-03-20'
AND "range" > 0 ;

-- países da África nos quais as mulheres possuem pelo menos um ano a mais de escolaridade do que os homens durante o período de 2001 a 2010.
SELECT DISTINCT wyas.country
FROM women_years_at_school wyas 
JOIN men_years_at_school myas ON wyas.ref_year = myas.ref_year
     AND wyas.country = myas.country 
JOIN country c ON wyas.country = c.country
WHERE c.four_regions = 'africa'
AND wyas.ref_year BETWEEN 2001 AND 2010
AND wyas.mean_years > myas.mean_years + 1;

-- taxa de mortalidade infantil do Brasil em porcentagem
SELECT cm.tot_deaths,
       cm.tot_deaths * 100 / 1000 as percent_tot_deaths,
       cm.ref_year
FROM child_mortality cm
-- do Brasil
WHERE cm.country = 'Brazil'
-- entre 1910 a 2020
AND cm.ref_year BETWEEN 1910 AND 2020
-- intervalos de 10 anos
AND cm.ref_year % 10 = 0;

-- expectativa de vida mínima, média e máxima dos países da América Latina e do Caribe em 1990.
SELECT MIN(le.tot_years) AS expectativa_minima,
       AVG(le.tot_years) AS expectativa_media,
       MAX(le.tot_years) AS expectativa_maxima
FROM life_expectancy le 
JOIN country c ON le.country = c.country
WHERE le.ref_year = 1990
AND c.wb_regions IN ('Latin America & Caribbean')

-- PIB per capita médio e a renda per capita média dos países no ano de 2019.
SELECT AVG(gp.gdp_pc),
       AVG(ai.mean_usd)
FROM gdp_pc gp 
JOIN avg_income ai ON gp.country = ai.country
WHERE gp.ref_year = 2019
AND ai.ref_year = 2019;

-- média de diferença de tempo na escola entre homens e mulheres no ano 2000.
SELECT AVG(myas.mean_years - wyas.mean_years) AS avg_diff
FROM men_years_at_school AS myas
JOIN women_years_at_school AS wyas ON myas.country = wyas.country
     AND myas.ref_year = wyas.ref_year 
WHERE myas.ref_year = 2000;