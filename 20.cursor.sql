set serveroutput on;

declare
    emp_id number;
    emp_name varchar2(20);
    emp_salary number(20);
    cnt number;
    
    -- ����� Ŀ�� ����
    Cursor cu1 is 
    select employee_id, last_name, salary
    from employees
    where department_id = 50;
    
begin
    -- ����� Ŀ�� ����
    open cu1;
    dbms_output.put_line (cnt);
    dbms_output.put_line ('���   �̸�  �޿�');
    
    loop
    -- Ŀ������ ������ ����
    fetch cu1 into emp_id, emp_name, emp_salary;
    
    -- ���� ( notFound : ������ �Ҵ� �� ���� ���� �� loop�� ���������ڴ�)
    exit when cu1%notFound; 
   dbms_output.put_line (emp_id ||' '||emp_name || ' ' || emp_salary );

    
    end loop;
    
    -- Ŀ�� �ݱ�
    close cu1;
    
end;
/

-- Ŀ���� �ݺ���(for��)

declare
    Cursor emp_cur is
    select employee_id, last_name
    from employees;
begin
    for emp_rec in emp_cur loop
       dbms_output.put_line (emp_rec.employee_id || ' ' || emp_rec.last_name);
    end loop;
end;
/

--rowType����

declare
    emp employees%rowtype;
    
    cursor cur1 is
    select employee_id, last_name, salary
    from employees;
    
begin
    for emp in cur1 loop
    exit when cur1%notfound;

    end loop;
end;

/


-- Ŀ���� ���������ʰ���

declare
begin
    for emp in (select employee_id, last_name, salary from employees)
    loop
    dbms_output.put_line (emp.employee_id || ' ' || emp.last_name || ' '|| emp.salary );
    end loop;

end;
/


-- ������Ŀ��

declare
 cnt1 number;
 cnt2 number;
 
begin
    select count(*) into cnt1
    from employees
    where department_id = 20;
    
    cnt2 := sql%rowcount;
    dbms_output.put_line ('cnt1�� �� : '||cnt1 );
    dbms_output.put_line ('cnt2�� �� : '||cnt2 );

end;    
/



