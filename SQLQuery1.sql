USE Empresa_Y

SELECT * 
FROM Pedido 
JOIN Produto ON Pedido.idProduto = Produto.idProduto

SELECT *
FROM Pedido
JOIN Vendedor ON Pedido.idVendedor = Vendedor.idVendedor

SELECT Pedido.idPedido, Pedido.Quantidade, Pedido.Valor, Cliente.Nome AS CLIENTE
FROM Pedido
JOIN CLIENTE ON PEDIDO.idCliente = Cliente.idCliente

SELECT P.idPedido, P.idVendedor, V.Nome
FROM PEDIDO AS P
JOIN VENDEDOR AS V ON P.idVendedor=V.idVendedor

SELECT P.idPedido,P.Valor, P.idVendedor, V.Nome, P.idCliente, C.Nome
FROM Pedido AS P
JOIN Vendedor AS V ON P.idVendedor=V.idVendedor
JOIN Cliente AS C ON P.idCliente=C.idCliente

USE Empresa_X

SELECT *
FROM VENDA
JOIN funcionario ON VENDA.vendedor= funcionario.nome

SELECT *
FROM VENDA
LEFT JOIN funcionario ON VENDA.vendedor= funcionario.nome
WHERE funcionario.nome IS NULL

SELECT *
FROM VENDA
RIGHT JOIN funcionario ON VENDA.vendedor= funcionario.nome
WHERE funcionario.cargo='Vendedor' and venda.quantidade is null


CREATE VIEW view_vendedor_sem_venda as
SELECT        dbo.venda.id, dbo.venda.produto_vend, dbo.venda.marca_vend, dbo.venda.quantidade, dbo.venda.vendedor, dbo.funcionario.id AS Expr1, dbo.funcionario.nome, dbo.funcionario.nascimento, dbo.funcionario.data_contratacao, 
                         dbo.funcionario.cargo, dbo.funcionario.cidade, dbo.funcionario.salario
FROM            dbo.venda RIGHT OUTER JOIN
                         dbo.funcionario ON dbo.venda.vendedor = dbo.funcionario.nome
WHERE        (dbo.funcionario.cargo = 'Vendedor') AND (dbo.venda.vendedor IS NULL)

SELECT * FROM view_vendedor_sem_vendas
WHERE CIDADE='Araras'

SELECT *
FROM funcionario

SELECT CIDADE,COUNT(CIDADE) FROM funcionario
GROUP BY CIDADE

SELECT CARGO,  MAX(SALARIO)
FROM funcionario
GROUP BY cargo

SELECT CIDADE,  SUM(SALARIO)
FROM funcionario
GROUP BY CIDADE

