-- DEFINIÇÃO DE USUÁRIOS E ACESSO
CREATE USER gabriel@'187.0.00.000' identified by '123456'; -- IP GLOBAL
CREATE USER bruno@'192.168.000.0' identified by '654321'; -- IP LOCAL
CREATE USER luan@localhost identified by '654321';
CREATE USER ruan@localhost identified by '654321';

SELECT user, host
FROM mysql.user;

GRANT ALL PRIVILEGES ON mydb.* to gabriel@'187.0.00.000';
GRANT SELECT, INSERT, CREATE, UPDATE, DELETE
ON mydb.* TO bruno@'192.168.000.0';
GRANT SELECT, INSERT, CREATE, UPDATE, DELETE
ON mydb.* TO luan@localhost;
GRANT SELECT, INSERT, CREATE, UPDATE, DELETE
ON mydb.* TO ruan@localhost;
SHOW GRANTS FOR 'gabriel'@'187.0.00.000';
SHOW GRANTS FOR bruno@'192.168.000.0';
SHOW GRANTS FOR luan@localhost;
SHOW GRANTS FOR ruan@localhost;