/*
����ó��
--����
1. ������ ���� : PL/SQL ����� parse�Ǵ� ���ȿ� �߻��ϴ� ����(ex. ����� ��Ÿ) 
2. ��Ÿ�� ���� (=exception) : PL/SQL ����� ����Ǵ� ���� �߻��ϴ� ����
    a. ����Ŭ ����
        ����Ŭ���� �����Ǵ� ����
            ��. paredefined ORACLE EXCEPTION 
                ������ ������ ����
                    ACCESS INTO NULL : ���ǵ��� ���� ������Ʈ �Ӽ��� ���� �Ҵ��ϰ��� ���� �� ����
                    CASE_NOT_FOUND : case���� where���� �ش�Ǵ� ������ ���� else������ ������쿡 �߻�
                    COLLECTION_IS_NULL : ������� ���� �÷���(nested table,varray)�� EXISTS �̿��� �޼ҵ带 ������� �� �߻�
                    CURSOR_ALREADY_OPEN : �̹� ������ Ŀ���� �������� �� �߻�
                    DUP_VAL_ON_INDEX : ������ �ε����� �ߺ��� �Է����� �� �߻�
                    INVALID_CURSOR : �߸��� Ŀ�� ���� ����� �� �߻�
                    INVALID_NUMBER : ���ڸ� ���ڷ� ��ȯ�� ���а� �� �� �߻�
                    LOGIN_DENIED : �߸��� ����� ���̳� ��ȣ�� �α����� �õ����� �� �߻�
                    NO_DATA_FOUND : PL/SQL SELECT���� �� �͵� �����͸� �������� ������ �� �߻�(�����Ͱ� ���� ��?)
                    NO_LOGGED_ON : ���ӵ������� ���¿��� �����ͺ��̽������� ��û�� PL/SQL���α׷����� ����� ��� �߻�
                    PROGRAM_ERROR : PL/SQL�� �������� ������ ������ �ִ� ��� �߻�
                    ROWTYPE_MISMATCH : �Ҵ繮���� ȣ��Ʈ Ŀ�� ������ PL/SQL Ŀ�� ������ ������ ���� ����ġ �� �� �߻�
                    STORAGE_ERROR : �޸𸮰� �����ϰų� �޸𸮻� ������ ���� �� �߻�
                    SUBSCRIPT_BEYOND_COUNT : �÷����� ��� �������� �� ū ÷�ڰ����� ������ ��� �߻��Ǵ� ����
                    SUBSCRIPT_OUTSIDE_LIMIT : �������� ÷�� �Ѱ踦 ��� ������ �Ͼ�� �� �߻�
                    SYS_INVALID_ROWID : ���ڿ��� ROWID�� ��ȯ�� �� ��ȿ�� ���ڿ��� ǥ���� ��� �߻� (ROWID : �ּ�?)
                    TIMEOUT_ON_RESOURCE : �ڿ��� ���� ���ð��� �ʰ����� �� �߻�
                    TOO_MANY_ROWS : PL/SQL SELECT���� �� �� �̻��� ���� ���� ���� �� �߻��Ǵ� ����
                    VALUE_ERROR : ��� ��ȯ ���� �Ǵ� ũ�� ���࿡ ������ ������ �� �߻�
                    ZERO_DIVIDE  : 0���� ������ ���� �� �߻�
                    
            ��. Non-Predefined ORACLE Exception
                ������ �������� ���� ����
    b. ����� ���� ����
        ����ڿ� ���� ���ǵǴ� ����
        
        declare �ο��� 
        ���ܸ� exception; (���ܼ���)
        begin�� �� exception�ο��� raise���� �̿��ؼ� ���ܸ� �߻�               

        ����ó���� ���� 
        ����ó���� : ���ܹ߻��� ��� ó�� �� �������� ���� ������ ����
        
        Exception
            when ���ܸ� then
                ���๮...
            when ���ܸ�2 then
                ���๮...
            when OTHERS then
                ���๮...
`
*/


set SERVEROUTPU on;

--predefined oracle exception

declare
    emp_lastname employees.last_name%type;

begin
    select last_name into emp_lastname
    from employees
    where last_name like 'z%';
    
    dbms_output.put_line('�������' || emp_lastname || '�Դϴ�');
    
    exception
        when no_data_found 
        then dbms_output.put_line('�ش����� �����ϴ�');
        when too_many_rows 
        then dbms_output.put_line('����� �θ� �̻��Դϴ�');    
end;
/

-- ����� ���� ����ó��

declare
    emp_exist exception;
    pragma exception_init(emp_exist, -2292); -- ���� �� �� ���ܰ� ���� �� �ڵ�� -2292�� ó���ϰڴ�
                                             -- pragma: ������ ����ó�� �ϰڴٰ� �����Ϸ����� �����ϴ� Ű����
begin
    delete departments
    where department_id = &deptno;


    commit;
    
    exception 
        when emp_exist then 
        DBMS_OUTPUT.PUT_LINE('����� �����ϱ⶧���� ���� �� �����ϴ�');

end;

/

--raise �̿��� ����ó��

declare
    emp_id employees.employee_id%type;
    emp_name employees.last_name%type;
    
    no_emp exception;
begin
    
    delete employees
    where employee_id = &empid;
    
    if sql%notfound then    --������Ŀ�� �̿�
        raise no_emp;
    end if;
    
    exception
    when no_emp then
            DBMS_OUTPUT.PUT_LINE('�ش����� �����ϴ�');

end;
 /


-- raise_application_error ���ν��� �̿�(�̿� ������ ��ȣ 20000~20999)

declare
    emp_id employees.employee_id%type;
    emp_name employees.last_name%type;   

begin
    delete employees
    where employee_id = &empid;
    
    if sql%notfound then
    raise_application_error(-20111, '����� �����ϴ�');
    end if;

end;
/

