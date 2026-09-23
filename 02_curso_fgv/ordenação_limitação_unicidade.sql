-- Ordenação, limitação e unicidade

-- Utilizando a tabela gdp_pc, selecione os países com menor PIB per capita em 2009
SELECT * FROM gdp_pc
WHERE ref_year = 2009
ORDER BY gdp_pc;

-- Utilizando a tabela avg_income, selecione os países com menor renda per capita em 2009.
SELECT * FROM avg_income
WHERE ref_year = 2009
ORDER BY mean_usd;

-- Utilizando a tabela fertility, encontre os países com maior taxa de natalidade em 2009.
SELECT * FROM fertility
WHERE ref_year = 2009
ORDER BY mean_babies DESC;

-- Utilizando a tabela child_mortality, indique os países com a maior taxa de mortalidade infantil em 2009.
SELECT * FROM child_mortality
WHERE ref_year = 2009
ORDER BY tot_deaths DESC;

-- Utilizando a tabela womem_years_at_school, selecione os países com menor tempo médio na escola das mulheres de 25 anos em 2009.
SELECT * FROM women_years_at_school
WHERE ref_year = 2009
ORDER BY mean_years;

-- Utilizando a tabela gdp_pc, selecione os 6 países com menor PIB per capita em 2009.
SELECT * FROM gdp_pc
WHERE ref_year = 2009
ORDER BY gdp_pc
LIMIT 6;

-- Utilizando a tabela life_expectancy, encontre os seis países com a menor expectativa de vida em 2009.
SELECT * FROM life_expectancy
WHERE ref_year = 2009
ORDER BY tot_years
LIMIT 6;

-- Sem apresentar linhas nulas, indique quais são as categorias do campo wb4income da tabela country.
SELECT DISTINCT wb4income 
FROM country
WHERE wb4income IS NOT NULL;

-- Selecione os cinco últimos países distintos, na ordem alfabética, da tabela population.
SELECT DISTINCT country  
FROM population
ORDER BY country DESC
LIMIT 5;