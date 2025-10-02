#Queries de Consulta.

# a execução da terceira querie foi utilizado o seguinte comando para alterar o metodo de pagemaneto da cliente ana
#UPDATE Pedido
#SET `Metodo Pagamento` = 'Pix'
#WHERE idPedido = 3;

USE `E-Commerce`;

#mostra produtos superiores a R$ 2000.00.

SELECT descrição, VALOR FROM produto
WHERE CAST(VALOR AS DECIMAL(10,2)) > 2000.00
ORDER BY CAST(VALOR AS DECIMAL(10,2)) DESC;

#mostra o nome completo dos clientes  e seu endereço.
SELECT 	concat_ws('', Nome, MeioDoNome, SobreNome) AS Nome_Completo,
		Concat( '', Logradouro, Numero, Complemento, Bairro, Cidade, UF) AS Localização
FROM Cliente
WHERE TipoCliente = 'PF';

# mostra quantas vezes um metodo de pagamento foi utilizado.
SELECT `Metodo Pagamento`,
count(idPedido) AS vezes_utilizado,
sum(ValorTotal) AS Total_movimentado
from pedido
group by `Metodo Pagamento`
having vezes_utilizado > 1
order by Total_movimentado desc;

#mostra a relação de produtos em cada pedido junto ao nome do cliente e o status do pedido.
select p.idPedido, p.StatusPedido, c.nome as Nome_cliente, prod.descrição AS Produto, pp.Quandidade
from Pedido p
join cliente c ON p.Cliente_idCliente = c.idCliente
join`pedido_produtos` pp ON p.idPedido = pp.Pedido_idPedido
join produto as prod on pp.Produto_idProduto = prod.idProduto 
order by p.idPedido;