# REGISTER INSERTIONS
## Medical Registers
    INSERT INTO medico (nome_medico, CRM, contato_medico, atestado_medico, declarante_medico, atend_falecido_med, assinatura_medico) 
    VALUES ('Lucas Reis', 568901, 6198703030, '2015-08-2','Lucas Reis', 'sim', 'sim');
    INSERT INTO medico (nome_medico, CRM, contato_medico, atestado_medico, declarante_medico, atend_falecido_med, assinatura_medico) 
    VALUES ('Joao Lucas', 297546, 6198303070, '2016-10-5','Joao Lucas', 'sim', 'sim');
    INSERT INTO medico (nome_medico, CRM, contato_medico, atestado_medico, declarante_medico, atend_falecido_med, assinatura_medico) 
    VALUES ('Caroline Salvador', 879165, 6195822020, '2017-11-20','Caroline Salvador', 'sim', 'sim');

    INSERT INTO medico (nome_medico, CRM, contato_medico, atestado_medico, declarante_medico, atend_falecido_med, assinatura_medico)
    VALUES ('Jonatas Leonardo Siqueira', 847216, 6197861520, '2013-07-20','Jonatas Leonardo Siqueira', 'sim', 'sim');
    INSERT INTO medico (nome_medico, CRM, contato_medico, atestado_medico, declarante_medico, atend_falecido_med, assinatura_medico)
    VALUES ('Túlio Oliveira Ferdinando', 901278, 61988660540, '2010-01-11','Túlio Oliveira Ferdinando', 'sim', 'sim');
    INSERT INTO medico (nome_medico, CRM, contato_medico, atestado_medico, declarante_medico, atend_falecido_med, assinatura_medico)
    VALUES ('Ana Vitória Fagundes', 774120, 619782240, '2011-11-27','Ana Vitória Fagundes', 'não', 'sim');

    SELECT * FROM medico;

## Diagnostics
    INSERT INTO diagnostico (registro_diagnost, diagnostico_confir, morte_cirurgia, necropsia) 
    VALUES (001, 'sim', 'não', 'sim');
    INSERT INTO diagnostico (registro_diagnost, diagnostico_confir, morte_cirurgia, necropsia) 
    VALUES (002, 'sim', 'sim', 'sim');
    INSERT INTO diagnostico (registro_diagnost, diagnostico_confir, morte_cirurgia, necropsia) 
    VALUES (003, 'não', 'não', 'não');
    INSERT INTO diagnostico (registro_diagnost, diagnostico_confir, morte_cirurgia, necropsia) 
    VALUES (004, 'sim', 'não', 'não');
    INSERT INTO diagnostico (registro_diagnost, diagnostico_confir, morte_cirurgia, necropsia) 
    VALUES (005, 'sim', 'não', 'não');
    INSERT INTO diagnostico (registro_diagnost, diagnostico_confir, morte_cirurgia, necropsia) 
    VALUES (006, 'sim', 'não', 'sim');

    SELECT * FROM diagnostico;

## Association table (REALIZA)
    INSERT INTO realiza(CRM, registro_diagnost) 
    VALUES(297546, 1), (568901, 2), (879165, 3);

    INSERT INTO realiza(CRM, registro_diagnost) 
    VALUES(847216, 4), (901278, 5), (774120, 6);

    SELECT * FROM realiza;

## Disease causes
    INSERT INTO causa_doenca (doenca_causa, comorbidade, CID) 
    VALUES ('ataque-cardiaco','pressão arterial', 160);
    INSERT INTO causa_doenca (doenca_causa, comorbidade, CID, doencaCausa_contrib) 
    VALUES ('Virus','diabetes', 104, 'O paciente possuia insuficiência renal crônica e insufissiência respiratória por tabagismo');
    INSERT INTO causa_doenca (doenca_causa, comorbidade, CID)
    VALUES ('Morte-Cerebral','AVC', 126);

    SELECT * FROM causa_doenca;

## Association table (CAUSA_DOENCA)
    INSERT INTO relata (registro_diagnost, CID)
    VALUES(1, 160), (2, 104), (3, 126);

    SELECT * FROM relata;

## External Causes
    INSERT INTO causas_externas (cod_causa, tipo_morte, acidenteTrabalho_morte, endereco_ocorrencia, codigo_endereco, testemunha, localOcorrencia_morte, fonte_morte)
    VALUES (001, 'acidente por queda', 'sim', 'Condomínio Vivendas', 0705, 'Maria Joaquina',  'em casa', 'família');

    INSERT INTO causas_externas (cod_causa, tipo_morte, acidenteTrabalho_morte, endereco_ocorrencia, codigo_endereco, testemunha, localOcorrencia_morte, fonte_morte)
    VALUES (002, 'acidente por trânsito', 'não', 'Rua Augusta', 0105, 'Márcia Costa da Silva',  'rodovia', 'boletim de ocorrência');

    INSERT INTO causas_externas (cod_causa, tipo_morte, acidenteTrabalho_morte, endereco_ocorrencia, codigo_endereco, testemunha, localOcorrencia_morte, fonte_morte)
    VALUES (003, 'suicídio', 'não', 'Praça dos Cristais', 4579, 'Lucas Hernandes Silveira',  'praça pública', 'IML');

    SELECT * FROM causas_externas;

## Association table (PERICIA)
    INSERT INTO pericia(registro_diagnost, cod_causa)
    VALUES(004, 001);
    INSERT INTO pericia(registro_diagnost, cod_causa)
    VALUES(005, 002);
    INSERT INTO pericia(registro_diagnost, cod_causa)
    VALUES(006, 003);

    SELECT * FROM pericia;

## Registry Information
    INSERT INTO cartorio(cod_cartorio, nome_cartorio, registro, cemiterio, UF, municipio)
    VALUES(1, 'Primeiro Ofício', 'EBN3536', 'Cemitério Campo da Esperança', 'DF', 'Brasília');

    SELECT * FROM cartorio;

## Identification Registers

    INSERT INTO identificacao (cod_obito, nome_falecido, tipo_obito, dt_nascimento, RIC, dt_hr_obito, estado_civ, sexo, naturalidade, cod_cartorio, raca, ocupacao, escolaridade, mae, idade_fetal) 
    VALUES (1, 'José Antônio Mesquita', 'não fetal','1945-10-05', '342560', '2021-01-06 10:34','casado','m','brasileiro', 1, 'branca', 'aposentado', '4 a 7', 'Maria Aparecida da Conceição', 'não se aplica');
    INSERT INTO identificacao (cod_obito, nome_falecido, tipo_obito, dt_nascimento, RIC, dt_hr_obito, estado_civ, sexo, naturalidade, cod_cartorio, raca, ocupacao, escolaridade, mae, idade_fetal) 
    VALUES (2, 'Antônio Pereira', 'não fetal','1946-11-06', '357550', '2021-05-06 11:30','Solteiro','m','brasileiro', 1, 'branca', 'estudando', '3 a 5', 'Ana Maria Pereira', 'não se aplica');
    INSERT INTO identificacao (cod_obito, nome_falecido, tipo_obito, dt_nascimento, RIC, dt_hr_obito, estado_civ, sexo, naturalidade, cod_cartorio, raca, ocupacao, escolaridade, mae, idade_fetal) 
    VALUES (3, 'Miguel Barbosa', 'não fetal','1947-12-04', '034256', '2020-01-05 12:04','casado','m','brasileiro', 1, 'Parda', 'aposentado', '4 a 7', 'Marluce Barbosa', 'não se aplica');
    INSERT INTO identificacao (cod_obito, nome_falecido, tipo_obito, dt_nascimento, RIC, dt_hr_obito, estado_civ, sexo, naturalidade, cod_cartorio, raca, ocupacao, escolaridade, mae, idade_fetal) 
    VALUES (4, 'Alice Nascimento', 'não fetal','1948-05-07', '250555', '2019-05-08 14:30','casada','f','brasileira', 1, 'negra', 'outros', '1 a 3', 'Helena Nascimento', 'não se aplica');
    INSERT INTO identificacao (cod_obito, nome_falecido, tipo_obito, dt_nascimento, RIC, dt_hr_obito, estado_civ, sexo, naturalidade, cod_cartorio, raca, ocupacao, escolaridade, mae, idade_fetal) 
    VALUES (5, 'Ronaldo Salvador', 'não fetal','1949-02-10', '060303', '2018-02-07 15:30','casado','m','brasileiro', 1, 'branca', 'aposentado', '4 a 7', 'Socorro Salvador', 'não se aplica');
    INSERT INTO identificacao (cod_obito, nome_falecido, tipo_obito, dt_nascimento, RIC, dt_hr_obito, estado_civ, sexo, naturalidade, cod_cartorio, raca, ocupacao, escolaridade, mae, idade_fetal) 
    VALUES (6, 'Gisele Pinheiro', 'não fetal','1950-10-10', '986532', '2017-09-06 16:35','casada','f','brasileira', 1, 'branca', 'estudando', '3 a 5', 'Maria Pinheiro', 'não se aplica');
    INSERT INTO identificacao (cod_obito, nome_falecido, tipo_obito, dt_nascimento, RIC, dt_hr_obito, estado_civ, sexo, naturalidade, cod_cartorio, raca, ocupacao, escolaridade, mae, idade_fetal) 
    VALUES (7, 'Laura Marcelino', 'fetal','2020-11-10', '254136', '2016-02-03 09:40','solteira','f','brasileira', 1, 'parda', 'estudando', '3 a 5', 'Antonieta Marcelino', '7 meses 10 dias 6 horas e 21 minutos');
    INSERT INTO identificacao (cod_obito, nome_falecido, tipo_obito, dt_nascimento, RIC, dt_hr_obito, estado_civ, sexo, naturalidade, cod_cartorio, raca, ocupacao, escolaridade, mae, idade_fetal) 
    VALUES (8, 'Gabriela Mascarenhas', 'fetal','2020-11-01', '324582', '2015-03-10 05:34','casada','f','brasileira', 1, 'negra', 'aposentado', '4 a 7', 'Elma Mascarenhas', '5 meses 27 dias 10 horas e 13 minutos');

    SELECT * FROM identificacao;

## Association table (POSSUI)
    INSERT INTO possui(cod_obito, registro_diagnost)
    VALUES(1, 1), (2, 2), (3, 3), (4, 4), (5 , 5), (6, 6);

    SELECT * FROM possui;

## Association table (DECLARA)
    INSERT INTO declara(CRM, cod_obito)
    VALUES(297546, 1), (568901, 2), (774120, 3), (847216, 4), (879165, 5), (901278, 6), (297546, 7), (568901, 8);

    SELECT * FROM declara;

## Fetal Deaths
    INSERT INTO obitos_fetais (CPF_mae, tipo_parto_mae, duracao_gestacao_mae, tipo_gravidez_mae, morte_parto_feto, peso_nasc_feto, morte_puerperio, morte_gravidez, assist_medica_mae)
    VALUES(056879123, 'cesareo', '42 semanas ou mais', 'única', 'depois', 300, 'sim - 43 dias a 1 ano', 'não', 'sim');
    INSERT INTO obitos_fetais (CPF_mae, tipo_parto_mae, duracao_gestacao_mae, tipo_gravidez_mae, morte_parto_feto, peso_nasc_feto, morte_puerperio, morte_gravidez, assist_medica_mae)
    VALUES(058974150, 'cesareo', '32 a 36 semanas', 'única', 'durante', 271, 'não', 'sim', 'sim');

    SELECT * FROM obitos_fetais;

## Association table (TIPIFICA)
    INSERT INTO tipifica(CPF_mae, cod_obito)
    VALUES(0568779123, 7), (058974150, 8);

    SELECT * FROM tipifica;

## Residence
    INSERT INTO residencia (endereco, codigo_resid, numero, CEP, bairro , cod_distrito, munic_residencia, UF) 
    VALUES ('Quadra 04, Conjunto C', 101, 04, '73092600', 'Sobradinho', 2030, 'Brasília', 'DF');
    INSERT INTO residencia (endereco, codigo_resid, numero, CEP, bairro , cod_distrito, munic_residencia, UF) 
    VALUES ('Quadra 27, Conjunto W', 105, 25, '73078540', 'Planaltina', 2030, 'Brasília', 'DF');
    INSERT INTO residencia (endereco, codigo_resid, numero, CEP, bairro , cod_distrito, munic_residencia, UF) 
    VALUES ('Quadra 18, Conjunto M', 110, 30, '73090502', 'Sobradinho', 2040, 'Brasília', 'DF');
    INSERT INTO residencia (endereco, codigo_resid, numero, CEP, bairro , cod_distrito, munic_residencia, UF) 
    VALUES ('Qms 31, Conjunto F', 115, 15, '73078852', 'Setor de mansoes', 2050, 'Brasília', 'DF');
    INSERT INTO residencia (endereco, codigo_resid, numero, CEP, bairro , cod_distrito, munic_residencia, UF) 
    VALUES ('Quadra 02, Conjunto B', 120, 20, '7303501', 'Sobradinho', 2060, 'Brasília', 'DF');
    INSERT INTO residencia (endereco, codigo_resid, numero, CEP, bairro , cod_distrito, munic_residencia, UF) 
    VALUES ('SGA SUL, Conjunto E', 130, 10, '73078742', 'Asa Sul', 2010, 'Brasília', 'DF');
    INSERT INTO residencia (endereco, codigo_resid, numero, CEP, bairro , cod_distrito, munic_residencia, UF) 
    VALUES ('QNR 27, Conjunto F', 13, 24, '7200522', 'Ceilandia', 2060, 'Brasília', 'DF');
    INSERT INTO residencia (endereco, codigo_resid, numero, CEP, bairro , cod_distrito, munic_residencia, UF) 
    VALUES ('Quadra 15, Conjunto M', 117, 30, '73090502', 'Sobradinho', 2040, 'Brasília', 'DF');

    SELECT * FROM residencia;

## Local Death
    INSERT INTO local_obito (cod_loc_obito, local_obito, munic_obito, codMunicipio_obito, UF_obito, CEP_obito, endereco_ocorrenc) 
    VALUES (3050, 'Hospital', 'Brasília', 203, 'DF', '73052000','Edifício Jequitibas, Bloco C');
    INSERT INTO local_obito (cod_loc_obito, local_obito, munic_obito, codMunicipio_obito, UF_obito, CEP_obito, endereco_ocorrenc) 
    VALUES (3057, 'Hospital', 'Brasília', 203, 'DF', '73062000','Edifício Hyara Center, Bloco M');
    INSERT INTO local_obito (cod_loc_obito, local_obito, munic_obito, codMunicipio_obito, UF_obito, CEP_obito, endereco_ocorrenc) 
    VALUES (1750, 'Hospital', 'Perdões', 110, 'MG', '73072000','Rua Lasmar, Bloco B');
    INSERT INTO local_obito (cod_loc_obito, local_obito, munic_obito, codMunicipio_obito, UF_obito, CEP_obito, endereco_ocorrenc) 
    VALUES (2570, 'Domicílio', 'Formosa', 140, 'GO', '73082000','Edifício Hyara , Bloco T');
    INSERT INTO local_obito (cod_loc_obito, local_obito, munic_obito, codMunicipio_obito, UF_obito, CEP_obito, endereco_ocorrenc) 
    VALUES (5680, 'Via Pública', 'São Paulo', 255, 'SP', '73022000','Edifício MegaInfo, Bloco A');
    INSERT INTO local_obito (cod_loc_obito, local_obito, munic_obito, codMunicipio_obito, UF_obito, CEP_obito, endereco_ocorrenc) 
    VALUES (6640, 'Outros', 'Rio de Janeiro', 350, 'RJ', '73012000','Copacabana Palace, 29');
    INSERT INTO local_obito (cod_loc_obito, local_obito, munic_obito, codMunicipio_obito, UF_obito, CEP_obito, endereco_ocorrenc) 
    VALUES (3630, 'Hospital', 'Curitiba', 590, 'PR', '73033000','Edifício João Doce, Bloco H');
    INSERT INTO local_obito (cod_loc_obito, local_obito, munic_obito, codMunicipio_obito, UF_obito, CEP_obito, endereco_ocorrenc) 
    VALUES (3054, 'Hospital', 'Planaltina', 203, 'DF', '73058000','Edifício Senai, Bloco F');

    SELECT * FROM local_obito;

## Association table (LOCALIZA)
    INSERT INTO localiza(cod_loc_obito, cod_obito, codigo_resid)
    VALUES (3050, 1, 101), (3057, 2, 105), (1750, 3, 110), (2570, 4, 115), (5680, 5, 120), (6640, 6, 130), (3630, 7, 13), (3054, 8, 117);

    SELECT * FROM localiza;




