-- Garante que todos os comandos serão executados no banco de dados correto
USE `E-Commerce`;

-- 1. PRODUTOS

INSERT INTO `Produto` (`idProduto`, `Categoria`, `Descrição`, `Valor`) VALUES
(101, 'Eletrônicos', 'Notebook Gamer 15.6"', '5500.00'),
(102, 'Fotografia', 'Câmera DSLR Profissional', '3200.50'),
(103, 'Celulares', 'Smartphone 256GB', '1800.00'),
(104, 'Eletrodomésticos', 'Máquina de Café Expresso', '450.75');

-- 2. CLIENTES

INSERT INTO `Cliente` (`Nome`, `MeioDoNome`, `Sobrenome`, `DataDeNascimento`, `TipoCliente`, `CPF`, `CNPJ`, `Logradouro`, `Numero`, `Complemento`, `Bairro`, `Cidade`, `UF`, `CEP`) VALUES
('Ana', 'P', 'Ribeiro', '2001-11-20', 'PF', '11122233344', NULL, 'Avenida Copacabana', '500', 'Bloco C, Apto 101', 'Copacabana', 'Rio de Janeiro', 'RJ', '22020002'),
('Minas Arte & Design', NULL, NULL, NULL, 'PJ', NULL, '22333444000155', 'Rua dos Inconfidentes', '800', 'Sala 2', 'Savassi', 'Belo Horizonte', 'MG', '30140120');

-- 3. FORNECEDORES
INSERT INTO `Fornecedor` (`idFornecedor`, `RazaoSocial`, `CNPJ`) VALUES
(11, 'Global Electronics Holding', '11222333000144'),
(12, 'Office Supplies Inc.', '44555666000177');

-- 4. VENDEDORES TERCEIROS (Terceiro_ Vendedor)

INSERT INTO `Terceiro_ Vendedor` (`IDVendedor`, `Razão Social`, `Logradouro`, `Bairro`, `Numero`, `Cidade`, `UF`, `CEP`) VALUES
(11, 'Eletro Mix Varejo', 'Rua das Araucárias', 'Água Verde', '1500', 'Curitiba', 'PR', '80620000'),
(12, 'Café do Sul Ltda', 'Avenida Borges de Medeiros', 'Centro Histórico', '200', 'Porto Alegre', 'RS', '90010150');

-- 5. ESTOQUE
INSERT INTO `Estoque` (`idEstoque`, `Logradouro`, `Bairro`, `Numero`, `Cidade`, `UF`) VALUES
(11, 'Rodovia Anhanguera', 'Jardim Jaraguá', 'KM 18', 'São Paulo', 'SP');

-- 6. RELACIONAMENTOS DE PRODUTOS

INSERT INTO `ProdutoEstoque` (`Produto_idProduto`, `Estoque_idEstoque`, `Quandidade`) VALUES
(101, 11, 25), -- 25 Notebooks
(102, 11, 15), -- 15 Câmeras
(103, 11, 200),-- 200 Smartphones
(104, 11, 80); -- 80 Máquinas de Café


INSERT INTO `Disponibilizando um Produto` (`Fornecedor_idFornecedor`, `Produto_idProduto`) VALUES
(11, 101), -- Global Electronics fornece o Notebook
(11, 102), -- Global Electronics fornece a Câmera
(11, 103), -- Global Electronics fornece o Smartphone
(12, 104); -- Office Supplies fornece a Máquina de Café


INSERT INTO `EstoqueVendedor` (`Terceiro - Vendedor_idTerceiro - Vendedor`, `Produto_idProduto`, `Quantidade`) VALUES
(11, 103, 50), -- Eletro Mix vende 50 Smartphones
(12, 104, 30); -- Café do Sul vende 30 Máquinas de Café

-- 7. PEDIDOS
INSERT INTO `Pedido` (`StatusPedido`, `Descrição`, `Frete`, `SubTotal`, `Desconto`, `ValorTotal`, `DataPagamento`, `DataEnvio`, `CodRastreio`, `Transportadora`, `Metodo Pagamento`, `Cliente_idCliente`) VALUES
-- Pedido para cliente Ana, já entregue
('Entregue', 'Compra de eletrônicos', 35.50, 7300.00, 100.00, 7235.50, '2025-10-01 19:00:00', '2025-10-02 11:00:00', 'PY111222333BR', 'Sequoia', 'Pix', 3),
-- Pedido para a empresa Minas Arte, enviado
('Enviado', 'Máquina de café para escritório', 22.00, 450.75, 0.00, 472.75, '2025-10-02 09:15:00', '2025-10-02 14:00:00', 'LOG445566778BR', 'Loggi', 'Boleto', 4),
-- Outro pedido para cliente Ana, ainda em andamento
('Em andamento', 'Presente de aniversário', 12.00, 1800.00, 50.00, 1762.00, '2025-10-02 13:00:00', NULL, NULL, NULL, 'Crédito', 3);

-- 8. ITENS DOS PEDIDOS (Pedido_Produtos)
INSERT INTO `Pedido_Produtos` (`Pedido_idPedido`, `Produto_idProduto`, `Quandidade`) VALUES
(3, 101, 1), -- Pedido 3 tem 1 Notebook Gamer
(3, 103, 1), -- Pedido 3 também tem 1 Smartphone
(4, 104, 1), -- Pedido 4 tem 1 Máquina de Café
(5, 103, 1); -- Pedido 5 tem 1 Smartphone


