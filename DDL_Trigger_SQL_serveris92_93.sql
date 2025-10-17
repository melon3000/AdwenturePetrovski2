-- 92. DDL Trigger SQL serveris

-- DDL triggereid loomiseks süntaks
CREATE TRIGGER [Trigger_Name]
ON [Scope(Server/Database)]
FOR [EventType1, EventType2, EventType3]
AS
BEGIN
-- Triggeri keha
END

-- Trigger käivitub CREATE_TABLE DDL sündmuse korral
CREATE TRIGGER FirstTrigger
ON Database
FOR CREATE_TABLE
AS
BEGIN
PRINT 'Uus tabel on loodud'
END

CREATE TABLE test (id INT)

-- Trigger mitme sündmuse korral
ALTER TRIGGER FirstTrigger 
ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
PRINT 'Tabel on loodud, muudetud või kustutatud'
END

-- Tabeli loomise, muutmise või kustutamise takistamine
ALTER TRIGGER FirstTrigger 
ON Database
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
ROLLBACK
PRINT 'Tabeli loomine, muutmine või kustutamine pole lubatud'
END

-- Triggeri keelamine
DISABLE TRIGGER FirstTrigger ON DATABASE
-- Triggeri kustutamine
DROP TRIGGER FirstTrigger ON DATABASE

-- Trigger sp_rename käivitamisel
CREATE TRIGGER RenameTable 
ON Database
FOR RENAME
AS
BEGIN
ROLLBACK
PRINT 'Te tegite ümbernimetuse'
END
