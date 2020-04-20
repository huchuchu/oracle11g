set serveroutput on;

create or replace package emp_proc is
    procedure emp_sum;
    procedure emp_avg;
end;
/

create or replace package body emp_proc as
    procedure emp_sum is
        cursor emp_tot_sum is
            select count(*), sum(nvl(salary,0)) from employees;
            tot_num number;
            tot_sum number;
        begin
        open emp_tot_sum;
        fetch emp_tot_sum into tot_num, tot_sum;
            dbms_output.put_line('��ü�ο��� : ' || tot_num || ', �޿��հ� : ' || tot_sum);
        close emp_tot_sum;
    end emp_sum;
    
    procedure emp_avg is
        cursor emp_tot_avg is
            select count(*), avg(nvl(salary,0)) from employees;
            tot_num number;
            tot_avg number;
        begin
        open emp_tot_avg;
        fetch emp_tot_avg into tot_num, tot_avg;
            dbms_output.put_line('��ü�ο��� : ' || tot_num || ', ��ձ޿� : ' || tot_avg);
        close emp_tot_avg;
    end emp_avg;
end; --��Ű�� ��
/

--��Ű�� ������  : exec ��Ű����.���ν����̸�

exec emp_proc.emp_avg;
exec emp_proc.emp_sum;



