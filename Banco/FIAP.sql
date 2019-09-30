create or replace package validador is
function valida_cpf (p_cpf number) return varchar;
procedure taxa(p_emp_id number, p_taxa number);
end;
/ 