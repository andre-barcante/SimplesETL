##Objetivo:
- Fazer a modelagem conceitual dos dados;
- Criação da infraestrutura necessária;
- Criação de todos os artefatos necessários para carregar os arquivos para o banco criado;
- Desenvolvimento de SCRIPT para análise de dados;
- (opcional) Criar um relatório em qualquer ferramenta de visualização de dados.

##Importar os seguintes arquivos para o banco de dados (sua escolha):
- Sales.SpecialOfferProduct.csv
- Sales.SalesOrderHeader.csv
- Sales.Customer.csv
- Sales.SalesOrderDetail.csv
- Person.Person.csv
- Production.Product.csv

##Análise de dados:
- Escreva uma query que retorna a quantidade de linhas na tabela Sales.SalesOrderDetail pelo campo SalesOrderID, desde que tenham pelo menos três linhas de detalhes.
- Escreva uma query que ligue as tabelas Sales.SalesOrderDetail, Sales.SpecialOfferProduct e Production.Product e retorne os 3 produtos (Name) mais vendidos (pela soma de OrderQty), agrupados pelo número de dias para manufatura (DaysToManufacture).
- Escreva uma query ligando as tabelas Person.Person, Sales.Customer e Sales.SalesOrderHeader de forma a obter uma lista de nomes de clientes e uma contagem de pedidos efetuados.
- Escreva uma query usando as tabelas Sales.SalesOrderHeader, Sales.SalesOrderDetail e Production.Product, de forma a obter a soma total de produtos (OrderQty) por ProductID e OrderDate.
- Escreva uma query mostrando os campos SalesOrderID, OrderDate e TotalDue da tabela Sales.SalesOrderHeader. Obtenha apenas as linhas onde a ordem tenha sido feita durante o mês de setembro/2011 e o total devido esteja acima de 1.000. Ordene pelo total devido decrescente.

##O que fazer:
Para a realização deste teste, você deve utilizar alguma das principais nuvens públicas (Azure, AWS, GCP). Pedimos também que compartilhe conosco o código fonte (preferencialmente através de um repositório git público). 
A nossa expectativa é um processo de ingestão de dados utilizando os serviços da nuvem escolhida.
Além disso, inclua um arquivo README.md onde você deve compartilhar as decisões de arquitetura, implementação e instruções sobre como executar o software. Caso tenha criado um relatório em alguma ferramenta de visualização de dados, inclua um screenshot do mesmo no arquivo.

##Resolução adotada:
