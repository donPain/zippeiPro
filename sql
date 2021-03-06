CREATE TABLE ESTADO(
    SIGLA VARCHAR(2),
    NOME VARCHAR(50),

    CONSTRAINT SIGLA_ESTADO PRIMARY KEY (SIGLA)
)

CREATE TABLE CIDADE(
    ID INTEGER,
    FK_ESTADO VARCHAR(2),
    NOME VARCHAR(80),

    CONSTRAINT PK_CIDADE PRIMARY KEY (ID),
    CONSTRAINT FK_CIDADE_ESTADO FOREIGN KEY (FK_ESTADO) REFERENCES ESTADO(SIGLA)
)

CREATE TABLE CEP(
    ID VARCHAR(8),
    FK_CIDADE INTEGER,
    RUA VARCHAR(80),
    BAIRRO VARCHAR(30),

    CONSTRAINT PK_CEP PRIMARY KEY (ID),
    CONSTRAINT FK_CEP_CIDADE FOREIGN KEY (FK_CIDADE) REFERENCES CIDADE(ID)
)

CREATE TABLE ENTREGADOR(
    ID INTEGER,
    FK_CIDADE INTEGER,
    FK_CEP VARCHAR(8),
    CNH VARCHAR(11),
    NOME_ENTREGADOR VARCHAR(150),
    CPF VARCHAR(11),
    FOTO_CNH VARCHAR(150),
    FOTO_ENTREGADOR VARCHAR(150),
    RUA VARCHAR(50),
    RG VARCHAR(9),
    EMAIL VARCHAR(150),

    CONSTRAINT PK_ENTREGADOR PRIMARY KEY (ID),
    CONSTRAINT FK_ENTREGADOR_CIDADE FOREIGN KEY (FK_CIDADE) REFERENCES CIDADE(ID),
    CONSTRAINT FK_ENTREGADOR_CEP FOREIGN KEY (FK_CEP) REFERENCES CEP(ID)
)

CREATE TABLE LOJA(
    ID INTEGER,
    FK_CEP VARCHAR(8),
    FK_CIDADE INTEGER,
    CNPJ VARCHAR(14),
    SENHA VARCHAR(30),
    RUA VARCHAR(80),
    NUMERO VARCHAR(5),
    NOME_LOJA VARCHAR(130),
    NOME_PROPRIETARIO VARCHAR(150),
    CPF_PROPRIETARIO VARCHAR(11),
    FOTO_LOJA VARCHAR(80),

    CONSTRAINT PK_LOJA PRIMARY KEY (ID),
    CONSTRAINT FK_LOJA_CEP FOREIGN KEY (FK_CEP) REFERENCES CEP(ID),
    CONSTRAINT FK_LOJA_CIDADE FOREIGN KEY (FK_CIDADE) REFERENCES CIDADE(ID)
)

CREATE TABLE PRODUTO(
    ID INTEGER,
    FK_LOJA INTEGER,
    NOME VARCHAR(30),
    QUANTIDADE INTEGER,
    VALOR FLOAT(8.2),
    FOTO VARCHAR(50),
    DESCRICAO VARCHAR(150),

    CONSTRAINT PK_PRODUTO PRIMARY KEY (ID),
    CONSTRAINT FK_PRODUTO_LOJA FOREIGN KEY (FK_LOJA) REFERENCES LOJA(ID)
)

CREATE TABLE CLIENTE(
    ID INTEGER,
    FK_CEP VARCHAR(8),
    FK_CIDADE INTEGER,
    NOME VARCHAR(150),
    CPF VARCHAR(11),
    EMAIL VARCHAR(90),
    RUA VARCHAR(80),
    NUMERO VARCHAR(9),
    BAIRRO VARCHAR(50),

    CONSTRAINT PK_CLIENTE PRIMARY KEY (ID),
    CONSTRAINT FK_CLIENTE_CEP FOREIGN (KEY FK_CEP) REFERENCES CEP(ID),
    CONSTRAINT FK_CLIENTE_CIDADE FOREIGN KEY (FK_CIDADE) REFERENCES CIDADE(ID)
)

CREATE TABLE PEDIDO(
    ID INTEGER,
    FK_PRODUTO INTEGER,
    FK_CLIENTE INTEGER,

    CONSTRAINT PK_PEDIDO PRIMARY KEY (ID),
    CONSTRAINT FK_PEDIDO_PRODUTO FOREIGN KEY (FK_PRODUTO) REFERENCES PRODUTO(ID),
    CONSTRAINT FK_PEDIDO_CLIENTE FOREIGN KEY (FK_CLIENTE) REFERENCES CLIENTE(ID)
)

CREATE TABLE ENTREGADOR_LOJA(
    ID INTEGER,
    FK_LOJA INTEGER,
    FK_ENTREGADOR INTEGER,

    CONSTRAINT PK_ENTREGADOR_LOJA PRIMARY KEY (ID),
    CONSTRAINT FK_ENTREGADOR_LOJA_LOJA FOREIGN KEY (FK_LOJA) REFERENCES LOJA(ID),
    CONSTRAINT FK_ENTREGADOR_LOJA_ENTREGADOR FOREIGN KEY (FK_ENTREGADOR) REFERENCES ENTREGADOR(ID)
)

*senha do banco: xurupita123*

HOST: mysql16-farm76.kinghost.net
DATABASE: eduardonzeli
USER: eduardonzeli
SENHA: xurupita123