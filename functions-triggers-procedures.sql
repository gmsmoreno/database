-- SETANDO O USO DE FUNÇÃO
SET GLOBAL log_bin_trust_function_creators = 1;

-- FUNÇÃO QUE COLOCA PONTO NO RG
CREATE FUNCTION fn_identificacao_RG(a int)
RETURNS VARCHAR(15)
RETURN
	(SELECT CONCAT(LEFT(RIC, 1), '.', SUBSTRING(RIC, 2, 3), '.', SUBSTRING(RIC, 5, 3))
    FROM identificacao 
    WHERE cod_obito = a);

SELECT fn_identificacao_RG(1);

-- FUNÇÃO QUE COLOCA O PONTO E O TRAÇO DO DÍGITO VERIFICADOR EM CEP
CREATE FUNCTION fn_residencia_CEP(a int)
RETURNS VARCHAR(10)
RETURN
	(SELECT CONCAT(LEFT(CEP, 2), '.', SUBSTRING(CEP, 3, 3), '-', SUBSTRING(CEP, 6, 3))
    FROM residencia
    WHERE codigo_resid = a);

SELECT fn_residencia_CEP(117);

-- PROCEDURE
DROP PROCEDURE if exists verCEP;
CREATE PROCEDURE verCEP(cod int)
SELECT CONCAT('O CEP da residência será: ', LEFT(CEP, 2), '.', SUBSTRING(CEP, 3, 3), '-', SUBSTRING(CEP, 6, 3)) AS CEP
FROM residencia
WHERE codigo_resid = cod;

call verCEP(117);

-- TRIGGERS

-- PRIMEIRA TRIGGER
CREATE TABLE doencaCausa_consulta(
CID DECIMAL(4, 1),
doencaCausa_contrib VARCHAR(100),
PRIMARY KEY(CID)
);

DELIMITER $$

CREATE TRIGGER after_doencaCausa_insert 
AFTER INSERT
ON causa_doenca FOR EACH ROW
BEGIN 
	IF new.doencaCausa_contrib IS NULL THEN
    INSERT INTO doencaCausa_consulta(CID, doencaCausa_contrib)
    VALUES(new.CID, 'POR FAVOR, INSIRA UMA COMORBIDADE QUE CONTRIBUIU PARA O AGRAVAMENTO');
    END IF;
END$$

DELIMITER ;

SELECT * FROM doencaCausa_consulta;

-- SEGUNDA TRIGGER
CREATE TABLE CPF_mae_format(
CPF int,
CPF_mae1 varchar(40),
PRIMARY KEY(CPF_mae1));

DELIMITER $$

CREATE TRIGGER after_obitosFetais_insert
AFTER INSERT
ON obitos_fetais FOR EACH ROW
BEGIN
	IF new.CPF_mae IS NOT NULL THEN
	INSERT INTO CPF_mae_format(CPF, CPF_mae1)
    VALUES(new.CPF_mae, CONCAT('0', LEFT(new.CPF_mae, 2), '.', SUBSTRING(new.CPF_mae, 3, 3), '.', SUBSTRING(new.CPF_mae, 6, 3), '-', SUBSTRING(new.CPF_mae, 10, 2)));
    END IF;
END $$

DELIMITER ;

SELECT * FROM cpf_mae_format;