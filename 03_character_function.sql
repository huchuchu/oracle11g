/*문자형 함수*/

-- concat( char1, char2 ) 문자열과 문자열을 합치는 함수
-- 데이터 타입이 같을경우 char1의 타입으로 반환함
-- char1 에 올 수 있는 타입 ::: char, varchar
-- 연산자 || 을 사용하여 합칠수도있다
select concat('hello', 'oracle'), concat('good', 'bad') from dual;
select concat('good','bad') concats, 'good' || 'bad' operators from dual; -- goodbad	goodbad

-- initcap(char) 첫번째 문자를 대문자로 바꿔줌
select initcap('good morning') from dual; -- Good Morning
                                          -- 공백을 구분자로 대문자가 적용됨
select initcap('good/bad morning') from dual; -- Good/Bad Morning
                                              -- / 는 알파벳이 아니기때문에 /도 구분자로 인식하여 B도 대문자출력
                                              
-- lower(char):: 소문자변환 , upper(char) :: 대문자변환
select lower('GOOD') from dual; -- good
select upper('good') from dual; -- GOOD

-- lpad() 왼쪽으로 두번째 파라미터만큼 글자 수를 추가함
-- LPAD1 도 6자리이며 공백으로 채워져있음
select lpad('good', 6) "LPAD1", lpad('good', 6, '@') "LPAD2", lpad('good', 8, 'L')
from dual; --   good	@@good

-- rpad(char)
select rpad('good', 6) "RPAD1", rpad('good', 6, '@') "RPAD2", rpad('good', 8, 'R')
from dual; --  good  	good@@	goodRRRR

-- *** 알파벳을 한글자당 1바이트, 한글은 글자당 2바이트이므로 한글을 쓸 때는 잘 계산해서 써야함
select lpad('홍길동', 6, '#') from dual; -- 홍길동 (이미 홍길동이 6바이트를 먹고있기때문)
select lpad('홍길동', 8, '#') from dual; -- ##홍길동 

-- ltrim(), rtrim() 문자열에서 무엇인가를 제거할 때 사용
select ltrim('goodbye') from dual; -- goodbye 자를게없음
select ltrim('goodbye', 'g'), ltrim('goodbye', 'o'), ltrim('goodbye', 'go') from dual; 
-- oodbye	goodbye (중간에있는건 못지움!!)  dbye (go에 포함된 문자 모두 지움)
select rtrim('goodbye', 'go') from dual; -- goodbye (오른쪽부터 go가 없기때문에 그대로 출력)

-- substr(char, 위치값, 몇개자를지) 문자 자르기
select substr('good morning jhon', 8, 4)from dual; -- rnin 8번째 글자부터 4개 (1부터시작, 공백포함)
select substr('good morning jhon', 8)from dual;  -- rning jhon 갯수를 생략하게되면 나머지 모두 출력

select substr('good morning jhon', -4) from dual; -- jhon 오른쪽 끝에서부터 4글자 반환
select substr('good morning jhon', -4, 2) from dual; -- jh
select substr('good morning jhon', -4, 0) from dual; -- null *** 0을 쓰면 null 반환!

--substrb() byte수만큼 갯수 가져옴
select substrb('good morning jhon', 8, 4)from dual; -- rnin
select substrb('good morning jhon', 8)from dual; -- rning jhon

select substrb('내일은월요일',2) from dual; --   일은월요일 
select substrb('내일은월요일',2,6) from dual; --  일 뭐지 이거 좀 이상해

-- replace() 교체
select replace('good morning tom' , 'morning', 'evening') from dual; -- good evening tom

--translate() 
select replace('You are not alone', 'You', 'We') replace , translate('You are not alone', 'You', 'We') translate from dual;
-- We are not alone  	We are net alene (1:1 대응하여 바뀜 Y는 w로 o 는 e로 바뀜)

-- trim() 
select length(trim(leading from 'good')) from dual; -- good,  4
select length(' good') from dual; -- 5
select length(trim(leading from ' good')) from dual; -- good 4 (trim 으로 공백잘림)
select length(trim(leading from ' good ')) ,  -- 5 왼쪽 자름
       length(trim(trailing from ' good ')) , -- 5 오름쪽 자름
       length(trim(both from ' good')),       -- 4 양쪽 공백자름
       trim(leading 'g' from 'good'),         -- ood ** 한글자만 자를 수 있음 
       trim(trailing 'd' from 'good')         -- goo
from dual;
select length(' g o o d ') from dual; -- 9
select length(trim(' g o o d ')) from dual; -- 7 가운데 공백은 안잘리넹..호옹
select replace(' g o o d ', ' ', '') from dual; -- good
select length(replace(' g o o d ', ' ', '')) from dual; -- 4 가운데공백 잘림!! 가운데 공백 자를때는 replace로 사용!


-- ascii() 문자열을 아스키값으로 출력
select ascii('a') from dual; --97

-- instr() 특정한 *문자열* 찾을 때
select instr('good morning jhon', 'or', 1) from dual; --7 일곱번째에 or나옴
select instr('good morning jhon', 'n', 1, 2) from dual; --11 첫번째글자부터 검색해서 n이 두번째로 나오는 위치


