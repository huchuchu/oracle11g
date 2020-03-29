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

--for문

begin
    FOR n IN 0..10 loop
        dbms_output.put_line( n );    
    end loop;
end;
/

-- 역순
begin
    for n in reverse 0..10 loop
        dbms_output.put_line( n );    
    end loop;
end;
/


-- 사원테이블에서 사원 id를 입력받아서 사원 이름의 문자 수만큼 ##을 찍는 pl/sql

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

--continue 문 : 보조제어문(11g부터 추가된 기능)

declare
    tot number :=0;
begin
    for i in 1..10 loop
        tot := tot+1;
        dbms_output.put_line ('tot : ' || tot );
        
        continue when (i>5); -- i가 5이상이면 아래 실행문을 실행하지않고 위로 올라간다
        tot := tot+i;
        dbms_output.put_line ('tot2 : ' || tot );
        

    end loop;

end;

/


