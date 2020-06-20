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

