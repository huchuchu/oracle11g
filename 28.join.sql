commit;


select * from stdtbl; -- �л�
select * from clubtbl; -- Ŭ��
select * from stdclubtbl;-- �л�Ŭ��


-- �л��̸� ���� ���Ե��Ƹ� ���Ƹ� �̸�
select s.stdname, s.addr, sc.clubname ���Ե��Ƹ�, c.clubname ���Ƹ��̸�
    from stdtbl S
    inner join stdclubtbl SC
        on s.stdname = sc.stdname
    inner join clubtbl C
        on sc.clubname = c.clubname
order by s.stdname;

-- ���Ƹ� ������������ �л��� ���
select s.stdname, s.addr, sc.clubname ���Ե��Ƹ�, c.clubname ���Ƹ��̸�
    from stdtbl S
    left outer join stdclubtbl SC
        on s.stdname = sc.stdname
    left outer join clubtbl C
        on sc.clubname = c.clubname
order by s.stdname;


-- ���Ƹ��� ������ ȸ�� ���
select c.clubname ���Ƹ��̸�, c.roomno ���Ƹ��� ,SC.stdname  ������ , s.addr  ȸ���ּ�
    from clubtbl C
    inner join stdclubtbl SC
        on c.clubname = SC.clubname
    inner join stdtbl S
        on sc.stdname = s.stdname        
order by c.clubname;

-- ���Ƹ��� �������� ��� : ȸ���� ���� ���Ƹ��� ���
select c.clubname ���Ƹ��̸�, c.roomno ���Ƹ��� ,SC.stdname  ������ , s.addr  ȸ���ּ�
    from stdtbl S
        left outer join stdclubtbl SC
            on s.stdname = sc.stdname
        right outer join clubtbl C
            on SC.clubname = c.clubname
    order by c.clubname;
    
-- ���Ƹ��� �������� ���� �л��� ��µǰ� �л��� �Ѹ� ���� ���Ƹ��� ���

select s.stdname, s.addr, c.clubname, c.roomno
    from stdtbl S
    left outer join stdclubtbl SC
        on s.stdname = sc.stdname
    left outer join clubtbl C
        on sc.clubname = c.clubname
union
select  s.stdname, s.addr, c.clubname, c.roomno
    from stdtbl S
        left outer join stdclubtbl SC
            on s.stdname = sc.stdname
        right outer join clubtbl C
            on SC.clubname = c.clubname;


/*
<<< OUTER JOIN >>>
*/

-- 1. ���ű���� ���� ȸ���� ��� �̱�
select u.userid, u.username, b.prodname, u.addr, u.mobile1 || u.mobile2 as "����ó"
    from buytbl B
        right outer join usertbl U
            on u.userid = b.userid
    order by u.userid;

-- 2. ���ű���� ���� ȸ�� (buytbl�� ���� ȸ��) �̱�
select u.userid, u.username, b.prodname, u.addr, u.mobile1 || u.mobile2 as "����ó"
    from usertbl u
        left join buytbl B
            on u.userid = b.userid
    where b.prodname is null
    order by u.userid;

-- **. full outer join (=full join) left join + right join
-- ������ �������� ������ ��ġ���� �ʴ� ���� ����ϴ� ���� �ƴ϶�, ���� ��ο� ������ ��ġ���� �ʴ� ���� ��� ����ϴ� �����̴�


-- cross join

select * from buytbl cross join usertbl;

select stdname, addr from stdtbl
union all
select clubname, roomno from clubtbl;



