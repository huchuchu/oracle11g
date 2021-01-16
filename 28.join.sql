commit;


select * from stdtbl; -- 학생
select * from clubtbl; -- 클럽
select * from stdclubtbl;-- 학생클럽


-- 학생이름 지역 가입동아리 동아리 이름
select s.stdname, s.addr, sc.clubname 가입동아리, c.clubname 동아리이름
    from stdtbl S
    inner join stdclubtbl SC
        on s.stdname = sc.stdname
    inner join clubtbl C
        on sc.clubname = c.clubname
order by s.stdname;

-- 동아리 가입하지않은 학생도 출력
select s.stdname, s.addr, sc.clubname 가입동아리, c.clubname 동아리이름
    from stdtbl S
    left outer join stdclubtbl SC
        on s.stdname = sc.stdname
    left outer join clubtbl C
        on sc.clubname = c.clubname
order by s.stdname;


-- 동아리에 가입한 회원 목록
select c.clubname 동아리이름, c.roomno 동아리실 ,SC.stdname  가입자 , s.addr  회원주소
    from clubtbl C
    inner join stdclubtbl SC
        on c.clubname = SC.clubname
    inner join stdtbl S
        on sc.stdname = s.stdname        
order by c.clubname;

-- 동아리를 기준으로 출력 : 회원이 없는 동아리도 출력
select c.clubname 동아리이름, c.roomno 동아리실 ,SC.stdname  가입자 , s.addr  회원주소
    from stdtbl S
        left outer join stdclubtbl SC
            on s.stdname = sc.stdname
        right outer join clubtbl C
            on SC.clubname = c.clubname
    order by c.clubname;
    
-- 동아리에 가입하지 않은 학생도 출력되고 학생이 한명도 없는 동아리도 출력

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

-- 1. 구매기록이 없는 회원도 모두 뽑기
select u.userid, u.username, b.prodname, u.addr, u.mobile1 || u.mobile2 as "연락처"
    from buytbl B
        right outer join usertbl U
            on u.userid = b.userid
    order by u.userid;

-- 2. 구매기록이 없는 회원 (buytbl에 없는 회원) 뽑기
select u.userid, u.username, b.prodname, u.addr, u.mobile1 || u.mobile2 as "연락처"
    from usertbl u
        left join buytbl B
            on u.userid = b.userid
    where b.prodname is null
    order by u.userid;

-- **. full outer join (=full join) left join + right join
-- 한쪽을 기준으로 조관과 일치하지 않는 것을 출력하는 것이 아니라, 양쪽 모두에 조건이 일치하지 않는 것을 모두 출력하는 개념이다


-- cross join

select * from buytbl cross join usertbl;

select stdname, addr from stdtbl
union all
select clubname, roomno from clubtbl;



