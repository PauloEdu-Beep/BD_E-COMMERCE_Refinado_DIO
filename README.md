# BD_E-COMMERCE_Refinado  
(segue arquivos em anexo no repositório)
## Objetivo  
O seguinte processo visa refinar um banco de dados de uma plataforma   
e-commerce desenvolvido como projeto prático da DIO usando MySQL Workbench  
Adicionando os seguintes elementos:  
- Cliente PJ e PF;  
- Pagamento;
- Entrega;
## Ferramentas utilizadas:  
MySQLWorkBench;  
GitHub;

## Implementação:  
A implementação foi realizada da seguinte maneira;

**1 - Cliente PJ e PF:**  
Como a entidade 'cliente' armazena os dados comuns dos clientes  
a implementação de PF e PJ visa especializar o cliente armazenando  
'CPF' para pessoa fisica e 'CNPJ' para pessoa juridica usando a relação  
1 para 1 para garantir exclusividade.

**2 - Multiplos metodos de pagamento:**  
A tabela de 'metodo pagamento cliente' que se  
relaciona de maneira direta com a entidade 'cliente'  
foi criada para permitir que os clientes posssuam múltiplos  
métodos de pagamento em seus perfis.  
com a entidade 'pedido' fazendo referencia ao método de pagamento  
escolhido na hora da compra.

**3 - Rastreio de entrega:**  
Para o seguinte caso foi adicionado o atributo 'metodo rastreio' na   
entidade 'pedido', permitindo que o cliente possa rastrear a sua entrega.
