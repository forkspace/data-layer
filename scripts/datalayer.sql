CONNECT SYS/oracle AS SYSDBA

DECLARE v_count NUMBER;
BEGIN
  SELECT COUNT (1) INTO v_count FROM dba_users WHERE username = UPPER ('DATALAYER');
  IF v_count != 0
  THEN
    EXECUTE IMMEDIATE ('DROP USER DATALAYER CASCADE');
  END IF;
END;
/
CREATE USER DATALAYER
  IDENTIFIED BY datalayer default tablespace users temporary tablespace temp;
/
GRANT CREATE SESSION TO DATALAYER;
GRANT CREATE TABLE TO DATALAYER;
GRANT CREATE VIEW TO DATALAYER;
GRANT CREATE TRIGGER TO DATALAYER;
GRANT CREATE PROCEDURE TO DATALAYER;
GRANT CREATE SEQUENCE TO DATALAYER;
GRANT CREATE SYNONYM TO DATALAYER;
GRANT EXECUTE ON SYS.DBMS_AQ TO DATALAYER;
GRANT EXECUTE ON SYS.DBMS_AQADM TO DATALAYER;
GRANT EXECUTE ON SYS.DBMS_JMS_PLSQL TO DATALAYER;
ALTER USER DATALAYER quota unlimited on USERS;
/

CREATE TABLE DATALAYER.DATA
(
	"ID" NUMBER(12,0) GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL,
	"DESCRIPTION" VARCHAR2(128 CHAR) NOT NULL,
	"TS" DATE NOT NULL
);
/


select * from DATALAYER.DATA;
