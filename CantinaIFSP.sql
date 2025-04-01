CREATE DATABASE IF NOT EXISTS cantinaIFSP;
USE cantinaIFSP;

CREATE TABLE IF NOT EXISTS CategoriaPreco (
	IDPreco INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Cor CHAR(15),
    Preco DOUBLE CHECK (Preco > 0)
);

CREATE TABLE IF NOT EXISTS Produtos (
	IDProduto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Descricao CHAR(155) UNIQUE,
    Tamanho CHAR(155) DEFAULT 'Médio',
    Preco INT,
    Tipo CHAR(155),
    FOREIGN KEY (Preco) REFERENCES CategoriaPreco(IDPreco)
);
    
INSERT INTO CategoriaPreco(Cor, Preco) VALUES ('Vermelho', 10.00) ,('Amarelo', 7.00), ('Azul', 6.00), ('Verde', 3.50);
-- INSERT INTO CategoriaPreco(Cor, Preco) VALUES ('Branco', 0);
INSERT INTO Produtos(Descricao, Tamanho, Preco, Tipo) VALUES ('Coxinha de Frango', 'Médio', 2, 'Frito'), ('Enroladinho de Presunto e Queijo', 'Grande', 2, 'Frito'), ('Pastel de Carne', 'Gigante', 1, 'Frito'), ('Empada de Frango', 'Pequena', 2, 'Assado'), ('Kibe Frito', 'Pequeno', 2, 'Frito'), ('Esfiha de Carne', 'Médio', 3, 'Assado'); 

-- Teste Default
INSERT INTO Produtos(Descricao, Preco, Tipo) VALUES ('Espetinho de Frango', 1, 'Frito');

-- Teste Unique
-- INSERT INTO Produtos(Descricao, Preco, Tipo) VALUES ('Enroladinho de Presunto e Queijo', 2, 'Assado');

-- Teste Check
-- INSERT INTO Produtos(Descricao, Preco, Tipo) VALUES ('Hambúrguer de Cheddar', 5, 'Assado');

SELECT P.IDProduto, P.Descricao, P.Tamanho, P.Tipo, C.Preco 
    FROM Produtos P INNER JOIN 
    CategoriaPreco C ON P.Preco = C.IDPreco
    ORDER BY P.IDProduto ASC;