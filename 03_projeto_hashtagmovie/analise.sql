USE hashtagmovie;

-- Conhecendo as tabelas do banco de dados.
SELECT * FROM alugueis;
SELECT * FROM atores;
SELECT * FROM atuacoes;
SELECT * FROM clientes;
SELECT * FROM filmes;

-- CASE 1. Você deverá começar fazendo uma análise para descobrir o preço médio de aluguel dos filmes.
SELECT AVG (preco_aluguel) FROM filmes;

-- CASE 2. Descobrir qual é o preço médio para cada gênero de filme.
SELECT 
    genero,
    ROUND(AVG(preco_aluguel), 2) AS preco_medio,
    COUNT(*) AS qtd_filmes
FROM filmes
GROUP BY genero
ORDER BY preco_medio;

-- CASE 3: Fazer a mesma análise, mas considerando apenas os filmes com ANO_LANCAMENTO igual a 2011.
SELECT 
    genero,
    ROUND(AVG(preco_aluguel), 2) AS preco_medio,
    COUNT(*) AS qtd_filmes
FROM filmes
WHERE ano_lancamento = 2011
GROUP BY genero
ORDER BY preco_medio;

-- CASE 4. Fazer uma análise de desempenho dos alugueis. 
-- Para isso, uma análise comum é identificar quais aluguéis tiveram nota acima da média.
SELECT * FROM alugueis
WHERE nota >= (SELECT AVG(nota) FROM alugueis);

-- CASE 5. Crie uma view para guardar o resultado do SELECT abaixo.
CREATE VIEW resultado AS
SELECT
	genero,
	ROUND(AVG(preco_aluguel), 2) AS media_preco,
    COUNT(*) AS qtd_filmes
FROM filmes
GROUP BY genero;

SELECT * FROM resultado;

