-- Operadores especiais e operadores lógicos

-- Indique se há linhas com valores nulos no campo gdp_pc na tabela gdp_pc.
SELECT * FROM gdp_pc
WHERE gdp_pc IS NULL;

-- Na tabela child_mortality, indique se há linhas com valores nulos no campo tot_deaths.
SELECT * FROM child_mortality
WHERE tot_deaths IS NULL;

-- Países que alcançaram taxas de mortalidade baixas com uma variação de 5%, ou seja, com valor de 20±5%.
SELECT * FROM child_mortality
WHERE tot_deaths BETWEEN 19 AND 21;

-- Expectativa de vida do brasileiro nos anos de 2019 a 2023
SELECT * FROM life_expectancy
WHERE ref_year BETWEEN 2019 AND 2023
AND country = 'Brazil';

-- Países cuja população ultrapassou 200 milhões de habitantes em 2023
SELECT * FROM population
WHERE ref_year = 2023
AND tot_pop > 2E8;

-- Emissões de CO2 no Brasil, na China e nos Estados Unidos, de 2019 a 2021.
SELECT * FROM co2_emissions_pc
WHERE country IN ('Brazil', 'China', 'USA') 
AND ref_year BETWEEN 2019 AND 2021;

-- Países europeus de renda média baixa.
SELECT country, eight_regions, wb4income 
FROM country
WHERE eight_regions IN ('europe_east', 'europe_west')
AND wb4income = 'Lower middle income';

/* Países do continente asiático segundo a classificação de oito regiões. 
 * Além da coluna country, traga as colunas eight_regions e wb_regions para comparação.*/
SELECT country, eight_regions, wb_regions 
FROM country
WHERE eight_regions LIKE '%asia%';

-- Países das Américas, segundo a classificação do Banco Mundial
SELECT country, wb_regions
FROM country
WHERE wb_regions LIKE '%America%';
