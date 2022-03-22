CREATE TABLE health_insurance.cliente (
	id int NOT NULL PRIMARY KEY,
	nome varchar NOT NULL,
	data_de_nascimento varchar(10) NOT NULL
);

CREATE TABLE health_insurance.dependente (
	id int NOT NULL PRIMARY KEY,
	titular_id int NOT NULL,
	dependente_id int NOT NULL,
	CONSTRAINT dependente_titular_id_fkey FOREIGN KEY (titular_id) REFERENCES health_insurance.cliente(id),
	CONSTRAINT dependente_dependente_id_fkey FOREIGN KEY (dependente_id) REFERENCES health_insurance.cliente(id)
);

CREATE TABLE health_insurance.produto (
	codigo_de_registro_ans int4 NOT NULL PRIMARY KEY,
	descricao varchar NOT NULL,
	valor money NOT NULL
);

CREATE TABLE health_insurance.contrato (
	id int4 NOT NULL PRIMARY KEY,
	titular_id int NOT NULL,
	dependente_id int NOT NULL,
	data_inicio_vigencia date NOT NULL,
	produto_id int NOT NULL,
	CONSTRAINT contrato_titular_id_fkey FOREIGN KEY (titular_id) REFERENCES health_insurance.cliente(id),
	CONSTRAINT contrato_dependente_id_fkey FOREIGN KEY (dependente_id) REFERENCES health_insurance.dependente(id),
	CONSTRAINT contrato_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES health_insurance.produto(codigo_de_registro_ans)
);
