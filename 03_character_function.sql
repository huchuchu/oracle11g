/*������ �Լ�*/

-- concat( char1, char2 ) ���ڿ��� ���ڿ��� ��ġ�� �Լ�
-- ������ Ÿ���� ������� char1�� Ÿ������ ��ȯ��
-- char1 �� �� �� �ִ� Ÿ�� ::: char, varchar
-- ������ || �� ����Ͽ� ��ĥ�����ִ�
select concat('hello', 'oracle'), concat('good', 'bad') from dual;
select concat('good','bad') concats, 'good' || 'bad' operators from dual; -- goodbad	goodbad

-- initcap(char) ù��° ���ڸ� �빮�ڷ� �ٲ���
select initcap('good morning') from dual; -- Good Morning
                                          -- ������ �����ڷ� �빮�ڰ� �����
select initcap('good/bad morning') from dual; -- Good/Bad Morning
                                              -- / �� ���ĺ��� �ƴϱ⶧���� /�� �����ڷ� �ν��Ͽ� B�� �빮�����
                                              
-- lower(char):: �ҹ��ں�ȯ , upper(char) :: �빮�ں�ȯ
select lower('GOOD') from dual; -- good
select upper('good') from dual; -- GOOD

-- lpad() �������� �ι�° �Ķ���͸�ŭ ���� ���� �߰���
-- LPAD1 �� 6�ڸ��̸� �������� ä��������
select lpad('good', 6) "LPAD1", lpad('good', 6, '@') "LPAD2", lpad('good', 8, 'L')
from dual; --   good	@@good

-- rpad(char)
select rpad('good', 6) "RPAD1", rpad('good', 6, '@') "RPAD2", rpad('good', 8, 'R')
from dual; --  good  	good@@	goodRRRR

-- *** ���ĺ��� �ѱ��ڴ� 1����Ʈ, �ѱ��� ���ڴ� 2����Ʈ�̹Ƿ� �ѱ��� �� ���� �� ����ؼ� �����
select lpad('ȫ�浿', 6, '#') from dual; -- ȫ�浿 (�̹� ȫ�浿�� 6����Ʈ�� �԰��ֱ⶧��)
select lpad('ȫ�浿', 8, '#') from dual; -- ##ȫ�浿 

-- ltrim(), rtrim() ���ڿ����� �����ΰ��� ������ �� ���
select ltrim('goodbye') from dual; -- goodbye �ڸ��Ծ���
select ltrim('goodbye', 'g'), ltrim('goodbye', 'o'), ltrim('goodbye', 'go') from dual; 
-- oodbye	goodbye (�߰����ִ°� ������!!)  dbye (go�� ���Ե� ���� ��� ����)
select rtrim('goodbye', 'go') from dual; -- goodbye (�����ʺ��� go�� ���⶧���� �״�� ���)

-- substr(char, ��ġ��, ��ڸ���) ���� �ڸ���
select substr('good morning jhon', 8, 4)from dual; -- rnin 8��° ���ں��� 4�� (1���ͽ���, ��������)
select substr('good morning jhon', 8)from dual;  -- rning jhon ������ �����ϰԵǸ� ������ ��� ���

select substr('good morning jhon', -4) from dual; -- jhon ������ ���������� 4���� ��ȯ
select substr('good morning jhon', -4, 2) from dual; -- jh
select substr('good morning jhon', -4, 0) from dual; -- null *** 0�� ���� null ��ȯ!

--substrb() byte����ŭ ���� ������
select substrb('good morning jhon', 8, 4)from dual; -- rnin
select substrb('good morning jhon', 8)from dual; -- rning jhon

select substrb('������������',2) from dual; --   ���������� 
select substrb('������������',2,6) from dual; --  �� ���� �̰� �� �̻���

-- replace() ��ü
select replace('good morning tom' , 'morning', 'evening') from dual; -- good evening tom

--translate() 
select replace('You are not alone', 'You', 'We') replace , translate('You are not alone', 'You', 'We') translate from dual;
-- We are not alone  	We are net alene (1:1 �����Ͽ� �ٲ� Y�� w�� o �� e�� �ٲ�)

-- trim() 
select length(trim(leading from 'good')) from dual; -- good,  4
select length(' good') from dual; -- 5
select length(trim(leading from ' good')) from dual; -- good 4 (trim ���� �����߸�)
select length(trim(leading from ' good ')) ,  -- 5 ���� �ڸ�
       length(trim(trailing from ' good ')) , -- 5 ������ �ڸ�
       length(trim(both from ' good')),       -- 4 ���� �����ڸ�
       trim(leading 'g' from 'good'),         -- ood ** �ѱ��ڸ� �ڸ� �� ���� 
       trim(trailing 'd' from 'good')         -- goo
from dual;
select length(' g o o d ') from dual; -- 9
select length(trim(' g o o d ')) from dual; -- 7 ��� ������ ���߸���..ȣ��
select replace(' g o o d ', ' ', '') from dual; -- good
select length(replace(' g o o d ', ' ', '')) from dual; -- 4 ������� �߸�!! ��� ���� �ڸ����� replace�� ���!


-- ascii() ���ڿ��� �ƽ�Ű������ ���
select ascii('a') from dual; --97

-- instr() Ư���� *���ڿ�* ã�� ��
select instr('good morning jhon', 'or', 1) from dual; --7 �ϰ���°�� or����
select instr('good morning jhon', 'n', 1, 2) from dual; --11 ù��°���ں��� �˻��ؼ� n�� �ι�°�� ������ ��ġ


