-- a) Crie o modelo físico do banco proposto na imagem em anexo.
-- Comando para deletar uma table "drop table nomedatabela;"
create database BANCO_URNA;
use BANCO_URNA;

create table partido(
id_partido int not null primary key auto_increment,
nome varchar(80) not null,
sigla varchar(15) not null
);
-- b) Faça a inserção de 03 registros por tabela.
insert into partido values (default,"Partido dos Trabalhadores","PT"),
(default,"Partido Liberal", "PL"),
(default, "Partido Socialismo e Liberdade","PSOL");
-- c) Atualize um dado a sua escolha do primeiro registro de cada tabela
update partido set nome = "Partido S e L" where id_partido = "3";
-- d) Faça uma consulta em que mostre apenas a coluna onde você fez a atualização
select nome from partido;
-- e) Delete o segundo registro de cada tabela.
delete from partido where id_partido = "2";
select*from partido;







create table candidato(
id_candidato int not null primary key auto_increment,
nome_candidato varchar(80) not null,
endereco_candidato varchar(120) not null,
-- Chaves estrangeiras
partido_id_fk int not null,
							     	-- tabela   (campo)
foreign key (partido_id_fk) references partido(id_partido),

cargo_id_fk int not null,
foreign key (cargo_id_fk) references cargo(id_cargo)
);
-- b) Faça a inserção de 03 registros por tabela.
insert into candidato (id_candidato, nome_candidato, endereco_candidato, partido_id_fk, cargo_id_fk ) values (default,"Luiz Inácio Lula da Silva "," R. Santa Cruz, 546 - Barroca, Belo Horizonte - MG, 30431-228", "1", "1"),
(default,"Jair Messias Bolsonaro", "R. Itajubá, 223 - Floresta, Belo Horizonte - MG, 30150-380", "2", "1"),
(default, "Cleuda","Rua Walter Ianni, 255 - São Gabriel, Belo Horizonte - MG, 31980-110", "3", "1");
-- c) Atualize um dado a sua escolha do primeiro registro de cada tabela
update candidato set nome_candidato = "Lula" where id_candidato = "1";
-- d) Faça uma consulta em que mostre apenas a coluna onde você fez a atualização
select nome_candidato from candidato;
-- e) Delete o segundo registro de cada tabela.
delete from candidato where id_candidato = "2";
select * from candidato;
-- comoando utilizado para deletar "delete from candidato where id_candidato >="9";"







create table cargo(
id_cargo int not null primary key auto_increment,
nome varchar(80) not null,
descricao varchar(120)
); 
-- b) Faça a inserção de 03 registros por tabela.
insert into cargo values (default, "Presidente", ""),
(default, "Presidente","" ),
(default, "Presidente", "");
-- c) Atualize um dado a sua escolha do primeiro registro de cada tabela
update cargo set nome = "Prefeito" where id_cargo  = "3";
-- d) Faça uma consulta em que mostre apenas a coluna onde você fez a atualização
select nome from cargo;
-- e) Delete o segundo registro de cada tabela.
delete from cargo where id_cargo = "2";
select * from cargo;






create table voto(
id_voto int not null primary key auto_increment,
data_voto date not null,
quantidade int not null,
-- Chaves estrangeiras
eleitor_id_fk int not null,
foreign key(eleitor_id_fk) references eleitor(id_eleitor),
cargo_id_fk int not null,
foreign key(cargo_id_fk) references cargo(id_cargo)
);
-- b) Faça a inserção de 03 registros por tabela.
insert into voto (id_voto, data_voto, quantidade, eleitor_id_fk, cargo_id_fk) values  
(default, "2022–08–06", "1",  "1", "1"),
(default, "2022–08–06", "1", "2", "2"),
(default, "2022–08–06", "1", "3", "2");
/* ERRO: Na minha tabela voto, a data está aparecendo como dado truncado para a colua data_voto para vermos que a no campo data aparece 0000-00-00, apos fazer o update, o dato data foi inserido  */
-- c) Atualize um dado a sua escolha do primeiro registro de cada tabela
update voto set data_voto = "2022-08-07" where id_voto = "1";
-- d) Faça uma consulta em que mostre apenas a coluna onde você fez a atualização
select data_voto from voto;
-- e) Delete o segundo registro de cada tabela.
delete from voto where id_voto = "2";
select * from voto;



create table eleitor(
id_eleitor int not null primary key auto_increment,
nome_eleitor varchar(80) not null,
endereco_eleitor varchar(120)
);
-- b) Faça a inserção de 03 registros por tabela.
insert into eleitor values (default, "Julia Fernandes", "R. Descalvado, 81 - Renascença"),
(default, "Kauan Bicalho", "Av. Clara Nunes, 294 - Renascença"),
(default, "Sofia Abreu", "Av. Bernardo de Vasconcelos, 377 - Cachoeirinha");
-- c) Atualize um dado a sua escolha do primeiro registro de cada tabela
update eleitor set nome_eleitor ="Amanda Julia" where id_eleitor = "3";
-- d) Faça uma consulta em que mostre apenas a coluna onde você fez a atualização
select nome_eleitor from eleitor;
-- e) Delete o segundo registro de cada tabela.
delete from eleitor where id_eleitor = "2";
select * from eleitor;

