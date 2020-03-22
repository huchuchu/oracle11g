
-- rowType 변수를 활용한 데이터의 변경
declare
    c_rec row_test%RowType;
begin
    select * into c_rec
    from row_test
    where no = 3;
    
    c_rec.name := '이길동';
    
    update row_Test2 set row = c_rec -- 오호 여기서는 := 안쓰고 그냥 = 사용
    where no = 3;
end; 

/

select * from row_Test2;

-- 사용자에게 값을 입력받아 연산
-- 치환연산자 & 사용

declare
    no1 number := &no1;
    no2 number := &no2;
    vsum number;
begin
    vsum := no1 + no2;
    dbms_output.put_line('첫번째수 : ' || no1 || ', 두번째수: ' || no2 || ', 합계: '|| vsum);    
end;
/

set serveroutput on;

/* 복합변수 */


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
    
    dbms_output.put_line ('사번   이름  업무아이디');
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
    
    -- 사용자에게 사원번호를 입력받기위해 변수 생성
    vemp_id employees.employee_id%type := &empid;     -- 여기 왜 '' 형태로 쓰는건지 모르겠당....
                                                      -- 오잉 상관이 없나 ''형태로 안써도 에러안난고 위에도 ''형태로 써도 에러안난다
    
begin
    select employee_id , last_name, nvl(email, '없음'), salary
    into rec2
    from employees
    where employee_id = vemp_id;
    
    dbms_output.put_line('사번 : '|| rec2.emp_id);
    dbms_output.put_line('이름 : '|| rec2.emp_name);
    dbms_output.put_line('이메일 : '|| rec2.emp_email);
    dbms_output.put_line('급여 : '|| rec2.emp_salary);

end;

/




