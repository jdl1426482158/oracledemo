-- 游标
declare
v_row emp%rowtype;
-- 定义游标
cursor cur_emp is select * from emp;
begin
       -- begin 内容不能为空
       dbms_output.put_line('hello');
       -- 开启游标
       open cur_emp;
       loop
            -- 提取一行数据
            fetch cur_emp into v_row;
            -- 如果没提取到数据就退出
            exit when cur_emp%notfound;
            dbms_output.put_line(v_row.ename);
       end loop;
       -- 关闭游标
       close cur_emp;
end;

-- 提取整张表的数据
declare
type emp_table_type is table of emp%rowtype index by binary_integer;
emp_table emp_table_type;
cursor cur_emp is select * from emp;
begin
open cur_emp;
-- 获取数据
fetch cur_emp bulk collect into emp_table;
close cur_emp;
-- for遍历数据
for i in emp_table.first..emp_table.last loop
dbms_output.put_line(emp_table(i).ename||'      '||emp_table(i).job);
end loop;
end;

-- 带参数游标
declare
-- 需要被存储的表结构
type emp_table_type is table of emp%rowtype index by binary_integer;
emp_table emp_table_type;
emp_row emp%rowtype;
cursor cur_emp(eno number) is select * from emp where emp.empno=eno;
begin
   open cur_emp(7369);
   fetch cur_emp bulk collect into emp_table;
   close cur_emp;
   dbms_output.put_line(emp_table.count);
end;


-- 简化游标
declare
cursor cur_emp is select * from emp;
begin
   -- for遍历数据
   for v_row in cur_emp loop
       dbms_output.put_line(v_row.ename||'      '||v_row.job);
   end loop;
end;

-- 继续简化游标
begin
   -- for遍历数据
   for v_row in (select * from emp) loop
       dbms_output.put_line(v_row.ename||'      '||v_row.job);
   end loop;
end;


-- 游标变量
declare
type emp_table_type is table of emp%rowtype index by binary_integer;
emp_table emp_table_type;
emp_row emp%rowtype;
-- 定义游标变量类型
type cur_type is ref cursor;
-- 定义游标变量
cur_emp cur_type;
begin
   -- 给游标变量赋予游标定义
   open cur_emp for select * from emp where emp.empno=7369;
   -- 从游标获取数据
   fetch cur_emp bulk collect into emp_table;
   close cur_emp;
   -- 输出数据
   dbms_output.put_line(emp_table(emp_table.first).ename);
end;


