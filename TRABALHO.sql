

CREATE SCHEMA trabalho_final;
USE trabalho_final;

CREATE TABLE sala (
sala_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
sala_sofa VARCHAR(50) NOT NULL,
sala_tv VARCHAR(50),
cozinha int not null,
sofas VARCHAR(50));

alter table sala add constraint `fkcozinha`
foreign key (`cozinha`) 
references cozinha (`cozinha_id`)
on delete no action
on update no action;

CREATE TABLE cozinha (
cozinha_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
cozinha_fogao VARCHAR(50) NOT NULL,
cozinha_mesa VARCHAR(50) NOT NULL
);

CREATE TABLE banheiro_quarto (
banheiro_quarto_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
banheiro_escova INT NOT NULL,
banheiro_pia VARCHAR(50) NOT NULL,
banheiro_vaso VARCHAR(50) NOT NULL,
banheiro_banho VARCHAR(50) NOT NULL
);

CREATE TABLE quarto (
quarto_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
banheiro_quarto_ID INT NOT NULL,
quarto_camas INT NOT NULL,
quarto_tvs VARCHAR(50) NOT NULL
);

CREATE TABLE banheiro (
banheiro_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
shampoo_qnt VARCHAR(50) NOT NULL,
toalha_qnt VARCHAR(50) NOT NULL,
tamanho_banheiro VARCHAR(50) NOT NULL
);

CREATE TABLE garagem (
garagem_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
garagem_carro VARCHAR(50) NOT NULL,
garagem_ferramentas VARCHAR(50) NOT NULL
);

CREATE TABLE garagem_info (
garagem_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
garagem_carro VARCHAR(50) NOT NULL,
garagem_ferramentas VARCHAR(50) NOT NULL,
garagem_tamanho VARCHAR(50) NOT NULL,
numerocarro INT NOT NULL
);

-- IMPORT WIZARD!

-- 5)
DELETE FROM garagem
WHERE garagem_ID = 2;

-- 6)
SELECT banheiro.shampoo_qnt, sala.sofas
FROM banheiro
LEFT OUTER JOIN sala ON banheiro.shampoo_qnt = sala.sofas
WHERE banheiro.shampoo_qnt = '1' ;

SELECT banheiro.toalha_qnt, garagem_info.garagem_carro
FROM banheiro
RIGHT OUTER JOIN garagem_info ON banheiro.toalha_qnt = garagem_info.garagem_carro
WHERE banheiro.toalha_qnt = '3' ;


-- MUDAR O JOIN OU A TABELA DO SELECT ABAIXO
SELECT cozinha.cozinha_fogao, sala.sala_ID
FROM cozinha
LEFT JOIN sala ON cozinha.cozinha_ID = sala.sala_ID;

SELECT * FROM cozinha;
SELECT *FROM sala;
SELECT * FROM quarto;

SELECT sala.sofas, banheiro_quarto.banheiro_escova
FROM sala
INNER JOIN banheiro_quarto ON sala.sofas = banheiro_quarto.banheiro_escova
WHERE banheiro_quarto.banheiro_escova = '3' ;

SELECT banheiro_quarto.banheiro_vaso, quarto.quarto_tvs
FROM banheiro_quarto
CROSS JOIN quarto ON banheiro_quarto.banheiro_vaso = quarto.quarto_tvs
WHERE banheiro_quarto.banheiro_vaso = 'vasonovo' ;

-- 7)
SELECT * FROM sala
ORDER BY quarto;

SELECT shampoo_qnt FROM banheiro
ORDER BY toalha_qnt;

SELECT * FROM banheiro_quarto
ORDER BY banheiro_pia;

SELECT * FROM quarto
ORDER BY quarto_tvs;

SELECT * FROM cozinha
ORDER BY cozinha_mesa;

-- 8)
SELECT * FROM banheiro_quarto
ORDER BY banheiro_quarto_ID DESC;

SELECT banheiro_pia, banheiro_vaso FROM banheiro_quarto
ORDER BY banheiro_pia;

SELECT * FROM quarto
ORDER BY quarto_tvs;

SELECT * FROM quarto
ORDER BY quarto_camas DESC;

SELECT * FROM garagem
ORDER BY garagem_ferramentas;

-- 9)

SELECT banheiro_quarto.banheiro_banho, garagem.garagem_carro
FROM banheiro_quarto
LEFT OUTER JOIN garagem ON banheiro_quarto.banheiro_banho = garagem.garagem_carro
WHERE banheiro_quarto.banheiro_banho = 'banhoexp'
ORDER BY banheiro_quarto.banheiro_banho;

SELECT garagem.garagem_carro, cozinha.cozinha_fogao
FROM garagem
RIGHT OUTER JOIN cozinha ON garagem.garagem_carro = cozinha.cozinha_fogao
WHERE garagem.garagem_carro = 'Mustang'
ORDER BY garagem.garagem_carro ;

SELECT banheiro.tamanho_banheiro, garagem_info.garagem_tamanho
FROM banheiro
INNER JOIN garagem_info ON banheiro.tamanho_banheiro = garagem_info.garagem_tamanho
WHERE banheiro.tamanho_banheiro = 'Grande'
ORDER BY banheiro.tamanho_banheiro;

SELECT * FROM banheiro;
SELECT * FROM garagem_info;

-- 10)
SELECT SUM(banheiro_escova) AS SUM
FROM banheiro_quarto;

SELECT MIN(banheiro_quarto_ID) AS MIN
FROM banheiro_quarto;

SELECT MAX(sala_ID) AS MAX
FROM sala;

SELECT AVG(quarto_ID) AS AVERAGE
FROM quarto;

SELECT SUM(garagem_ID) AS SUM
FROM garagem;

SELECT MIN(cozinha_ID) AS MIN
FROM cozinha;

SELECT MAX(sala_ID) AS MAX
FROM sala;

-- 11)

CREATE VIEW VIEW_banheiro_quarto
AS SELECT * FROM banheiro_quarto;

CREATE VIEW VIEW_garagem
AS SELECT * FROM garagem;

CREATE VIEW VIEW_cozinha
AS SELECT * FROM cozinha;

CREATE VIEW VIEW_banheiro
AS SELECT * FROM banheiro;

CREATE VIEW VIEW_sala
AS SELECT * FROM sala;

-- 12)

START TRANSACTION;
INSERT INTO banheiro_quarto VALUES(16, 2, "pianew", "vasonew", "banhonew");
SAVEPOINT SAVEPOINT1;

INSERT INTO garagem VALUES(16, "carrow", "4");
SAVEPOINT SAVEPOINT2;

INSERT INTO banheiro VALUES(16, "um", "dois", "medio");
SAVEPOINT SAVEPOINT3;

INSERT INTO cozinha VALUES(16, "fogaoo", "mesaa");
SAVEPOINT SAVEPOINT4;

INSERT INTO garagem_info VALUES(16, "Sanderooo", "trees", "grandeee", 16);
SAVEPOINT SAVEPOINT5;

-- 13)

CREATE USER USER1@LOCALHOST
IDENTIFIED BY '95279';

CREATE USER USER2@LOCALHOST
IDENTIFIED BY '93765';

CREATE USER USER3@LOCALHOST
IDENTIFIED BY '12131';

GRANT ALL ON sala.* TO 'USER1'@'LOCALHOST';

GRANT INSERT ON garagem.* TO 'USER2'@'LOCALHOST';

GRANT SELECT ON banheiro.* TO 'USER3'@'LOCALHOST';

-- add)

INSERT INTO sala VALUES (1, "sofagrande", "samsung", 1,"sofasdois"),
(2, "sofapequeno", "lg", 2, "sofaum"),
(3, "sofamedio", "tippie", 3, "sofadois"),
(4, "sofapequeno", "munder", 4, "sofatres"),
(5, "sofagrande", "nunda", 5, "sofadois"),
(6, "sofamedio", "pleaw", 6, "sofaum"),
(7, "sofagrande", "plunto", 7, "sofatres"),
(8, "sofapequeno", "kweller", 8, "sofadois"),
(9, "sofamedio", "twin", 9, "sofatres"),
(10, "sofamedio", "hert", 10, "sofaum"),
(11, "sofapequeno", "blunto", 11, "sofadois"),
(12, "sofagrande", "lgbet", 12, "sofaum"),
(13, "sofamedio", "microsoft", 13, "sofadois"),
(14, "sofagrande", "mixee", 14,"sofatres"),
(15, "sofapequeno", "heartk", 15, "sofadois");

select*from sala;

INSERT INTO cozinha
VALUES (1, "fogao", "mesa"),
(2, "fogaopequeno", "mesamedia"),
(3, "fogaomedio", "mesapequena"),
(4, "fogaopequeno", "mesagrande"),
(5, "fogaomedio", "mesamedia"),
(6, "fogaopequeno", "mesapequena"),
(7, "fogaomedio", "mesagrande"),
(8, "fogaopequeno", "mesagrande"),
(9, "fogaogrande", "mesapequena"),
(10, "fogaomedio", "mesagrande"),
(11, "fogaopequeno", "mesagrande"),
(12, "fogaogrande", "mesagrande"),
(13, "fogaomedio", "mesapequena"),
(14, "fogaopequeno", "mesapequena"),
(15, "fogaogrande", "mesapequena");

select * from cozinha;


INSERT INTO banheiro_quarto VALUES (1, 2, "piaexp", "vasoexp", "banhoexp"),
(2, 1, "piamaster", "vasomaster", "banhomaster"),
(3, 3, "pianova", "vasonovo", "banhonovo"),
(4, 2, "piaret", "vasoret", "banhoret"),
(5, 3, "piaye", "vasoye", "banhoye"),
(6, 6, "piawe", "vasowe", "banhowe"),
(7, 3, "piatw", "vasotw", "banhotw"),
(8, 2, "piauw", "vasouw", "banhouw"),
(9, 3, "piaqi", "vasoqi", "banhoqi"),
(10, 4, "piajt", "vasojt", "banhojt"),
(11, 2, "piayx", "vasoyx", "banhoyx"),
(12, 3, "piakw", "vasokw", "banhokw"),
(13, 6, "piakwer", "vasokwer", "banhokwer"),
(14, 3, "piaant", "vasoant", "banhoant"),
(15, 4, "piajun", "vasojun", "banhojun");

select*from banheiro_quarto;


INSERT INTO quarto VALUES (1, 1, 1, "tvsgrande"),
(2, 2, 2, "tvsmedio"),
(3, 3, 1, "tvspequeno"),
(4, 4, 2, "tvsgrande"),
(5, 5, 1, "tvspequeno"),
(6, 6, 2, "tvsgrande"),
(7, 7, 4, "tvsmedio"),
(8, 8, 3, "tvspequeno"),
(9, 9, 2, "tvspequeno"),
(10, 10, 3, "tvsgrande"),
(11, 11, 2, "tvspequeno"),
(12, 12, 3, "tvsmedio"),
(13, 13, 2, "tvspequeno"),
(14, 14, 1, "tvsgrande"),
(15, 15, 4, "tvsmedio");

select*from quarto;


INSERT INTO banheiro VALUES (1, "dois", "dois", "grande"),
(2, "um", "dois", "medio"),
(3, "tres", "um", "pequeno"),
(4, "dois", "um", "medio"),
(5, "um", "um", "medio"),
(6, "tres", "tres", "pequeno"),
(7, "quatro", "tres", "medio"),
(8, "tres", "cinco", "pequeno"),
(9, "quatro", "cinco", "medio"),
(10, "sete", "sete", "pequeno"),
(11, "seis", "dois", "medio"),
(12, "um", "seis", "pequeno"),
(13, "dois", "cinco", "medio"),
(14, "tres", "sete", "pequeno"),
(15, "um", "dois", "grande");

select*from banheiro;



INSERT INTO garagem VALUES (1, "Mustang", "duas"),
(2, "Camaro", "tres"),
(3, "Ferrari", "quatro"),
(4, "Chevrolet", "tres"),
(5, "Pejot", "dois"),
(6, "Kombi", "quatro"),
(7, "FerrariX", "quatro"),
(8, "PejotX", "cinco"),
(9, "CrevroletX", "dois"),
(10, "CamaroX", "um"),
(11, "Gol", "dois"),
(12, "Palio", "um"),
(13, "Corsa", "quatro"),
(14, "Onix", "tres"),
(15, "Sandero", "dois");

select*from garagem;


INSERT INTO garagem_info VALUES (1, "Mustang", "duas", "grande", 3),
(2, "Camaro", "tres", "pequeno", 6),
(3, "Ferrari", "quatro", "medio", 9),
(4, "Chevrolet", "tres", "pequeno", 2),
(5, "Pejot", "dois", "medio", 1),
(6, "Kombi", "quatro", "pequeno", 4),
(7, "FerrariX", "quatro", "medio", 5),
(8, "PejotX", "cinco","pequeno", 7),
(9, "CrevroletX", "dois", "medio", 8),
(10, "CamaroX", "um", "grande", 10),
(11, "Gol", "dois", "grande", 11),
(12, "Palio", "um", "medio", 13),
(13, "Corsa", "quatro", "grande", 12),
(14, "Onix", "tres", "pequeno", 14),
(15, "Sandero", "dois", "medio", 15);

select*from garagem_info;

-- groupbyexercises)

SELECT garagem_carro, garagem_ferramentas
FROM garagem
GROUP BY garagem_carro;

SELECT garagem_ferramentas
FROM garagem_info
GROUP BY numerocarro;

SELECT cozinha_fogao
FROM cozinha
GROUP BY cozinha_mesa;

SELECT banheiro_vaso
FROM banheiro_quarto
GROUP BY banheiro_escova;

SELECT shampoo_qnt
FROM banheiro
GROUP BY toalha_qnt;
