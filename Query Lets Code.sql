CREATE TABLE cliente (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nome varchar(100) NOT NULL,
	data_de_nascimento date NOT NULL,
    	email varchar(100) NOT NULL
);

CREATE TABLE dependente (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	titular_id int NOT NULL,
	dependente_id int NOT NULL GENERATED ALWAYS AS IDENTITY,
	CONSTRAINT titular_id_fkey FOREIGN KEY (titular_id) REFERENCES cliente(id)
);

CREATE TABLE produto (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	codigo_de_registro_ans int NOT NULL,
	descricao varchar(255) NOT NULL,
	valor money NOT NULL -- number(9, 2) for oracle
);

CREATE TABLE contrato (
	id int NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	titular_id int NOT NULL,
	dependente_id int NOT NULL,
	data_inicio_vigencia date NOT NULL,
	produto_id int NOT NULL,
	CONSTRAINT titular_id_fkey FOREIGN KEY (titular_id) REFERENCES cliente(id),
	CONSTRAINT dependente_id_fkey FOREIGN KEY (dependente_id) REFERENCES dependente(id),
	CONSTRAINT produto_id_fkey FOREIGN KEY (produto_id) REFERENCES produto(id)
);

-- Inserindo 5 clientes
INSERT INTO cliente (nome, data_de_nascimento, email) VALUES('Allan Rafael', '2000-01-01', 'allan@gmail.com');
INSERT INTO cliente (nome, data_de_nascimento, email) VALUES('Bruno Mars', '2002-02-02', 'bruno@gmail.com');
INSERT INTO cliente (nome, data_de_nascimento, email) VALUES('Donald Trump', '2003-03-03', 'donald@gmail.com');
INSERT INTO cliente (nome, data_de_nascimento, email) VALUES('Jessé Haniel', '2004-04-04', 'jesse@gmail.com');
INSERT INTO cliente (nome, data_de_nascimento, email) VALUES('Veio Havan', '2005-05-05', 'veiohavan@gmail.com');

-- Inserindo 5 dependentes
INSERT INTO dependente (titular_id) VALUES(1);
INSERT INTO dependente (titular_id) VALUES(2);
INSERT INTO dependente (titular_id) VALUES(3);
INSERT INTO dependente (titular_id) VALUES(4);
INSERT INTO dependente (titular_id) VALUES(5);

-- Inserindo 5 produtos
INSERT INTO produto(codigo_de_registro_ans, descricao, valor) VALUES(1111, 'Plano Básico', 250);
INSERT INTO produto(codigo_de_registro_ans, descricao, valor) VALUES(2222, 'Plano Médio', 500);
INSERT INTO produto(codigo_de_registro_ans, descricao, valor) VALUES(3333, 'Plano Alto', 750);
INSERT INTO produto(codigo_de_registro_ans, descricao, valor) VALUES(4444, 'Plano Premium', 1000);
INSERT INTO produto(codigo_de_registro_ans, descricao, valor) VALUES(5555, 'Plano Premium Plus', 2000);

-- Inserindo 5 contratos
INSERT INTO contrato(titular_id, dependente_id, data_inicio_vigencia, produto_id) VALUES(1, 1, '2022-03-23', 1);
INSERT INTO contrato(titular_id, dependente_id, data_inicio_vigencia, produto_id) VALUES(2, 2, '2022-03-23', 2);
INSERT INTO contrato(titular_id, dependente_id, data_inicio_vigencia, produto_id) VALUES(3, 3, '2022-03-23', 3);
INSERT INTO contrato(titular_id, dependente_id, data_inicio_vigencia, produto_id) VALUES(4, 4, '2022-03-23', 4);
INSERT INTO contrato(titular_id, dependente_id, data_inicio_vigencia, produto_id) VALUES(5, 5, '2022-03-23', 5);
