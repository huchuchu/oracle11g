
-- rowType ������ Ȱ���� �������� ����
declare
    c_rec row_test%RowType;
begin
    select * into c_rec
    from row_test
    where no = 3;
    
    c_rec.name := '�̱浿';
    
    update row_Test2 set row = c_rec -- ��ȣ ���⼭�� := �Ⱦ��� �׳� = ���
    where no = 3;
end; 

/

select * from row_Test2;

-- ����ڿ��� ���� �Է¹޾� ����
-- ġȯ������ & ���

declare
    no1 number := &no1;
    no2 number := &no2;
    vsum number;
begin
    vsum := no1 + no2;
    dbms_output.put_line('ù��°�� : ' || no1 || ', �ι�°��: ' || no2 || ', �հ�: '|| vsum);    
end;
/

set serveroutput on;

/* ���պ��� */


declare
    type emp_rec is record                     
    (
        emp_id      employees.employee_id%type,
        emp_name    employees.first_name%type,
        emp_job     employees.job_id%type
    );
    
    rec1    emp_rec;                           
    
begin
    select employee_id, first_name, job_id
    into rec1
    from employees
    where department_id = 10;    
    
    dbms_output.put_line ('���   �̸�  �������̵�');
    dbms_output.put_line (rec1.emp_id||' ' || rec1.emp_name || ' ' || rec1.emp_job);
end;

/


declare
    type emp_rec2 is record
    (
        emp_id          employees.employee_id%type,
        emp_name        employees.first_name%type,
        emp_email       employees.email%type,
        emp_salary      employees.salary%type
    );
    
    rec2    emp_rec2;
    
    -- ����ڿ��� �����ȣ�� �Է¹ޱ����� ���� ����
    vemp_id employees.employee_id%type := &empid;     -- ���� �� '' ���·� ���°��� �𸣰ڴ�....
                                                      -- ���� ����� ���� ''���·� �Ƚᵵ �����ȳ��� ������ ''���·� �ᵵ �����ȳ���
    
begin
    select employee_id , last_name, nvl(email, '����'), salary
    into rec2
    from employees
    where employee_id = vemp_id;
    
    dbms_output.put_line('��� : '|| rec2.emp_id);
    dbms_output.put_line('�̸� : '|| rec2.emp_name);
    dbms_output.put_line('�̸��� : '|| rec2.emp_email);
    dbms_output.put_line('�޿� : '|| rec2.emp_salary);

end;

/




