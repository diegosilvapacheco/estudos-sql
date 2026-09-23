-- Consultas

-- todos os países e anos cuja emissão seja igual a 0,2
SELECT country , ref_year
FROM co2_emissions_pc
WHERE co2_pc = 0.2;

-- a classificação de quatro e oito regiões e das quatro categorias de renda do Banco Mundial para o Brasil
SELECT four_regions, eight_regions , wb4income
FROM country
WHERE country = 'Brazil';

-- o nome de todos os países com a classificação de renda do Banco Mundial em três níveis igual a Middle income
SELECT country 
FROM country
WHERE wb3income = 'Middle income';

-- o PIB per capita dos países no ano de 2017 da tabela gdp_pc
SELECT country, gdp_pc
FROM gdp_pc
WHERE ref_year = 2017; 

-- os países e anos de referência cuja expectativa de vida ao nascer era de 36.5 anos
SELECT country, ref_year
FROM life_expectancy
WHERE tot_years = 36.5;

-- preço de fechamento das ações da Petrobras no dia 8 de dezembro de 2022.
SELECT close 
FROM petrobras
WHERE date = '2022-12-08';

-- país que tem PIB per capita menor do que 400 dólares
SELECT country, ref_year, gdp_pc
FROM gdp_pc
WHERE gdp_pc < 400; 

-- países que têm projeção de expectativa de vida acima de 94 anos.
SELECT country, ref_year
FROM life_expectancy
WHERE tot_years < 94; 

-- todas as linhas da tabela petrobras com o valor de Close diferente de Adj Clos
SELECT * 
FROM petrobras
WHERE close < > adj close; 