create or replace procedure taxa(p_emp_id number, p_taxa number)
is
    v_emp_id number:= p_emp_id;
    v_taxa number := p_taxa;
begin
    update employees
    set salary = salary*v_taxa
    where employee_id = v_emp_id;
    
    commit;
end;
/