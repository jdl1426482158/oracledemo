
select avg(sal),job from emp group by deptno;
select max(sal) from emp group by deptno;
select min(sal) from emp group by deptno;
select to_char(sysdate,'yyyy-MM-dd hh:mi:ss') from dual

declare
       v_r number(2):=&rr;
       v_pi constant number(3,2):=3.14;
       v_area number(6,2);
begin
       v_area:=v_r*v_r*v_pi;
       dbms_output.put_line(v_area);
end;

select ename,sal from emp where sal in (select min(sal) from emp group by job);

