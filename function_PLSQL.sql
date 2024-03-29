/*CREATE OR REPLACE FUNCTION tax(value IN NUMBER)
RETURN NUMBER IS
BEGIN
RETURN (VALUE * 0.08);
END TAX;
/
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, TAX(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;/*

/*Crie uma procedure chamada CAD_EMPLOYEES que realiza o cadastramento de um
FUNCIONARIO. Para isso utilize a tabela EMPLOYEES. Crie as exce��es necess�rias
(pelo menos duas) para o funcionamento correto desse procedimento.
Utilize a estrutura a seguir para a tabela de empregados:*/
/*Nome Nulo? Tipo
-------------- -------- ------------
EMPLOYEE_ID NOT NULL NUMBER(6)
FIRST_NAME VARCHAR2(20)
LAST_NAME NOT NULL VARCHAR2(25)
EMAIL NOT NULL VARCHAR2(25)
PHONE_NUMBER VARCHAR2(20)
HIRE_DATE NOT NULL DATE
JOB_ID NOT NULL VARCHAR2(10)
SALARY NUMBER(8,2)
COMMISSION_PCT NUMBER(2,2)
MANAGER_ID NUMBER(6)
DEPARTMENT_ID NUMBER(4)*/


CREATE OR REPLACE PROCEDURE ADD_EMP(
COD EMPLOYEES.EMPLOYEE_ID%TYPE:= NOT NULL (6),
FN EMPLOYEES.FIRST_NAME%TYPE:= VARCHAR(20) )
