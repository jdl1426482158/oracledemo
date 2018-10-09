--创建函数
create or replace function fun_test(num number) return number
as
begin
       return num+1;
end;

select fun_test(123) from dual;

declare 
       hello number;
begin
       hello:=fun_test(32);
       dbms_output.put_line(hello);
end;
       

-- 创建带参数的函数
create or replace function fun_ename(v_empno number) return varchar2 deterministic
as
v_ename varchar2(20);
begin
select ename into v_ename from emp where emp.empno=v_empno;
return v_ename;
end;

select distinct fun_ename(7369) from emp;


create or replace function fun_returnAndOut(v_empno number,v_name out varchar2) return number
as 
v_sal number;
begin
      select emp.ename,emp.sal into v_name,v_sal from emp where emp.empno=v_empno;
      return v_sal;
end;

declare
v_empno number:=7369;
v_name emp.ename%type;
v_sal emp.sal%type;
begin
v_sal:=fun_returnAndOut(v_empno,v_name);
dbms_output.put_line(v_name||'    '||v_sal);
dbms_output.put_line('Hello World');
end;

-- 包声明可以声明变量，不能和包体同时运行
create or replace package pkutil
as
       v_pi constant number(8,7):=3.1415926;
       v_area number;
       function getArea(v_r number) return number;
       procedure printArea;
end pkutil;

-- 包体不能声明变量
create or replace package body pkutil
as
       function getArea(v_r number) return number
       as
       begin
                v_area:=v_r*v_r*v_pi;
                return v_area;
       end;
       procedure printArea
       as
       begin
                 dbms_output.put_line(v_area);
       end;
end pkutil;

-- 包方法调用，报名.方法名
declare
    v_sr number:=2;
    v_area number;
begin
    v_area:=pkutil.getArea(v_r => v_sr);
    dbms_output.put_line(v_area);
    dbms_output.put_line(pkutil.v_area);
    pkutil.printArea;
end;

