-- Operações de conjuntos

--dados de tempo na escola de homens e mulheres nos BRICS (Brazil, Russia, India, China e South Africa) no ano de 2009. 
SELECT myas.country,
       myas.mean_years, 
       'male' as gender 
FROM men_years_at_school myas 
WHERE myas.country IN ('Brazil', 'Russia', 'India', 'China', 'South Africa')
AND myas.ref_year = 2009
UNION
SELECT wyas.country, 
       wyas.mean_years,
       'female' as gender 
FROM women_years_at_school wyas
WHERE wyas.country IN ('Brazil', 'Russia', 'India', 'China', 'South Africa')
AND wyas.ref_year = 2009;

-- Indique quais são os países presentes na tabela child_mortality que NÃO estão na tabela fertility.
SELECT cm.country FROM child_mortality cm
EXCEPT 
SELECT f.country FROM fertility f;

-- Compare as tabelas population e child_mortality e indique se há alguma diferença nos países presentes em cada uma delas.
SELECT p.country 
FROM population p
EXCEPT
SELECT cm.country
FROM child_mortality cm;

-- Indique se há algum país na tabela population que NÃO existe na tabela country.
SELECT p.country
FROM population p
EXCEPT
SELECT c.country
FROM country c;

-- Utilizando as tabelas co2_emissions_pc e men_years_at_school, 
-- verifique se há diferenças na combinação de país e ano para o Brasil a partir de 2000 (inclusive).
SELECT cep.country, cep.ref_year
FROM co2_emissions_pc cep
WHERE cep.country = 'Brazil'
AND cep.ref_year >= 2000
EXCEPT
SELECT myas.country, myas.ref_year 
FROM men_years_at_school myas
WHERE myas.country = 'Brazil'
AND myas.ref_year >= 2000;

-- Indique quais são as linhas comuns entre as tabelas co2_emissions_pc e men_years_at_school.
SELECT cep.country, cep.ref_year
FROM co2_emissions_pc cep
WHERE cep.country = 'Brazil'
	AND cep.ref_year >= 2000	
INTERSECT
SELECT myas.country, myas.ref_year
FROM men_years_at_school myas
WHERE myas.country = 'Brazil'
	AND myas.ref_year >= 2000;