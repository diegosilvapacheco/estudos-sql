CREATE DATABASE bank_marketing;
USE bank_marketing;

-- Amostra de campos que possuem unknown
SELECT * FROM bank
WHERE job = 'unknown'
OR contact = 'unknown'
OR education = 'unknown'
OR poutcome = 'unknown'
LIMIT 10;

-- Qual percentual de sucesso da campanha?
SELECT COUNT(*)/(SELECT COUNT(*) FROM bank)
FROM bank
WHERE y = 'yes';
-- A empresa quer clientes com bastante capital. Será que consegue?
SELECT y,
       count(*) AS qtd_clientes,
       avg(balance) AS avg_balance,
       stddev(balance) AS std_balance,
       min(balance) AS min_balance,
       max(balance) AS max_balance
FROM bank
GROUP BY y;

-- A taxa de sucesso da campanha muda de com o meio de contato?
SELECT y, 
       contact, 
       count(*) AS qtd_clientes 
FROM bank 
GROUP BY y, contact;

-- Como o padrão de idade e estado civil muda entre assinantes e não assinantes?
SELECT y,
       avg(age) AS avg_age,
       stddev(age) AS std_age
FROM bank
GROUP BY y;

SELECT marital,
       AVG(CASE WHEN y = 'yes' THEN 1 ELSE 0 END) AS y_yes,
       AVG(CASE WHEN y = 'no' THEN 1 ELSE 0 END) AS y_no
FROM bank
GROUP BY marital;