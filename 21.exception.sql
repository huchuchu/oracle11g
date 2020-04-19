/*
예외처리
--에러
1. 컴파일 에러 : PL/SQL 블록이 parse되는 동안에 발생하는 에러(ex. 사용자 오타) 
2. 런타임 에러 (=exception) : PL/SQL 블록이 실행되는 동안 발생하는 에러
    a. 오라클 예외
        오라클에서 제공되는 예외
            ㄱ. paredefined ORACLE EXCEPTION 
                사전에 정해진 예외
                    ACCESS INTO NULL : 정의되지 않은 오브젝트 속성에 값을 할당하고자 했을 때 예외
                    CASE_NOT_FOUND : case문의 where절에 해당되는 조건이 없고 else절에도 없을경우에 발생
                    COLLECTION_IS_NULL : 선언되지 않은 컬렉션(nested table,varray)에 EXISTS 이외의 메소드를 사용했을 때 발생
                    CURSOR_ALREADY_OPEN : 이미 열려진 커서를 열려고할 때 발생
                    DUP_VAL_ON_INDEX : 유일한 인덱스에 중복값 입력했을 떄 발생
                    INVALID_CURSOR : 잘못된 커서 조작 실행될 때 발생
                    INVALID_NUMBER : 문자를 숫자로 변환시 실패가 될 때 발생
                    LOGIN_DENIED : 잘못된 사용자 명이나 암호로 로그인을 시도했을 때 발생
                    NO_DATA_FOUND : PL/SQL SELECT문이 한 것도 데이터를 리턴하지 못했을 때 발생(데이터가 없을 때?)
                    NO_LOGGED_ON : 접속되지않은 상태에서 데이터베이스에대한 요청이 PL/SQL프로그램으로 실행된 경우 발생
                    PROGRAM_ERROR : PL/SQL이 내부적인 문제를 가지고 있는 경우 발생
                    ROWTYPE_MISMATCH : 할당문에서 호스트 커서 변수와 PL/SQL 커서 변수의 데이터 형이 불일치 할 때 발생
                    STORAGE_ERROR : 메모리가 부족하거나 메모리상 문제가 있을 때 발생
                    SUBSCRIPT_BEYOND_COUNT : 컬렉션의 요소 개수보다 더 큰 첨자값으로 참조한 경우 발생되는 예외
                    SUBSCRIPT_OUTSIDE_LIMIT : 컨렉션의 첨자 한계를 벗어난 참조가 일어났을 때 발생
                    SYS_INVALID_ROWID : 문자열을 ROWID로 변환할 때 무효한 문자열의 표현일 경우 발생 (ROWID : 주소?)
                    TIMEOUT_ON_RESOURCE : 자원에 대한 대기시간이 초과했을 때 발생
                    TOO_MANY_ROWS : PL/SQL SELECT문이 두 건 이상의 행을 리턴 했을 때 발생되는 예외
                    VALUE_ERROR : 산술 변환 절삭 또는 크기 제약에 에러가 생겼을 떄 발생
                    ZERO_DIVIDE  : 0으로 나누려 했을 떄 발생
                    
            ㄴ. Non-Predefined ORACLE Exception
                사전에 정해지지 않은 예외
    b. 사용자 정의 예외
        사용자에 의해 정의되는 예외
        
        declare 부에서 
        예외명 exception; (예외선언)
        begin부 나 exception부에서 raise문을 이용해서 예외를 발생               

        예외처리부 형식 
        예외처리부 : 예외발생시 어떻게 처리 할 것인지에 대한 내용이 들어간다
        
        Exception
            when 예외명 then
                실행문...
            when 예외명2 then
                실행문...
            when OTHERS then
                실행문...
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
    
    dbms_output.put_line('사원명은' || emp_lastname || '입니다');
    
    exception
        when no_data_found 
        then dbms_output.put_line('해당사원이 없습니다');
        when too_many_rows 
        then dbms_output.put_line('사원이 두명 이상입니다');    
end;
/

-- 사용자 정의 예외처리

declare
    emp_exist exception;
    pragma exception_init(emp_exist, -2292); -- 실행 중 이 예외가 있을 때 코드명 -2292로 처리하겠다
                                             -- pragma: 저렇게 예외처리 하겠다고 컴파일러에게 지시하는 키워드
begin
    delete departments
    where department_id = &deptno;


    commit;
    
    exception 
        when emp_exist then 
        DBMS_OUTPUT.PUT_LINE('사원이 존재하기때문에 지울 수 없습니다');

end;

/

--raise 이용한 예외처리

declare
    emp_id employees.employee_id%type;
    emp_name employees.last_name%type;
    
    no_emp exception;
begin
    
    delete employees
    where employee_id = &empid;
    
    if sql%notfound then    --묵시적커서 이용
        raise no_emp;
    end if;
    
    exception
    when no_emp then
            DBMS_OUTPUT.PUT_LINE('해당사원이 없습니다');

end;
 /


-- raise_application_error 프로시저 이용(이용 가능한 번호 20000~20999)

declare
    emp_id employees.employee_id%type;
    emp_name employees.last_name%type;   

begin
    delete employees
    where employee_id = &empid;
    
    if sql%notfound then
    raise_application_error(-20111, '사원이 없습니다');
    end if;

end;
/

