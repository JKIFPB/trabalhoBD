create schema pessoa; 

create table pessoa.pessoa(
	id_pessoa int,
	nome varchar(45),
	telefone varchar(45),
	primary key(id_pessoa)

);

create table pessoa.cliente(
	id_cliente int,
	cpf bigint,
	nu_seq_pessoa int,
	primary key(id_cliente),
	foreign key(nu_seq_pessoa)
	references pessoa.pessoa(id_pessoa)	
);

create table pessoa.proprietario(
	id_proprietario int,
	nu_seq_pessoa int,
	primary key(id_proprietario),
	foreign key(nu_seq_pessoa)
	references pessoa.pessoa(id_pessoa)
);

create table pessoa.corretor(
	id_corretor int,
	matricula varchar(45),
	nu_seq_pessoa int,
	primary key(id_corretor),
	foreign key(nu_seq_pessoa)
	references pessoa.pessoa(id_pessoa)
);

create table pessoa.contato(
	id_contato int,
	telefone varchar(45),
	celular  varchar(45),
	email    varchar(45),
	nu_seq_pessoa int,
	primary key(id_contato),
	foreign key (nu_seq_pessoa)
	references pessoa.pessoa(id_pessoa)
		
);

create table pessoa.endereco_pessoa(
	id_endereco int,
	numero int,
	cep int,
	complemento varchar(45),
	nu_seq_pessoa int,
	nu_seq_uf int,
	nu_seq_municipio int,
	logradouro_id_logradouro int,
	bairro_id_bairro int,
	primary key(id_endereco),
	foreign key(nu_seq_pessoa)
	references pessoa.pessoa(id_pessoa),
	foreign key(nu_seq_uf)
	references comum.uf(id_uf),
	foreign key(nu_seq_municipio)
	references comum.municipio(cod_municipio),
	foreign key(logradouro_id_logradouro)
	references comum.logradouro(id_logradouro),
	foreign key(bairro_id_bairro)
	references comum.bairro(id_bairro)
);

create schema comum;

create table comum.uf(
	id_uf int,
	ds_uf varchar(45),
	primary key(id_uf)
);

create table comum.municipio(
	cod_municipio int,
	ds_municipio varchar(45),
	nu_seq_uf int,
	primary key(cod_municipio),
	foreign key(nu_seq_uf)
	references comum.uf(id_uf)
);

create table comum.logradouro(
	id_logradouro int,
	ds_logradouro varchar(45),
	nu_seq_municipio int,
	primary key(id_logradouro),
	foreign key(nu_seq_municipio)
	references comum.municipio(cod_municipio)
);

create table comum.bairro(
	id_bairro int,
	logradouro_id_logradouro int,
	primary key(id_bairro),
	foreign key(logradouro_id_logradouro)
	references comum.logradouro(id_logradouro)
);

create schema contrato; 

create table contrato.tipo_contrato(
	id_tipo_contrato int,
	ds_tipo_contrato varchar(45),
	primary key(id_tipo_contrato)
);


create table contrato.contrato(
	id_contrato int,
	nu_seq_cliente int,
	nu_seq_proprietario int,
	nu_seq_corretor int,
	tipo_contrato_id_tipo_contrato int,
	primary key(id_contrato),
	foreign key(nu_seq_cliente)
	references pessoa.cliente(id_cliente),
	foreign key(nu_seq_proprietario)
	references pessoa.proprietario(id_proprietario),
	foreign key(nu_seq_corretor)
	references pessoa.corretor(id_corretor),
	foreign key(tipo_contrato_id_tipo_contrato)
	references contrato.tipo_contrato(id_tipo_contrato)
);

create table contrato.detalhe_contrato(
	id_detalhe_contrato int,
	ds_detalhe_contrato varchar(45),
	valor numeric,
	nu_seq_contrato int,
	primary key(id_detalhe_contrato),
	foreign key(nu_seq_contrato)
	references contrato.contrato(id_contrato)
);

create schema imovel;

create table imovel.tipo_imovel(
	id_tipo_imovel int,
	ds_tipo_imovel varchar(45),
	primary key(id_tipo_imovel)
);


create table imovel.imovel(
	id_imovel int,
	ds_imovel varchar(45),
	area numeric,
	nu_seq_proprietario int,
	nu_seq_tipo_imovel int,
	imovelcol varchar(45),
	primary key(id_imovel),
	foreign key(nu_seq_proprietario)
	references pessoa.proprietario(id_proprietario),
	foreign key(nu_seq_tipo_imovel)
	references imovel.tipo_imovel(id_tipo_imovel)
);

create table imovel.endereco_imovel(
	id_endereco int,
	numero int,
	cep int,
	complemento varchar(45),
	nu_seq_uf int,
	nu_seq_municipio int,
	logradouro_id_logradouro int,
	bairro_id_bairro int,
	nu_seq_imovel int,
	primary key(id_endereco),
	foreign key(nu_seq_uf)
	references comum.uf(id_uf),
	foreign key(nu_seq_municipio)
	references comum.municipio(cod_municipio),
	foreign key(logradouro_id_logradouro)
	references comum.logradouro(id_logradouro),
	foreign key(bairro_id_bairro)
	references comum.bairro(id_bairro),
	foreign key(nu_seq_imovel)
	references imovel.imovel(id_imovel)
	
);




























































































