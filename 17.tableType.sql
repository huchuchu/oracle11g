set serveroutput on;

declare
    tname varchar2(20);
    
    --정의
    Type t_emp_name is table of
    employees.last_name%type
    index by binary_integer;  --배열형식이므로 index가 필요한데 binary_integer타입의 index이다
    
    --선언
    v_name t_emp_name; -- v_name 은 테이블타입의 변수

begin
    
    select last_name into tname
    from employees 
    where employee_id = 100;
    
    v_name(0) := tname;    
    
    dbms_output.put_line(v_name(0));

end;

/


--반복문을 이용한 배열 출력

declare
    
    type tbl_type is table of
    employees.last_name%type
    index by binary_integer;
    
    vtbl_type tbl_type;
    
    --binary_integer 값을 0으로 초기화
    --i 라는 변수의 값을 초기화
    i binary_integer := 0;
    
begin

    for emp_name in (select last_name from employees) loop
    i:= i+1;
    vtbl_type(i) := emp_name.last_name; 
    end loop;
    for j in 1..i loop -- 변수 j를 1부터 i까지 돌리겠다
        dbms_output.put_line(vtbl_type(j));
    end loop;

end;

/

-- 바인트 변수 (비 PL/SQL 변수)
-- 호스트 환경에서 생성되어 데이터를 저장하기때문에 호스트변수라고 말한다 <- 변수를 선언하지않고 바로사용가능
-- 키워드 VARIABLE을 이용하며, SQL문이나 PL/SLQ블록에서도 사용가능
-- PL/SQL 블록이 실행된 후에도 엑세스가 가능하다
-- print 명령을 이용하여 출력이 가능하다
-- :을 붙여 이용한다

set autoprint on;

begin
    select (salary*12+nvl(commission_pct*salary,0)) into :vsal 
    from employees
    where employee_id = 100;
    
end;
/

print vsal; 

-- 값 안나옴...띠용..

    