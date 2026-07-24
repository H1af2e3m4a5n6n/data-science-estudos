/*
==========================================================
PROJETO: ANÁLISE DE VENDAS - TECHSTORE BRASIL
Autor: Karina Hafemann
Objetivo:
Criar um banco de dados relacional para análise de vendas
utilizando SQL Server.
==========================================================
*/

----------------------------------------------------------
-- Exclui as tabelas caso já existam
----------------------------------------------------------

DROP TABLE IF EXISTS ItensPedido;
DROP TABLE IF EXISTS Pedidos;
DROP TABLE IF EXISTS Produtos;
DROP TABLE IF EXISTS Categorias;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Vendedores;

----------------------------------------------------------
-- Tabela Clientes
----------------------------------------------------------

CREATE TABLE Clientes(

    ClienteID INT PRIMARY KEY IDENTITY(1,1),

    Nome VARCHAR(100) NOT NULL,

    Cidade VARCHAR(60),

    Estado CHAR(2),

    DataCadastro DATE

);

----------------------------------------------------------
-- Tabela Categorias
----------------------------------------------------------

CREATE TABLE Categorias(

    CategoriaID INT PRIMARY KEY IDENTITY(1,1),

    NomeCategoria VARCHAR(60)

);

----------------------------------------------------------
-- Tabela Produtos
----------------------------------------------------------

CREATE TABLE Produtos(

    ProdutoID INT PRIMARY KEY IDENTITY(1,1),

    NomeProduto VARCHAR(100),

    CategoriaID INT,

    Preco DECIMAL(10,2),

    Estoque INT,

    FOREIGN KEY (CategoriaID)
        REFERENCES Categorias(CategoriaID)

);

----------------------------------------------------------
-- Tabela Vendedores
----------------------------------------------------------

CREATE TABLE Vendedores(

    VendedorID INT PRIMARY KEY IDENTITY(1,1),

    Nome VARCHAR(100),

    MetaMensal DECIMAL(10,2)

);

----------------------------------------------------------
-- Tabela Pedidos
----------------------------------------------------------

CREATE TABLE Pedidos(

    PedidoID INT PRIMARY KEY IDENTITY(1,1),

    ClienteID INT,

    VendedorID INT,

    DataPedido DATE,

    FOREIGN KEY (ClienteID)
        REFERENCES Clientes(ClienteID),

    FOREIGN KEY (VendedorID)
        REFERENCES Vendedores(VendedorID)

);

----------------------------------------------------------
-- Tabela ItensPedido
----------------------------------------------------------

CREATE TABLE ItensPedido(

    ItemID INT PRIMARY KEY IDENTITY(1,1),

    PedidoID INT,

    ProdutoID INT,

    Quantidade INT,

    ValorUnitario DECIMAL(10,2),

    FOREIGN KEY (PedidoID)
        REFERENCES Pedidos(PedidoID),

    FOREIGN KEY (ProdutoID)
        REFERENCES Produtos(ProdutoID)

);

----------------------------------------------------------
-- Conferindo as tabelas criadas
----------------------------------------------------------

SELECT * FROM Clientes;
SELECT * FROM Categorias;
SELECT * FROM Produtos;
SELECT * FROM Vendedores;
SELECT * FROM Pedidos;
SELECT * FROM ItensPedido;


----------------------------------------------------------
-- ETAPA 2 - Inserção dos Dados
----------------------------------------------------------


INSERT INTO Categorias (NomeCategoria)
VALUES
('Notebooks'),
('Smartphones'),
('Monitores'),
('Periféricos'),
('Componentes'),
('Acessórios');


INSERT INTO Vendedores (Nome, MetaMensal)
VALUES
('Ana Souza',45000),
('Carlos Lima',50000),
('Fernanda Rocha',55000),
('Lucas Martins',47000),
('Mariana Alves',52000),
('Rafael Costa',48000),
('Juliana Gomes',53000),
('Pedro Henrique',50000);

INSERT INTO Clientes
(Nome,Cidade,Estado,DataCadastro)

VALUES

('João Pedro','São Paulo','SP','2023-01-15'),
('Maria Oliveira','Campinas','SP','2023-02-10'),
('Carlos Henrique','Sorocaba','SP','2023-02-25'),
('Fernanda Lima','Curitiba','PR','2023-03-11'),
('Patrícia Souza','Rio de Janeiro','RJ','2023-04-05'),
('Marcos Silva','Belo Horizonte','MG','2023-04-18'),
('Amanda Costa','Londrina','PR','2023-05-02'),
('Ricardo Alves','São Paulo','SP','2023-05-15'),
('Camila Rocha','Santos','SP','2023-06-01'),
('Bruno Ferreira','Guarulhos','SP','2023-06-18'),

('Juliana Gomes','Osasco','SP','2023-07-10'),
('Eduardo Martins','Barueri','SP','2023-07-20'),
('Vanessa Ribeiro','Jundiaí','SP','2023-08-04'),
('Felipe Castro','Ribeirão Preto','SP','2023-08-20'),
('Tatiane Moraes','São José dos Campos','SP','2023-09-10'),

('Gabriel Oliveira','Brasília','DF','2023-09-25'),
('Larissa Mendes','Salvador','BA','2023-10-02'),
('André Pereira','Fortaleza','CE','2023-10-15'),
('Renata Silva','Recife','PE','2023-11-03'),
('Thiago Santos','Manaus','AM','2023-11-28');


INSERT INTO Produtos

(NomeProduto,CategoriaID,Preco,Estoque)

VALUES

('Notebook Dell Inspiron',1,4200,18),
('Notebook Lenovo IdeaPad',1,3800,15),
('MacBook Air M2',1,9200,8),
('Notebook Acer Aspire',1,3500,12),

('iPhone 15',2,6500,20),
('Samsung Galaxy S24',2,5200,22),
('Motorola Edge 50',2,3400,18),
('Xiaomi Redmi Note 13',2,2200,35),

('Monitor LG 24"',3,950,25),
('Monitor Samsung 27"',3,1450,18),
('Monitor Gamer AOC 165Hz',3,1750,10),

('Mouse Logitech',4,180,40),
('Teclado Mecânico Redragon',4,320,28),
('Headset HyperX',4,430,20),
('Webcam Logitech',4,390,15),

('SSD Kingston 1TB',5,520,30),
('Memória RAM 16GB',5,360,40),
('Placa de Vídeo RTX 4060',5,2500,12),
('Fonte Corsair 650W',5,490,20),

('Cabo HDMI',6,60,100),
('Mouse Pad Gamer',6,80,70),
('Suporte Notebook',6,120,40),
('Hub USB',6,140,35),
('Carregador USB-C',6,180,25);


SELECT * FROM Clientes;

SELECT * FROM Produtos;

SELECT * FROM Categorias;

SELECT * FROM Vendedores;