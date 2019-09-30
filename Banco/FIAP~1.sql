/*create or replace package comm_pkg is
std_comm number := 0.10; --initialized to 0.10
procedure reset_comm(new_comm NUMBER);
end comm_pkg;


CREATE OR REPLACE PACKAGE BODY comm_pkg IS
  FUNCTION validate(comm NUMBER) RETURN BOOLEAN IS
    max_comm employees.commission_pct%type;
  BEGIN
    SELECT MAX(commission_pct) INTO max_comm
    FROM   employees;
    RETURN (comm BETWEEN 0.0 AND max_comm);
  END validate;
  PROCEDURE reset_comm (new_comm NUMBER) IS BEGIN
    IF validate(new_comm) THEN
      std_comm := new_comm; -- reset public var
    ELSE  RAISE_APPLICATION_ERROR(
            -20210, 'Bad Commission');
    END IF;
  END reset_comm;
END comm_pkg;*/

create or replace function valida_cpf (p_cpf number)
return varchar
is
    v_cpf         varchar(30):=p_cpf;
    v_digentrada  char(2):=substr(v_cpf,10,11);
    v_dig         number(3):=0;
    v_dig1        number(3):=0;
    v_dig2        number(3):=0;
    v_i           number(2) :=11;
    v_i2          number(2) :=12;
    e_cpfinvalido exception;
begin
     if length(v_cpf) <> 11 then
         raise e_cpfinvalido;
     end if;
     for i in  2..10 loop
         v_i:=v_i-1;
         v_dig:=substr(v_cpf,i-1,1)*v_i;
         v_dig1:=v_dig1+v_dig;
     end loop;
     v_dig1 := mod(v_dig1,11);
     if v_dig1 < 2 then
        v_dig1:=0;
     else
        v_dig1:=11-v_dig1;
     end if;

     for i in  2..11 loop
         v_dig:=substr(v_cpf,i-1,1)*v_i2;
         v_dig2:=v_dig2+v_dig;
     end loop;
     v_dig2 := mod(v_dig2,11);
     if v_dig2 < 2 then
        v_dig2:=0;
     else
        v_dig2:=11-v_dig2;
     end if;

     v_dig:=v_dig1||v_dig2;
     if v_digentrada=v_dig then
        return  'CPF V�lido';
     else
         return 'CPF Inv�lido';
     end if;
EXCEPTION 
   WHEN e_cpfinvalido THEN
   return ('N�mero de CPF inv�lido. O CPF deve conter 11 d�gitos');
end valida_cpf;

select valida_cpf(44685957873) from dual;
