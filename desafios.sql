CREATE DATABASE "Loja";

USE "Loja";

CREATE TABLE ProdutoCategoria (
	Id		INT PRIMARY KEY,
	Nome	VARCHAR(100) NOT NULL
);

CREATE TABLE Produto (
	Id			INT PRIMARY KEY,
	Nome		VARCHAR(100) NOT NULL,
	CategoriaId INT NOT NULL,
	FOREIGN KEY (CategoriaId) REFERENCES ProdutoCategoria(Id)
);

CREATE TABLE ProdutoEstoque (
	Id			INT PRIMARY KEY NOT NULL,
	Qtde		INT NOT NULL,
	ProdutoId	INT NOT NULL,
	FOREIGN KEY (ProdutoId) REFERENCES Produto(Id)
);

INSERT INTO ProdutoCategoria (Id, Nome) VALUES
(1, 'Roupas'),
(2, 'Eletrônicos'),
(3, 'Pets');

INSERT INTO Produto (Id, Nome, CategoriaId) VALUES
(1, 'Calça Jeans', 1),
(2, 'Camisa Polo', 1),
(3, 'Bermuda', 1),
(4, 'Notebook', 2),
(5, 'SmartWatch', 2),
(6, 'Coleira para Cachorro', 3),
(7, 'Caixa de Areia', 3);

INSERT INTO ProdutoEstoque (Id, Qtde, ProdutoId) VALUES
(1, 10, 1),
(2, 15, 2),
(3, 12, 3),
(4, 25, 4),
(5, 12, 5),
(6, 17, 6),
(7, 10, 7);

-- Desafio 1
SELECT
	P.Nome AS NomeProduto,
	C.Nome AS NomeCategoria,
	E.Qtde AS QtdeEstoque
FROM Produto P
INNER JOIN ProdutoCategoria C ON P.CategoriaId = C.Id
INNER JOIN ProdutoEstoque E ON P.Id = E.ProdutoId

-- Desafio 2
DELETE E
FROM ProdutoEstoque E
INNER JOIN Produto P ON E.ProdutoId = P.Id
INNER JOIN ProdutoCategoria C ON P.CategoriaId = C.Id
WHERE CategoriaId = 1;

DELETE P
FROM Produto P
INNER JOIN ProdutoCategoria C ON P.CategoriaId = C.Id
WHERE CategoriaId = 1;

-- Desafio 3
CREATE TABLE Clientes (
	Id				INT PRIMARY KEY IDENTITY(1,1),
	Titulo			VARCHAr(5),
	PrimeiroNome	VARCHAR(20) NOT NULL,
	InicialMeio		CHAR(1),
	UltimoNome		VARCHAR(50) NOT NULL
);

INSERT INTO Clientes (Titulo, PrimeiroNome, InicialMeio, UltimoNome) VALUES
('Sr', 'Matheus', 'K', 'Rodrigues de Souza'),
('Sra', 'Giovanna', NULL, 'Grigolato'),
('Dr', 'Pedro', 'H', 'Silva'),
('', 'Maria', 'C', 'Santos'),
('Dra', 'Manuela', NULL, 'Souza');

SELECT DISTINCT
    CASE 
        WHEN Titulo IS NOT NULL THEN Titulo + ' '
        ELSE ''
    END
    + PrimeiroNome + ' '
    + CASE 
        WHEN InicialMeio IS NOT NULL THEN InicialMeio + '. '
        ELSE ''
    END
    + UltimoNome AS NomeCompleto
FROM Clientes;