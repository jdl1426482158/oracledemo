
-- 创建无参过程
create or replace procedure selectTest
as
  v_ename emp.ename%type;
begin
  select ename into v_ename from emp where emp.empno=7369;
  dbms_output.put_line(v_ename);
end;

-- 运行方式一
call selectTest();

-- 只能在命令窗口中执行
set serveroutput on
exec selectTest;
set serveroutput off

-- 运行方式三
begin
     selectTest();
end;


-- 创建待输入值的过程
create or replace procedure selectTestA(v_empon in emp.empno%type)
as
  v_ename emp.ename%type;
begin
  select ename into v_ename from emp where emp.empno=v_empon;
  dbms_output.put_line(v_ename);
end;

call selectTestA(7369);

set serveroutput on
exec selectTestA(7369);
set serveroutput off

declare
     v_empon emp.empno%type:=&empon;
begin
     selectTestA(v_empon);
end;

-- 带输出的
create or replace procedure selectTestB(v_empon in emp.empno%type, v_ename out emp.ename%type)
as
begin
  select ename into v_ename from emp where emp.empno=v_empon;
end;



call selectTestB(7369);



set serveroutput on
exec selectTestB(7369);
set serveroutput off

declare
     v_empon emp.empno%type:=&empon;
     v_ename emp.ename%type;
begin
     selectTestB(v_empon,v_ename);
     dbms_output.put_line(v_ename);
end;




-- 输入输出变量
create or replace procedure square(val in out number)
as
begin
  val:=val*val;
end;

declare
 val number:=23;
begin
 val:=&val;
 square(val);
 dbms_output.put_line(val);
end;

-- 在命令行中使用
set serveroutput on
SQL> DECLARE
2 testvalue VARCHAR2(20);
3 BEGIN
4 testvalue := 'First Test!';
5 dbms_output.put_line( testvalue );
6 END;
7 / 结束匿名块
set serveroutput off





