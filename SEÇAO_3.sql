USE Empresa_X

SP_HELP FUNCIONARIO

INSERT INTO funcionario(nome, nascimento, data_contratacao, cargo, cidade,salario)
VALUES ('JOAO SILVA', '1982-01-09', '2015-10-10', 'Vendedor', 'São Paulo', 6500)


select * from funcionario
DELETE FROM funcionario WHERE id=1001


DBCC CHECKIDENT('funcionario', RESEED, 21)



USE Empresa_Y

SP_HELP PEDIDO

INSERT INTO pedido(idProduto, idVendedor, idCliente, Quantidade, Valor)
values (1, 4, 5, 20, 500)

SELECT *
FROM Pedido

select *
from Cliente

SELECT			V.*, P.Quantidade, P.Valor
FROM			Vendedor AS V
INNER JOIN		Pedido AS P
ON				V.idVendedor=P.idVendedor

SELECT *
FROM Pedido

SELECT			V.NOME, V.idVendedor, SUM(P.Quantidade), SUM(P.Valor)
FROM			Vendedor AS V
INNER JOIN		Pedido AS P
ON				V.idVendedor=P.idVendedor
WHERE			V.idVendedor=1
GROUP BY		V.NOME, V.idVendedor

SELECT * FROM Produto



USE Empresa_Y

SELECT *
FROM	Vendedor

INSERT INTO Vendedor (nome)
VALUES ('Roberto Carlos')

SELECT *
FROM Cliente

INSERT INTO Cliente(Nome)
VALUES	('José da Silva')

DELETE FROM Cliente WHERE idCliente=6

SELECT *
FROM Produto


SELECT *
FROM Pedido


INSERT INTO Pedido(idVendedor, idCliente,idProduto, Quantidade, Valor)
SELECT			Vendedor.idVendedor, Cliente.idCliente, Produto.idProduto, 200, 2000
FROM			Vendedor, Cliente, Produto
WHERE			Vendedor.Nome='Roberto Carlos'
AND				Cliente.Nome='José da Silva'
AND				Produto.Descrição='iPAD'



UPDATE		Vendedor
SET			NOME='Josias Silva'
WHERE		idVendedor=1

SELECT *
FROM	Vendedor




USE Empresa_X

SELECT	*
FROM	funcionario

UPDATE funcionario
SET NOME='Josias da Silva' WHERE ID=1

UPDATE	funcionario
SET		nascimento='1985-10-10', cargo='Gerente', salario=1500 WHERE	ID=6

UPDATE	funcionario
SET		salario=salario * 1.10 WHERE salario=1250


UPDATE	funcionario
SET		salario= salario + 200 
WHERE	salario=(SELECT MIN(SALARIO) FROM funcionario)


SELECT	* 
FROM	produto

/* NESTE EX NOMEAMO A TRANSACTIO MAS PODE SER FEITO SEM NOMEAÇAO */
 
BEGIN TRAN EXEMPLO
DELETE FROM produto WHERE ID=1

DELETE FROM produto WHERE estoque>20

ROLLBACK TRAN EXEMPLO	/* DESFAZ */
COMMIT TRAN EXEMPLO		/* CONFIRMA */