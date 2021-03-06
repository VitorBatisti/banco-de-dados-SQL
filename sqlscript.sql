REM   Script: Banco de Dados - ACADEMIA
REM   Primeira Versão

create table filiais ( 
    id              integer primary key, 
    cnpj            varchar2(18) unique not null, 
    proprietario    varchar2(32)        not null, 
    email           varchar2(50)        not null, 
    telefone        varchar2(14)        not null, 
    estado          varchar2(32)        not null, 
    cidade          varchar2(32)        not null, 
    bairro          varchar2(32)        not null, 
    rua             varchar2(50)        not null, 
    numero          number              not null, 
    cep             varchar2(9)         not null, 
    complemento     varchar2(32) 
);

create table funcionarios ( 
    id                  integer primary key, 
    registro            varchar2(16) unique not null, 
    cpf                 varchar2(14) unique not null, 
    salario             varchar2(32)        not null, 
    nome                varchar2(32)        not null, 
    sobrenome           varchar2(32)        not null, 
    telefone            varchar2(14)        not null, 
    email               varchar2(50), 
    id_filial           integer             not null, 
    CONSTRAINT fk_funcionario_filial FOREIGN KEY (id_filial) REFERENCES filiais (id) 
);

create table professores ( 
    id                  integer primary key, 
    comissao            number(3)  not null, 
    id_funcionario      integer    not null, 
    CONSTRAINT fk_professor_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id) 
);

create table atendentes ( 
    id                  integer primary key, 
    id_funcionario      integer    not null, 
    CONSTRAINT fk_atendente_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id) 
);

create table limpeza ( 
    id                  integer primary key, 
    id_funcionario      integer  not null, 
    CONSTRAINT fk_limpeza_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id) 
);

create table escalas ( 
    id                  integer primary key, 
    data                date, 
    hora_entrada        number, 
    hora_saida          number, 
    id_funcionario      integer     not null, 
    CONSTRAINT fk_escala_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id) 
);

create table planos ( 
    id                  integer primary key, 
    nome_plano          varchar2(32)    not null, 
    preco               varchar2(32)    not null, 
    descricao           varchar2(60)    not null 
);

create table alunos ( 
    id                  integer primary key, 
    matricula           varchar2(16) unique not null, 
    cpf                 varchar2(14) unique not null, 
    nome                varchar2(32)        not null, 
    sobrenome           varchar2(32)        not null, 
    email               varchar2(50)        not null, 
    data_de_entrada     date                not null, 
    status              varchar2(32)        not null, 
    id_plano            integer             not null, 
    CONSTRAINT fk_aluno_plano FOREIGN KEY (id_plano) REFERENCES planos (id) 
);

create table acessos ( 
    id                   integer primary key, 
    data                 date, 
    hora                 number, 
    id_filial            integer not null, 
    id_aluno             integer not null, 
    CONSTRAINT fk_acesso_filial FOREIGN KEY (id_filial) REFERENCES filiais (id), 
    CONSTRAINT fk_acesso_aluno FOREIGN KEY (id_aluno) REFERENCES alunos (id) 
);

create table aulas ( 
    id                  integer primary key, 
    data                date            not null, 
    hora                number          not null, 
    preco               varchar2(32)    not null, 
    id_aluno            integer         not null, 
    id_professor        integer         not null, 
    CONSTRAINT fk_aula_professor FOREIGN KEY (id_professor) REFERENCES professores (id), 
    CONSTRAINT fk_aula_aluno FOREIGN KEY (id_aluno) REFERENCES alunos (id) 
);

create table pagamentos ( 
    id                  integer primary key, 
    data                date            not null, 
    modalidade          varchar2(32)    not null, 
    valor               varchar2(32)    not null, 
    id_aula             integer, 
    id_aluno            integer         not null, 
    CONSTRAINT fk_pagamento_aula FOREIGN KEY (id_aula) REFERENCES aulas (id), 
    CONSTRAINT fk_pagamento_aluno FOREIGN KEY (id_aluno) REFERENCES alunos (id) 
);

INSERT INTO filiais (id,cnpj,proprietario,email,telefone,estado,cidade,bairro,rua,numero,cep,complemento) VALUES (1,'05.841.422/0001-03','Danilo Oliveira Dias','danilo_oliveira@gmail.com','(26) 2871-6783','São Paulo','Campinas','Sete de Setembro','São Paulo',558,'12687-94','perto da praça');

INSERT INTO filiais (id,cnpj,proprietario,email,telefone,estado,cidade,bairro,rua,numero,cep,complemento) VALUES (2,'80.401.114/0001-82','Diogo Fernandes Cavalcanti','diogo_fernandes@gmail.com','(91) 5391-2922','Maranhão','Codó','Bela Vista','Pará',402,'65626-755','em frente ao banco');

INSERT INTO filiais (id,cnpj,proprietario,email,telefone,estado,cidade,bairro,rua,numero,cep,complemento) VALUES (3,'15.963.852/0001-51','Julia Azevedo Correia','julia_azevedo@gmail.com','(63) 9619-6757','Rio de Janeiro','Campos dos Goytacazes','Rui Barbosa','São Paulo',419,'25629-461','perto da praça');

INSERT INTO filiais (id,cnpj,proprietario,email,telefone,estado,cidade,bairro,rua,numero,cep,complemento) VALUES (4,'74.397.243/0001-41','Sarah Fernandes Barros','sarah_barros@gmail.com','(34) 3943-5106','São Paulo','Guarulhos','Dom Pedro II','Pernambuco',441,'13961-192','em frente ao banco');

INSERT INTO filiais (id,cnpj,proprietario,email,telefone,estado,cidade,bairro,rua,numero,cep,complemento) VALUES (5,'61.998.899/0001-78','Daniel Lima Almeida','daniel_lima@gmail.com','(74) 9597-4287','Bahia','Lauro de Freitas','Santa Rita','Paraná',421,'48088-523','no shopping');

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (1,1000,'893.348.590-24','$2249.66','Emily','Cavalcanti','(64) 5011-8300','emily_cacalcanti@gmail.com',1);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (2,992,'451.029.040-35','$3884.53','Luana','Rocha','(74) 8100-7047','mauris@gmail.com',2);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (3,984,'625.708.570-50','$4602.37','Nicolas','Tristão','(71) 3876-4079','augue@gmail.com',3);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (4,976,'937.816.320-32','$3958.42','Vinicius','Alcantara','(89) 4702-3592','lectus.justo@gmail.com',4);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (5,968,'460.855.950-85','$3771.81','Kauã','Carvalho','(76) 3396-5666','posuere@gmail.com',5);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (6,960,'812.659.470-58','$4668.17','Renato','Silva','(18) 1703-0733','atellus@gmail.com',1);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (7,952,'657.998.480-55','$2402.16','Ryan','Carvalho','(58) 6368-1047','ornare@gmail.com',2);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (8,944,'798.056.240-21','$2194.38','Yasmin','Carvalho','(72) 4529-3199','tincidunt@gmail.com',3);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (9,936,'579.739.530-43','$4018.16','Gabrielly','Cavalcanti','(14) 2823-9358','tristique@gmail.com',4);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (10,928,'948.604.660-39','$3370.16','Carla','Rodrigues','(68) 4146-6825','gravida@gmail.com',5);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (11,920,'438.950.470-31','$3119.53','Tomás','Alves','(84) 1642-7571','luctus@gmail.com',1);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (12,912,'107.227.310-19','$4538.80','Enzo','Cavalcanti','(22) 5994-6854','elit@gmail.com',2);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (13,904,'543.125.010-84','$2913.75','Nicole','Barros','(28) 2002-3963','lorem@gmail.com',3);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (14,896,'739.862.920-63','$4132.87','Eloisa','Silva','(77) 3979-8198','Morbi@gmail.com',4);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (15,888,'806.544.040-11','$2283.44','Fernando','Rodrigues','(38) 5000-7317','fernando_rodrigues@gmail.com',5);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (16,880,'783.384.850-63','$3261.64','Martim','Silva','(68) 3419-6527','martim_silva@gmail.com',1);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (17,872,'331.493.740-73','$2007.60','Rafael','Massa','(65) 8626-3589','rafael_massa@gmail.com',2);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (18,864,'504.941.220-05','$3053.94','Carlos','Alves','(57) 7197-1118','carlos_alves@gmail.com',3);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (19,856,'363.747.150-71','$3789.82','João','Cavalcanti','(32) 3707-4922','joao_cavalcanti@gmail.com',4);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (20,848,'612.907.020-98','$3078.50','Jessica','Rodrigues','(78) 8705-2471','jessica_rodrigues@gmail.com',5);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (21,840,'278.752.460-59','$3566.66','Cauã','Carvalho','(20) 8038-4940','caua_carvalho@gmail.com',1);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (22,832,'707.524.120-60','$2413.73','Julieta','Rodrigues','(27) 9149-5162','julieta_rodrigues@gmail.com',2);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (23,824,'796.236.620-68','$2766.91','Gabriela','Barros','(38) 5382-4934','gabriela_barrosgmail.com',3);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (24,816,'137.852.640-62','$3449.89','Luis','Alves','(78) 9136-8799','luis_alves@gmail.com',4);

INSERT INTO funcionarios (id,registro,cpf,salario,nome,sobrenome,telefone,email,id_filial) VALUES (25,808,'477.499.590-84','$3614.17','Pedro','Rodrigues','(61) 4155-8340','pedro_rodrigues@gmail.com',5);

INSERT INTO professores (id,comissao,id_funcionario) VALUES (1,47,1);

INSERT INTO professores (id,comissao,id_funcionario) VALUES (2,47,2);

INSERT INTO professores (id,comissao,id_funcionario) VALUES (3,40,5);

INSERT INTO professores (id,comissao,id_funcionario) VALUES (4,43,6);

INSERT INTO professores (id,comissao,id_funcionario) VALUES (5,31,9);

INSERT INTO professores (id,comissao,id_funcionario) VALUES (6,34,10);

INSERT INTO professores (id,comissao,id_funcionario) VALUES (7,45,13);

INSERT INTO professores (id,comissao,id_funcionario) VALUES (8,50,14);

INSERT INTO professores (id,comissao,id_funcionario) VALUES (9,49,17);

INSERT INTO professores (id,comissao,id_funcionario) VALUES (10,30,18);

INSERT INTO limpeza (id,id_funcionario) VALUES (1,3);

INSERT INTO limpeza (id,id_funcionario) VALUES (2,4);

INSERT INTO limpeza (id,id_funcionario) VALUES (3,7);

INSERT INTO limpeza (id,id_funcionario) VALUES (4,8);

INSERT INTO limpeza (id,id_funcionario) VALUES (5,11);

INSERT INTO limpeza (id,id_funcionario) VALUES (6,12);

INSERT INTO limpeza (id,id_funcionario) VALUES (7,15);

INSERT INTO limpeza (id,id_funcionario) VALUES (8,16);

INSERT INTO limpeza (id,id_funcionario) VALUES (9,19);

INSERT INTO limpeza (id,id_funcionario) VALUES (10,20);

INSERT INTO atendentes (id,id_funcionario) VALUES (1,21);

INSERT INTO atendentes (id,id_funcionario) VALUES (2,22);

INSERT INTO atendentes (id,id_funcionario) VALUES (3,23);

INSERT INTO atendentes (id,id_funcionario) VALUES (4,24);

INSERT INTO atendentes (id,id_funcionario) VALUES (5,25);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (1,'28-Jul-2020',12,16,1);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (2,'26-Jun-2020',12,22,18);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (3,'17-Jun-2020',10,17,1);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (4,'13-Sep-2020',9,19,6);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (5,'7-Jun-2020',8,19,2);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (6,'24-Jul-2020',12,22,5);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (7,'15-Jul-2020',10,15,20);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (8,'15-Sep-2020',11,16,16);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (9,'17-Jun-2020',9,18,22);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (10,'17-Aug-2020',14,15,5);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (11,'22-Sep-2020',10,16,1);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (12,'20-Jun-2020',6,18,13);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (13,'10-Sep-2020',8,17,16);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (14,'24-Aug-2020',12,22,10);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (15,'16-Jul-2020',14,20,10);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (16,'7-Sep-2020',8,19,17);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (17,'16-Jun-2020',9,16,1);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (18,'1-Sep-2020',8,18,12);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (19,'13-Jul-2020',9,18,11);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (20,'3-Sep-2020',13,19,4);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (21,'5-Jun-2020',6,15,12);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (22,'25-Jun-2020',6,20,6);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (23,'11-Jul-2020',13,20,25);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (24,'16-Jul-2020',6,22,9);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (25,'25-Jul-2020',9,19,20);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (26,'3-Aug-2020',14,20,5);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (27,'11-Jun-2020',9,19,19);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (28,'4-Aug-2020',12,17,8);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (29,'8-Jun-2020',10,22,17);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (30,'1-Jul-2020',11,21,22);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (31,'9-Jul-2020',10,17,18);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (32,'29-Jun-2020',12,21,5);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (33,'1-Sep-2020',14,17,11);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (34,'30-Jul-2020',6,15,4);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (35,'13-Jul-2020',14,21,21);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (36,'5-Aug-2020',9,18,14);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (37,'12-Aug-2020',14,20,6);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (38,'15-Aug-2020',11,19,18);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (39,'2-Sep-2020',10,21,13);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (40,'16-Sep-2020',6,19,21);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (41,'9-Sep-2020',14,17,6);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (42,'16-Jul-2020',13,22,20);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (43,'22-Jul-2020',13,18,10);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (44,'24-Jun-2020',14,17,13);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (45,'10-Jul-2020',8,20,21);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (46,'9-Sep-2020',7,17,21);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (47,'15-Jul-2020',14,20,10);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (48,'25-Jun-2020',9,21,4);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (49,'13-Jul-2020',7,17,20);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (50,'7-Sep-2020',9,21,17);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (51,'3-Aug-2020',12,15,2);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (52,'29-Jul-2020',13,18,7);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (53,'27-Jul-2020',7,17,2);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (54,'5-Jun-2020',11,16,16);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (55,'13-Jun-2020',9,16,22);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (56,'15-Jul-2020',12,20,21);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (57,'29-Jun-2020',12,20,18);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (58,'1-Jul-2020',11,16,21);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (59,'10-Jul-2020',6,22,17);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (60,'7-Sep-2020',7,21,18);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (61,'21-Sep-2020',11,16,11);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (62,'23-Jul-2020',8,18,19);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (63,'4-Aug-2020',10,19,11);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (64,'14-Aug-2020',10,18,21);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (65,'8-Jun-2020',11,20,23);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (66,'14-Aug-2020',14,19,4);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (67,'11-Jun-2020',13,22,19);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (68,'2-Sep-2020',9,16,2);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (69,'2-Jul-2020',7,15,21);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (70,'4-Jul-2020',11,22,13);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (71,'17-Sep-2020',10,22,9);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (72,'6-Sep-2020',9,16,24);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (73,'10-Jul-2020',14,20,3);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (74,'4-Sep-2020',10,18,24);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (75,'31-Jul-2020',9,19,15);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (76,'28-Jun-2020',7,22,1);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (77,'18-Jul-2020',9,22,8);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (78,'31-Aug-2020',11,16,23);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (79,'29-Sep-2020',11,15,15);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (80,'13-Jul-2020',12,16,25);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (81,'5-Jul-2020',11,17,14);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (82,'1-Sep-2020',14,22,25);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (83,'6-Sep-2020',8,15,21);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (84,'12-Jul-2020',13,15,5);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (85,'6-Jun-2020',8,19,13);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (86,'25-Aug-2020',6,15,13);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (87,'16-Jun-2020',12,18,15);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (88,'11-Jun-2020',11,15,13);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (89,'2-Aug-2020',6,20,3);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (90,'2-Jun-2020',6,18,5);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (91,'3-Jun-2020',7,19,5);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (92,'22-Jul-2020',8,22,5);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (93,'21-Aug-2020',11,15,23);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (94,'30-Aug-2020',8,18,12);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (95,'8-Sep-2020',10,18,11);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (96,'21-Aug-2020',9,20,9);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (97,'7-Sep-2020',6,21,16);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (98,'4-Aug-2020',10,22,5);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (99,'4-Aug-2020',7,21,9);

INSERT INTO escalas (id,data,hora_entrada,hora_saida,id_funcionario) VALUES (100,'23-Jul-2020',12,18,11);

INSERT INTO planos (id,nome_plano,preco,descricao) VALUES (1,'basico','$80.00','permite acesso somente em sua cidade');

INSERT INTO planos (id,nome_plano,preco,descricao) VALUES (2,'medio','$120.00','permite acesso em qualquer unidade do estado');

INSERT INTO planos (id,nome_plano,preco,descricao) VALUES (3,'avançado','$160.00','permite acesso a qualquer unidade do pais');

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (1,1000,'262.805.860-06','Sofia','Alves','diam_lorem@gmail.com','23-Aug-2019','bloqueado',2);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (2,997,'506.646.570-79','Melissa','Carvalho','ipsum@gmail.com','26-Mar-2020','ativo',2);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (3,994,'938.002.440-12','Emilly','Dias','dapibus@gmail.com','4-Dec-2019','ativo',2);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (4,991,'909.316.160-18','Luiz','Silva','dictum@gmail.com','26-Jun-2019','ativo',3);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (5,988,'731.790.010-97','Carolina','Castro','nulla@gmail.com','2-May-2020','bloqueado',1);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (6,985,'536.248.450-80','Nicolas','Ribeiro','mentum@gmail.com','13-May-2020','bloqueado',1);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (7,982,'986.838.660-84','Marina','Cavalcanti','mattis@gmail.com','24-Jul-2019','ativo',2);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (8,979,'076.045.080-30','Júlio','Oliveira','neque@gmail.com','19-May-2020','ativo',3);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (9,976,'975.296.230-01','Rodrigo','Lima','hendrerit@gmail.com','25-Apr-2020','ativo',1);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (10,973,'800.812.020-75','Luís','Melo','bibendum@gmail.com','16-Dec-2020','bloqueado',2);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (11,970,'612.021.430-59','Giovanna','Martins','Duis@gmail.com','1-Nov-2020','bloqueado',1);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (12,967,'974.871.840-99','Camila','Rodrigues','dui_in@gmail.com','21-Jan-2021','ativo',1);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (13,964,'560.882.610-80','Danilo','Gomes','sedneque@gmail.com','5-May-2020','ativo',3);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (14,961,'851.392.040-10','Isabella','Ortega','natoque@gmail.com','5-Sep-2019','ativo',3);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (15,958,'663.011.190-70','Murilo','Rocha','nibenim@gmail.com','12-Feb-2021','ativo',2);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (16,955,'394.782.850-09','Ryan','Almeida','primis@gmail.com','19-Oct-2019','bloqueado',1);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (17,952,'251.982.920-60','Anna','Ferreira','risusuis@gmail.com','13-Apr-2020','bloqueado',1);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (18,949,'688.675.930-21','Guilherme','Santos','non@gmail.com','3-Nov-2019','bloqueado',2);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (19,946,'902.184.720-56','Samuel','Barbosa','vitae@gmail.com','30-May-2020','bloqueado',3);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (20,943,'643.450.630-94','Marisa','Carvalho','adipiscing@gmail.com','1-Oct-2020','bloqueado',3);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (21,940,'472.175.250-47','Matilde','Sousa','magnat@gmail.com','1-Aug-2019','bloqueado',2);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (22,937,'604.495.510-91','Geraldo','Lima','quisque@gmail.com','10-Jun-2021','bloqueado',3);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (23,934,'115.616.940-29','Vitor','Daniel','parturient@gmail.com','4-Apr-2021','ativo',3);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (24,931,'373.280.980-31','Laura','Ferreira','turpisegestas@gmail.com','2-Nov-2020','ativo',1);

INSERT INTO alunos (id,matricula,cpf,nome,sobrenome,email,data_de_entrada,status,id_plano) VALUES (25,928,'420.397.870-03','Ferdinando','Vinícius','feugiata@gmail.com','19-Dec-2020','bloqueado',2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (1,'23-Jun-2020',6,25,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (2,'28-Aug-2020',6,4,1);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (3,'15-Sep-2020',14,11,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (4,'21-Jun-2020',11,4,1);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (5,'31-Jul-2020',13,7,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (6,'8-Aug-2020',16,12,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (7,'3-Jun-2020',15,19,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (8,'29-Aug-2020',11,11,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (9,'4-Jul-2020',9,9,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (10,'22-Jul-2020',9,3,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (11,'27-Jul-2020',13,25,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (12,'28-Jun-2020',14,18,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (13,'6-Jul-2020',12,12,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (14,'26-Jun-2020',13,14,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (15,'6-Aug-2020',14,13,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (16,'7-Jun-2020',22,16,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (17,'29-Aug-2020',8,21,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (18,'3-Jun-2020',14,15,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (19,'22-Jul-2020',12,14,1);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (20,'12-Jun-2020',20,20,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (21,'9-Jun-2020',13,22,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (22,'25-Aug-2020',22,3,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (23,'3-Aug-2020',13,8,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (24,'29-Aug-2020',7,15,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (25,'30-Jun-2020',16,22,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (26,'1-Jul-2020',15,25,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (27,'31-Jul-2020',15,18,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (28,'12-Sep-2020',17,21,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (29,'18-Aug-2020',14,5,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (30,'10-Jun-2020',9,18,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (31,'27-Jun-2020',15,4,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (32,'21-Sep-2020',21,12,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (33,'4-Aug-2020',9,21,1);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (34,'9-Sep-2020',10,9,1);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (35,'30-Jun-2020',6,14,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (36,'24-Sep-2020',6,11,1);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (37,'10-Jun-2020',18,15,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (38,'28-Aug-2020',6,6,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (39,'17-Sep-2020',22,6,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (40,'26-Sep-2020',11,16,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (41,'14-Aug-2020',18,2,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (42,'6-Sep-2020',20,11,1);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (43,'23-Jul-2020',7,10,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (44,'4-Jun-2020',10,14,1);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (45,'14-Jul-2020',8,24,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (46,'30-Sep-2020',19,9,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (47,'28-Aug-2020',21,13,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (48,'1-Jul-2020',17,12,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (49,'11-Aug-2020',10,9,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (50,'15-Sep-2020',10,12,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (51,'6-Aug-2020',10,17,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (52,'15-Jun-2020',21,12,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (53,'16-Aug-2020',13,15,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (54,'30-Jul-2020',18,20,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (55,'29-Aug-2020',9,19,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (56,'27-Sep-2020',10,11,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (57,'20-Aug-2020',14,20,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (58,'26-Aug-2020',18,21,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (59,'6-Aug-2020',20,22,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (60,'3-Jun-2020',20,6,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (61,'30-Sep-2020',19,19,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (62,'12-Jun-2020',6,22,1);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (63,'28-Jun-2020',9,5,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (64,'24-Jun-2020',22,16,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (65,'6-Aug-2020',8,2,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (66,'4-Sep-2020',9,2,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (67,'16-Jul-2020',6,3,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (68,'31-Aug-2020',18,20,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (69,'25-Aug-2020',10,17,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (70,'7-Jun-2020',17,11,1);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (71,'20-Aug-2020',16,9,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (72,'15-Jul-2020',19,9,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (73,'10-Jul-2020',22,20,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (74,'24-Jun-2020',17,1,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (75,'19-Jun-2020',10,7,1);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (76,'15-Jun-2020',13,4,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (77,'28-Jul-2020',13,13,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (78,'18-Jun-2020',16,17,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (79,'9-Jun-2020',15,25,1);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (80,'12-Jul-2020',18,15,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (81,'6-Jun-2020',18,25,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (82,'24-Jun-2020',16,11,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (83,'17-Aug-2020',19,10,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (84,'24-Jul-2020',18,2,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (85,'11-Aug-2020',22,19,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (86,'8-Jun-2020',6,12,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (87,'2-Jun-2020',12,16,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (88,'14-Jul-2020',19,13,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (89,'10-Jun-2020',18,19,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (90,'11-Aug-2020',13,9,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (91,'23-Jul-2020',9,2,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (92,'10-Sep-2020',16,20,1);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (93,'8-Sep-2020',10,22,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (94,'5-Jul-2020',6,9,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (95,'21-Jul-2020',12,24,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (96,'14-Sep-2020',6,23,5);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (97,'3-Sep-2020',10,13,4);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (98,'23-Sep-2020',8,10,2);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (99,'5-Sep-2020',7,3,3);

INSERT INTO acessos (id,data,hora,id_aluno,id_filial) VALUES (100,'22-Jun-2020',22,9,1);

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (1,'18-Aug-2020',8,13,6,'$63.59');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (2,'15-Jun-2020',9,10,5,'$60.10');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (3,'30-Jul-2020',19,24,3,'$119.62');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (4,'27-Aug-2020',21,3,4,'$79.45');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (5,'16-Sep-2020',6,20,10,'$86.93');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (6,'28-Jun-2020',18,1,8,'$80.36');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (7,'16-Sep-2020',9,16,8,'$93.53');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (8,'29-Sep-2020',13,23,8,'$50.89');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (9,'21-Sep-2020',15,8,10,'$101.10');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (10,'30-Jul-2020',10,20,7,'$67.52');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (11,'6-Jun-2020',18,9,7,'$60.37');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (12,'23-Aug-2020',15,1,7,'$96.86');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (13,'17-Jul-2020',22,3,4,'$96.84');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (14,'2-Jun-2020',10,7,2,'$78.85');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (15,'12-Jul-2020',21,21,10,'$64.47');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (16,'29-Jun-2020',9,21,8,'$64.72');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (17,'15-Jul-2020',20,10,1,'$102.31');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (18,'11-Sep-2020',8,3,5,'$68.30');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (19,'19-Sep-2020',22,21,10,'$110.33');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (20,'30-Jul-2020',17,10,5,'$70.70');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (21,'8-Jun-2020',17,13,6,'$109.93');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (22,'6-Sep-2020',10,24,4,'$70.03');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (23,'8-Jul-2020',10,22,6,'$78.00');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (24,'29-Aug-2020',18,4,8,'$116.19');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (25,'11-Jul-2020',12,24,5,'$119.98');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (26,'23-Aug-2020',22,19,4,'$118.93');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (27,'20-Jun-2020',8,7,6,'$77.28');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (28,'12-Aug-2020',16,7,2,'$103.70');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (29,'26-Aug-2020',17,15,4,'$104.02');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (30,'2-Jun-2020',8,15,2,'$101.54');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (31,'1-Sep-2020',11,16,3,'$77.75');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (32,'23-Aug-2020',17,21,5,'$70.83');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (33,'30-Sep-2020',14,13,4,'$51.43');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (34,'25-Aug-2020',20,24,2,'$76.69');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (35,'23-Aug-2020',7,22,5,'$53.21');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (36,'11-Jul-2020',9,9,3,'$113.73');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (37,'1-Jul-2020',16,20,9,'$71.81');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (38,'17-Jul-2020',6,5,1,'$62.34');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (39,'22-Jul-2020',20,7,3,'$97.83');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (40,'30-Jul-2020',21,12,9,'$77.46');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (41,'6-Jul-2020',8,14,6,'$71.19');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (42,'30-Aug-2020',20,23,2,'$88.01');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (43,'21-Jun-2020',22,15,7,'$56.20');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (44,'16-Jun-2020',13,23,2,'$78.54');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (45,'30-Sep-2020',9,8,5,'$107.59');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (46,'28-Sep-2020',10,17,7,'$108.05');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (47,'29-Sep-2020',20,7,1,'$99.28');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (48,'12-Sep-2020',17,23,5,'$105.06');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (49,'15-Jul-2020',13,24,8,'$56.55');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (50,'21-Jun-2020',13,2,1,'$110.71');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (51,'7-Jul-2020',8,18,10,'$85.07');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (52,'3-Sep-2020',8,18,3,'$106.70');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (53,'1-Oct-2020',17,4,3,'$88.89');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (54,'25-Sep-2020',7,8,10,'$54.11');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (55,'30-Jun-2020',13,4,8,'$82.06');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (56,'5-Aug-2020',13,23,7,'$117.78');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (57,'3-Aug-2020',9,24,4,'$66.05');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (58,'7-Jun-2020',17,16,1,'$113.62');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (59,'16-Sep-2020',22,11,1,'$72.24');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (60,'15-Jun-2020',10,13,10,'$85.43');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (61,'8-Jul-2020',14,16,3,'$52.04');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (62,'8-Jul-2020',7,25,6,'$53.98');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (63,'30-Jun-2020',15,21,8,'$74.98');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (64,'26-Sep-2020',7,22,10,'$92.71');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (65,'8-Sep-2020',12,18,6,'$85.94');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (66,'25-Jul-2020',18,13,5,'$96.23');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (67,'5-Jul-2020',14,21,1,'$88.65');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (68,'29-Jun-2020',6,19,2,'$90.32');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (69,'25-Aug-2020',7,24,2,'$102.61');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (70,'31-Aug-2020',9,11,10,'$97.51');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (71,'28-Jun-2020',6,20,10,'$83.36');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (72,'28-Jun-2020',14,4,5,'$84.43');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (73,'27-Aug-2020',10,13,6,'$56.46');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (74,'7-Aug-2020',20,14,10,'$56.06');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (75,'22-Jul-2020',11,9,9,'$61.15');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (76,'21-Sep-2020',21,4,8,'$58.20');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (77,'3-Jul-2020',21,17,8,'$119.21');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (78,'24-Sep-2020',16,18,4,'$80.10');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (79,'12-Sep-2020',17,13,9,'$117.07');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (80,'11-Jun-2020',6,10,5,'$76.84');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (81,'20-Aug-2020',15,7,10,'$56.42');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (82,'9-Jul-2020',15,25,10,'$88.24');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (83,'29-Jun-2020',18,8,5,'$80.35');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (84,'8-Jun-2020',11,25,7,'$58.02');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (85,'12-Jul-2020',9,15,5,'$119.50');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (86,'17-Sep-2020',18,18,9,'$51.86');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (87,'19-Jun-2020',14,22,1,'$110.37');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (88,'21-Jun-2020',13,17,3,'$104.61');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (89,'10-Sep-2020',17,10,1,'$99.20');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (90,'10-Jul-2020',19,9,6,'$59.87');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (91,'25-Jun-2020',16,1,1,'$86.26');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (92,'16-Jun-2020',10,20,7,'$89.63');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (93,'3-Jun-2020',15,5,4,'$70.75');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (94,'24-Jul-2020',6,1,6,'$98.62');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (95,'7-Jul-2020',13,25,1,'$119.55');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (96,'24-Aug-2020',21,22,5,'$112.07');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (97,'21-Jul-2020',6,14,7,'$66.00');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (98,'31-Aug-2020',10,23,9,'$73.64');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (99,'15-Jul-2020',15,13,2,'$76.57');

INSERT INTO aulas (id,data,hora,id_aluno,id_professor,preco) VALUES (100,'9-Jul-2020',16,5,3,'$50.77');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (1,'5-Jun-2020','cartão',15,89,'$249.12');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (2,'10-Aug-2020','boleto',23,20,'$134.28');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (3,'20-Jun-2020','boleto',23,1,'$272.56');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (4,'15-Jun-2020','cartão',23,15,'$282.60');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (5,'3-Aug-2020','cartão',25,26,'$158.73');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (6,'8-Sep-2020','cartão',21,7,'$80.01');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (7,'5-Aug-2020','boleto',2,49,'$158.93');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (8,'24-Jul-2020','cartão',5,13,'$153.02');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (9,'11-Jun-2020','cartão',21,50,'$114.65');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (10,'9-Jul-2020','cartão',17,2,'$232.52');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (11,'29-Aug-2020','debito',21,45,'$194.16');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (12,'26-Sep-2020','boleto',8,30,'$86.66');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (13,'14-Aug-2020','boleto',13,5,'$126.77');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (14,'16-Sep-2020','debito',16,69,'$144.45');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (15,'28-Aug-2020','cartão',15,58,'$82.02');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (16,'15-Sep-2020','boleto',3,41,'$286.67');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (17,'19-Aug-2020','debito',20,60,'$291.95');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (18,'31-Aug-2020','debito',2,78,'$165.82');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (19,'18-Jun-2020','boleto',10,74,'$283.48');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (20,'5-Sep-2020','debito',3,33,'$97.14');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (21,'9-Aug-2020','cartão',1,29,'$163.62');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (22,'8-Jul-2020','cartão',1,85,'$246.78');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (23,'8-Aug-2020','boleto',6,19,'$211.85');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (24,'5-Sep-2020','cartão',8,32,'$232.69');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (25,'16-Aug-2020','cartão',7,67,'$123.26');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (26,'13-Jul-2020','boleto',18,29,'$196.86');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (27,'22-Jul-2020','debito',7,11,'$138.19');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (28,'17-Jul-2020','boleto',14,87,'$211.27');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (29,'15-Jun-2020','boleto',8,8,'$275.29');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (30,'25-Sep-2020','debito',1,47,'$288.62');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (31,'3-Jun-2020','cartão',2,91,'$238.50');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (32,'3-Jun-2020','boleto',9,98,'$293.05');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (33,'20-Sep-2020','boleto',12,11,'$188.54');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (34,'2-Aug-2020','debito',18,3,'$283.50');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (35,'2-Sep-2020','cartão',19,25,'$242.63');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (36,'21-Jul-2020','boleto',3,44,'$181.16');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (37,'23-Sep-2020','debito',6,84,'$274.91');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (38,'10-Jun-2020','cartão',18,18,'$178.94');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (39,'6-Aug-2020','boleto',9,43,'$197.10');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (40,'29-Jul-2020','cartão',3,59,'$220.87');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (41,'28-Jun-2020','boleto',20,55,'$178.99');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (42,'31-Aug-2020','boleto',23,9,'$218.54');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (43,'12-Sep-2020','debito',15,22,'$249.08');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (44,'26-Aug-2020','debito',4,82,'$192.48');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (45,'20-Jul-2020','cartão',2,95,'$288.81');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (46,'20-Aug-2020','boleto',8,61,'$140.29');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (47,'26-Jun-2020','debito',12,18,'$187.13');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (48,'9-Aug-2020','cartão',19,28,'$136.87');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (49,'5-Aug-2020','cartão',13,13,'$155.08');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,id_aula,valor) VALUES (50,'20-Sep-2020','boleto',17,55,'$272.41');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (51,'6-Jun-2020','debito',16,'$106.32');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (52,'13-Jun-2020','cartão',23,'$125.61');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (53,'5-Jul-2020','boleto',15,'$288.68');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (54,'4-Sep-2020','cartão',11,'$177.12');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (55,'15-Jul-2020','debito',13,'$257.13');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (56,'1-Jul-2020','boleto',3,'$221.28');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (57,'6-Jul-2020','cartão',13,'$297.91');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (58,'19-Sep-2020','cartão',23,'$251.86');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (59,'28-Jul-2020','boleto',5,'$193.55');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (60,'24-Jul-2020','boleto',3,'$200.47');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (61,'25-Jul-2020','cartão',10,'$159.25');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (62,'31-Jul-2020','debito',23,'$111.70');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (63,'13-Sep-2020','cartão',13,'$112.72');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (64,'16-Jun-2020','debito',24,'$91.68');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (65,'16-Jun-2020','boleto',7,'$289.58');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (66,'16-Jun-2020','boleto',9,'$226.08');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (67,'17-Jul-2020','debito',24,'$175.79');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (68,'21-Aug-2020','boleto',19,'$93.18');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (69,'19-Jul-2020','debito',15,'$87.06');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (70,'2-Sep-2020','cartão',18,'$253.75');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (71,'8-Jun-2020','boleto',12,'$248.69');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (72,'11-Jun-2020','cartão',15,'$279.60');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (73,'10-Jun-2020','debito',12,'$95.86');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (74,'29-Jul-2020','cartão',8,'$96.99');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (75,'14-Sep-2020','boleto',3,'$83.16');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (76,'4-Sep-2020','debito',12,'$202.63');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (77,'25-Sep-2020','debito',17,'$162.69');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (78,'11-Jul-2020','boleto',24,'$243.44');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (79,'28-Sep-2020','debito',17,'$205.82');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (80,'15-Jul-2020','cartão',24,'$247.74');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (81,'22-Sep-2020','debito',24,'$174.54');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (82,'8-Jul-2020','debito',11,'$135.00');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (83,'17-Sep-2020','boleto',5,'$272.34');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (84,'8-Aug-2020','boleto',11,'$113.15');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (85,'22-Sep-2020','boleto',1,'$126.30');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (86,'16-Sep-2020','debito',20,'$114.56');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (87,'25-Jun-2020','cartão',7,'$247.84');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (88,'20-Jul-2020','cartão',1,'$96.23');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (89,'7-Sep-2020','debito',7,'$248.57');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (90,'20-Jun-2020','boleto',10,'$110.59');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (91,'18-Aug-2020','boleto',23,'$119.73');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (92,'9-Jul-2020','boleto',21,'$139.22');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (93,'10-Jul-2020','boleto',12,'$214.81');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (94,'25-Aug-2020','cartão',1,'$176.72');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (95,'29-Jul-2020','cartão',15,'$104.75');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (96,'9-Aug-2020','debito',25,'$159.06');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (97,'13-Sep-2020','cartão',18,'$245.15');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (98,'11-Aug-2020','cartão',25,'$269.40');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (99,'4-Sep-2020','cartão',2,'$137.89');

INSERT INTO pagamentos (id,data,modalidade,id_aluno,valor) VALUES (100,'2-Sep-2020','cartão',9,'$161.99');

select * from alunos;

select filiais.proprietario, filiais.cidade, funcionarios.registro, funcionarios.nome from filiais, funcionarios where funcionarios.id_filial = filiais.id;

select filiais.cidade, funcionarios.registro, funcionarios.nome from filiais, funcionarios where funcionarios.id_filial = filiais.id;

select filiais.cidade, funcionarios.registro, funcionarios.nome from filiais, funcionarios where funcionarios.id_filial = filiais.id and filiais.nome = 'codó';

select filiais.cidade, funcionarios.registro, funcionarios.nome from filiais, funcionarios where funcionarios.id_filial = filiais.id and filiais.cidade = 'codó';

select filiais.cidade, funcionarios.registro, funcionarios.nome from filiais, funcionarios where funcionarios.id_filial = filiais.id;

select filiais.cidade, funcionarios.registro, funcionarios.nome from filiais, funcionarios where funcionarios.id_filial = filiais.id;

select filiais.cidade, funcionarios.registro, funcionarios.nome from filiais, funcionarios where funcionarios.id_filial = filiais.id and filiais.cidade = 'Codó';

