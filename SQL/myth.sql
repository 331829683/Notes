create table Test (a number(4),b varchar(6),c Date)

--  PL ����forѭ�����ļ�ʹ��
declare 
  v_num number:=0;
begin 
  for v_num in 1..20 loop
  insert into test values(v_num,'hi',sysdate);
  end loop;
end;
---���ÿ�����ʾ������
set serveroutput on  
--���Hello
declare 
begin 
  dbms_output.put_line('Hello ');
end;

declare 
  v_deptno employees.department_id%TYPE;
  cursor c_emp is select * from employees where department_id = v_deptno;
  v_emp c_emp%TYPE;
begin 
  v_deptno:=&x;
  open c_emp;
  Loop 
    fetch c_emp into v_emp;
    exit when c_emp%NOTFOUND;
    dbms_output.put_line(v_emp.employee_id||''||v_emp.first_name||''||v_emp.last_name||''||v_emp.salary||''||v_deptno);
    end Loop;
    close c_emp;
end;


  