USE Empresa_X


SELECT	nome
FROM	funcionario

SELECT nome, salario FROM funcionario

select nome, salario, salario + 50 as 'novo_salario'  FROM funcionario


/* CONCATENAÇÃO */
SELECT nome + ' trabalha como: ' + cargo AS 'Nome e função' FROM funcionario
SELECT CONCAT(nome, ' recebe o salário de: ', salario) AS 'NOME E SALARIO' FROM funcionario  /*Funçaõ CONCAT é exclusiva do SQL SERVER */



/* SELECT DISTINCT RETORNA APENAS OS VALORES DIFERENTES (REPETIDOS APARECEM APENAS 1 VEZ) */
SELECT * FROM venda
SELECT DISTINCT marca_vend FROM VENDA

sp_help funcionario

/* utilizando WHERE para consultas */

SELECT * FROM funcionario WHERE salario > 1000

SELECT	nome, nascimento, salario, cargo
FROM	funcionario
WHERE	cargo='Vendedor'

SELECT	*
FROM	funcionario
WHERE	data_contratacao < '2010-01-01'

SELECT	*
FROM	funcionario
WHERE	data_contratacao BETWEEN '2000-01-01' AND '2010-10-10'

SELECT	*
FROM	funcionario
WHERE	data_contratacao NOT BETWEEN '2000-01-01' AND '2010-10-10'

SELECT	nome_prod, estoque 
FROM	produto
WHERE	estoque BETWEEN 0 AND 50


SELECT * FROM funcionario WHERE salario IN (1250, 3500)
SELECT * FROM funcionario WHERE salario NOT IN (5, 8, 10)
SELECT * FROM funcionario WHERE id <> 1		/* <> sinal de diferente */
SELECT * FROM funcionario WHERE id != 1		/* != sinal de diferente */

SELECT nome FROM funcionario WHERE nome LIKE 'Maria%'

SELECT nome FROM funcionario WHERE nome LIKE '%silva%'

SELECT nome FROM funcionario WHERE nome LIKE '___s%'

SELECT nome, data_contratacao FROM funcionario WHERE data_contratacao LIKE '2015%'

SELECT nome FROM funcionario WHERE nome LIKE '[a-c]%'

SELECT nome FROM funcionario WHERE nome LIKE '[^a-c]%' /* ^ funciona como NOT */


SELECT * FROM venda
SELECT * FROM venda WHERE quantidade IS NULL
SELECT * FROM venda WHERE quantidade IS NOT NULL


SELECT nome, cargo, salario	FROM funcionario WHERE (salario > 1500) AND (cargo = 'vendedor')
SELECT nome, cargo, salario, cidade	FROM funcionario WHERE (salario > 2000) OR (cargo = 'gerente')
SELECT nome, cargo, salario, cidade	FROM funcionario WHERE (cidade = 'São Paulo') AND (cargo = 'gerente')

SELECT nome, cargo, salario, cidade	FROM funcionario WHERE (salario > 2000 or cargo = 'vendedor') AND (cidade='São Paulo')


SELECT nome, cargo, salario, cidade	FROM funcionario WHERE NOT cargo = 'gerente'
SELECT nome, cargo, salario, cidade	FROM funcionario WHERE cargo != 'gerente'
SELECT nome, cargo, salario, cidade	FROM funcionario WHERE salario NOT IN (1500, 2500)
SELECT nome, cargo, salario, cidade	FROM funcionario WHERE cargo NOT IN('MOTORISTA', 'GERENTE')

SELECT		*	
FROM		funcionario
ORDER BY	ID DESC


SELECT		*	
FROM		funcionario
ORDER BY	SALARIO DESC


SELECT		*	
FROM		funcionario
WHERE		SALARIO NOT BETWEEN 1500 AND 2500
ORDER BY	SALARIO DESC

SELECT		*	
FROM		funcionario
ORDER BY	3 DESC		/* PODEMOS UTILIZAR A NUMERAÇAO DA COLUNA AO INVES DE NOMEA-LA (3 NESTE CASO REFERE-SE AO CAMPO NASCIMENTO) */

SELECT		*	
FROM		funcionario
WHERE		SALARIO NOT BETWEEN 1500 AND 2500
ORDER BY	SALARIO DESC


SELECT		*, (SALARIO * 0.2) AS PREMIACAO
FROM		funcionario
WHERE		SALARIO NOT BETWEEN 1500 AND 2500
ORDER BY	PREMIACAO DESC


SELECT CONCAT('Ola mundo', ' tudo bem') as resposta

SELECT		CONCAT(NOME, ' NASCEU EM:', nascimento) 
FROM		funcionario
ORDER BY	nascimento DESC

SELECT SUBSTRING('Ola mundo', 2,  5)		/* retorna uma string da posição inicial dada ate a posiçao final dada (contagem começa a partir do 1) */

SELECT REPLACE('JACK AND JUE', 'J', 'BL')

SELECT nome, REPLACE(NOME,'A','*&') AS TROCA FROM funcionario


SELECT LOWER('Ola Mundo')
SELECT UPPER('oLA Mundo')
SELECT nome, REPLACE(UPPER(NOME), ' ', '') FROM funcionario

SELECT LTRIM('     ESPAÇO EM BRANCO')
SELECT RTRIM ('ESPACO EM BRANCO                     ')

SELECT STUFF('Meu exemplo', 4, 0, ' maior')  /* primeiro indica-se a posiçao na string em q deseja alterar, dps seleciona apartir 
											de qual posiçao da segunda string deseja começar a substituir*/


SELECT ROUND(1332.56, -1)
SELECT ABS(-15)
SELECT RAND() * 500				/* RAND RETORNA UM N ALEATORIO ENTRE 0 E 1, MULTIPLICANDO POR NUMEROS MAIORES CONSEGUIMOS OBTER RANDS MAIORES */
SELECT SQRT(81) AS RESULTADO
SELECT POWER(9, 2)

SELECT SUM(salario) from funcionario
SELECT MAX(salario) from funcionario
SELECT MIN(salario) from funcionario
SELECT AVG(SALARIO) AS MEDIA FROM funcionario



SELECT   GETDATE()

SELECT nome, nascimento, DATEPART(MONTH, NASCIMENTO) AS 'MES DE NASCIMENTO' FROM funcionario ORDER BY [MES DE NASCIMENTO] DESC

SELECT NOME, data_contratacao, DATEADD(DAY, 500, data_contratacao) FROM funcionario

SELECT DATEADD(DAY, 60, GETDATE())

SELECT NOME, data_contratacao, DATEDIFF(YEAR, DATA_CONTRATACAO, GETDATE()) AS 'ANOS NA EMPRESA' FROM FUNCIONARIO

SELECT NOME, FORMAT(DATA_CONTRATACAO, 'dd/MM/yyyy') FROM funcionario


SELECT * FROM FUNCIONARIO WHERE SALARIO = (SELECT MAX(salario) FROM funcionario)
SELECT * FROM FUNCIONARIO WHERE SALARIO = (SELECT MIN(SALARIO) FROM funcionario)

SELECT * FROM FUNCIONARIO WHERE SALARIO > (SELECT AVG(SALARIO) FROM funcionario)

SELECT * FROM funcionario
SELECT * FROM venda

SELECT * FROM FUNCIONARIO WHERE NOME = (SELECT VENDEDOR FROM VENDA WHERE QUANTIDADE = (SELECT MAX(QUANTIDADE) FROM venda))

SELECT * FROM PRODUTO
SELECT * FROM VENDA

SELECT * FROM PRODUTO WHERE nome_prod NOT IN (SELECT produto_vend FROM VENDA WHERE quantidade > 150)





SELECT * FROM funcionario

SELECT		NOME, data_contratacao,
CASE		YEAR(DATA_CONTRATACAO)
WHEN		2015 THEN 'CONTRATADO EM 2015'
WHEN		2010 THEN 'CONTRATADO EM 2010'
ELSE		'N/D'
END AS		'ANO DE REFERENCIA'
FROM		funcionario

/*	CONDICIONAIS	*/
SELECT		nome, salario, salario=
CASE
WHEN		salario >=3500 THEN 'OTIMO SALARIO'
WHEN		salario < 3500 AND salario > 1500 THEN 'bom salario'
WHEN		salario <= 1500 THEN 'SALARIO RUIM'
END
FROM		funcionario


SELECT		SALARIO,
IIF			(SALARIO >=2500, 'BOM SALARIO', IIF( SALARIO < 2500 AND SALARIO > 1250, 'SALARIO BOM', 'SALARIO RUIM' )) AS RESULTADO
FROM		funcionario



SELECT		SALARIO, NOME, CIDADE,
CASE		WHEN CIDADE='São Paulo'	THEN
			CASE WHEN SALARIO>=3500 THEN 'BOM SALARIO'
			ELSE 'SALARIO RUIM'
			END
WHEN		CIDADE='ARARAS' THEN
			CASE WHEN SALARIO>=2500 THEN 'BOM SALARIO'
			ELSE 'SALARIO RUIM'
			END
END AS RESULTADO FROM funcionario