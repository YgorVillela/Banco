CREATE OR REPLACE TRIGGER secure_emp
BEFORE INSERT ON employees BEGIN
 IF (TO_CHAR(SYSDATE,'DY') IN ('SAT','SUN','MON')) OR
     (TO_CHAR(SYSDATE,'HH24:MI') 										  NOT BETWEEN '12:00' AND '18:00') THEN
  RAISE_APPLICATION_ERROR(-20500, user|| ' You may insert'||' into EMPLOYEES table only during ' ||' business hours.');
  END IF;
END;
desc employees
insert into employees values(1,null,'Zé', 'a', null,sysdate,'AD_PRES',null,null,110,10);

CREATE OR REPLACE TRIGGER secure_emp
BEFORE INSERT ON employees BEGIN
 IF (TO_CHAR(SYSDATE,'DY') IN ('SAT','SUN','MON')) OR
     (TO_CHAR(SYSDATE,'HH24:MI') 										  NOT BETWEEN '12:00' AND '18:00') THEN
  RAISE_APPLICATION_ERROR(-20500, user|| '' || sys_context('userenv', 'host') ||' You may insert'||' into EMPLOYEES table only during ' ||' business hours.');
  END IF;
END;

CREATE OR REPLACE TRIGGER secure_emp
BEFORE INSERT ON employees BEGIN
 IF (TO_CHAR(SYSDATE,'DY') IN ('SAT','SUN','MON')) OR
     (TO_CHAR(SYSDATE,'HH24:MI') 										  NOT BETWEEN '12:00' AND '18:00') THEN
  RAISE_APPLICATION_ERROR(-20500, user|| ' ' || 
  sys_context('userenv','host')  || ' ' || sys_context('userenv','module') || ' ' || sys_context('userenv','IP_ADDRESS') );
  END IF;
END;