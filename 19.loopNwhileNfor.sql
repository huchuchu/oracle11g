set serveroutput on;

-- loop
declare
    num number :=0;
 
 begin 
    loop
        dbms_output.put_line(num);
        num := num+1;
        exit when num > 10;
    end loop;

end;

/

--while 

declare
    num number:=0;
    
begin
    while num <11 loop
        dbms_output.put_line(num);
        num := num+1;
    end loop;
end;

/

declare
    num number := 10;

begin
    loop
        dbms_output.put_line(num);
        num := num-1;
        exit when num = -1;
    end loop;
end;
/

declare
    num number := 10;

begin
    while num >=0 loop
        dbms_output.put_line(num);
    num := num -1;
    end loop;
end;
/

--for��

begin
    FOR n IN 0..10 loop
        dbms_output.put_line( n );    
    end loop;
end;
/

-- ����
begin
    for n in reverse 0..10 loop
        dbms_output.put_line( n );    
    end loop;
end;
/


-- ������̺��� ��� id�� �Է¹޾Ƽ� ��� �̸��� ���� ����ŭ ##�� ��� pl/sql

declare
    cnt number; 
    no number := &employee_id;
    sign varchar2(20);
    realname varchar2(20);
begin
    select length(first_name ), first_name into cnt, realname 
    from employees
    where employee_id = no;
    
    sign := '';
    
    for n in 1..cnt loop
        sign := sign || '#';
    end loop;    
    
    dbms_output.put_line (realname);
    dbms_output.put_line (sign);
end;

/




