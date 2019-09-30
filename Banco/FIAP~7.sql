create table audit_emp
( username varchar(100),
time_stamp date,
id number(5),
old_last_name varchar(50),
new_last_name varchar(50),
old_title varchar(10),
new_title varchar(10),
old_salary number(7,2),
new_salary number(7,2));

CREATE OR REPLACE TRIGGER audit_emp_values
AFTER DELETE OR INSERT OR UPDATE ON employees
FOR EACH ROW
BEGIN
  INSERT INTO audit_emp(username, time_stamp, id,
    old_last_name, new_last_name, old_title,
    new_title, old_salary, new_salary)
  VALUES (USER, SYSDATE, :OLD.employee_id,
    :OLD.last_name, :NEW.last_name, :OLD.job_id,
    :NEW.job_id, :OLD.salary, :NEW.salary);
END;
/
alter trigger secure_emp disable;