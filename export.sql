--------------------------------------------------------
-- Archivo creado  - domingo-octubre-04-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table APARTMENTS
--------------------------------------------------------

  CREATE TABLE "buildingadmin"."APARTMENTS" SHARING=METADATA 
   (	"APARTMENT_ID" NUMBER, 
	"BUILDING_ID" NUMBER, 
	"APARTMENT_NUMBER" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BUILDINGS
--------------------------------------------------------

  CREATE TABLE "buildingadmin"."BUILDINGS" SHARING=METADATA 
   (	"BUILDING_ID" NUMBER, 
	"NAME" VARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into "buildingadmin".APARTMENTS
SET DEFINE OFF;
Insert into "buildingadmin".APARTMENTS (APARTMENT_ID,BUILDING_ID,APARTMENT_NUMBER) values ('1','1','101');
Insert into "buildingadmin".APARTMENTS (APARTMENT_ID,BUILDING_ID,APARTMENT_NUMBER) values ('2','1','102');
Insert into "buildingadmin".APARTMENTS (APARTMENT_ID,BUILDING_ID,APARTMENT_NUMBER) values ('3','2','201');
Insert into "buildingadmin".APARTMENTS (APARTMENT_ID,BUILDING_ID,APARTMENT_NUMBER) values ('4','2','202');
Insert into "buildingadmin".APARTMENTS (APARTMENT_ID,BUILDING_ID,APARTMENT_NUMBER) values ('5','3','301');
Insert into "buildingadmin".APARTMENTS (APARTMENT_ID,BUILDING_ID,APARTMENT_NUMBER) values ('6','3','302');
REM INSERTING into "buildingadmin".BUILDINGS
SET DEFINE OFF;
Insert into "buildingadmin".BUILDINGS (BUILDING_ID,NAME) values ('1','Building 1');
Insert into "buildingadmin".BUILDINGS (BUILDING_ID,NAME) values ('2','Building 2');
Insert into "buildingadmin".BUILDINGS (BUILDING_ID,NAME) values ('3','Building 3');
Insert into "buildingadmin".BUILDINGS (BUILDING_ID,NAME) values ('4','Building 4');
--------------------------------------------------------
--  DDL for Index PK_APARTMENTS
--------------------------------------------------------

  CREATE UNIQUE INDEX "buildingadmin"."PK_APARTMENTS" ON "buildingadmin"."APARTMENTS" ("APARTMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_BUILDINGS
--------------------------------------------------------

  CREATE UNIQUE INDEX "buildingadmin"."PK_BUILDINGS" ON "buildingadmin"."BUILDINGS" ("BUILDING_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Function QUERYBUILDINGS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE FUNCTION "buildingadmin"."QUERYBUILDINGS" (queryType IN NUMBER, dinamicWhere IN VARCHAR2)
RETURN SYS_REFCURSOR
IS
	resultSet SYS_REFCURSOR;
BEGIN
	IF queryType = 1 THEN
		OPEN resultSet FOR SELECT *
							 FROM buildings
							WHERE building_id = dinamicWhere;	
	ELSIF queryType = 2 THEN
		OPEN resultSet FOR SELECT name, apartment_number 
							 FROM buildings
							 INNER JOIN apartments
							 ON buildings.building_id = apartments.building_id
							WHERE buildings.building_id IN dinamicWhere;
	ELSIF queryType = 3 THEN
		OPEN resultSet FOR SELECT * 
							 FROM buildings
							WHERE building_id NOT IN(SELECT building_id 
													   FROM apartments);
	
	END IF;
	RETURN resultSet;
END queryBuildings;

/
--------------------------------------------------------
--  DDL for Synonymn CATALOG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."CATALOG" FOR "SYS"."CATALOG";
--------------------------------------------------------
--  DDL for Synonymn COL
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."COL" FOR "SYS"."COL";
--------------------------------------------------------
--  DDL for Synonymn PRODUCT_USER_PROFILE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."PRODUCT_USER_PROFILE" FOR "SYSTEM"."SQLPLUS_PRODUCT_PROFILE";
--------------------------------------------------------
--  DDL for Synonymn PUBLICSYN
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."PUBLICSYN" FOR "SYS"."PUBLICSYN";
--------------------------------------------------------
--  DDL for Synonymn SYSCATALOG
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."SYSCATALOG" FOR "SYS"."SYSCATALOG";
--------------------------------------------------------
--  DDL for Synonymn SYSFILES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."SYSFILES" FOR "SYS"."SYSFILES";
--------------------------------------------------------
--  DDL for Synonymn TAB
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."TAB" FOR "SYS"."TAB";
--------------------------------------------------------
--  DDL for Synonymn TABQUOTAS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE SYNONYM "SYSTEM"."TABQUOTAS" FOR "SYS"."TABQUOTAS";
