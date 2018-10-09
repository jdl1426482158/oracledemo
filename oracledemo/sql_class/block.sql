
-- 匿名块
declare   -- 声明变量部分
    v_ename varchar2(20);
begin
    -- &是跳出输入框
    select ename into v_ename from emp where empno=&no;
    -- 输出信息
    dbms_output.put_line('员工姓名为'||v_ename);
exception
    -- 如果没有数据异常
    when no_data_found then
    dbms_output.put_line('员工不存在');
end;


declare
    -- 定义常量
    v_pi constant number(3,2):=3.14;
    v_r number(2):=23;
    v_area number(7,2);
begin
    -- 计算园的面积
    v_area:=v_pi*v_r*v_r;
    dbms_output.put_line(v_area);
end;

-- 动态定义类型
declare
    v_ename emp.ename%type;
    v_emp emp%rowtype;
begin
    select ename into v_ename from emp where empno=7369;
    select * into v_emp from emp where empno=7369;
    dbms_output.put_line('员工7369的姓名为'||v_ename);
    dbms_output.put_line('员工7369的工种为'||v_emp.job);
end;

-- 定义结构体
declare
    type two is record (
    ename emp.ename%type,
    sal emp.sal%type
    );
    twoE two;
begin
    select ename,sal into twoE from emp where empno=7369;
    dbms_output.put_line(twoE.ename);
end;

-- 表结构体
declare
    type v_emp_table_type is table of emp%rowtype index by binary_integer;
    v_emp_table v_emp_table_type;
begin
    select * into v_emp_table(0) from emp where empno=7521;
    select * into v_emp_table(1) from emp where empno=7782;
    dbms_output.put_line(v_emp_table(1).ename);
end;

-- IF demo
declare
    score number(4,1):=&score;
begin
    if score>=90 then
       dbms_output.put_line('great');
    elsif score>=80 then
       dbms_output.put_line('good');
    elsif score>=60 then
       dbms_output.put_line('just-so-so');
    else
       dbms_output.put_line('need to effort');
    end if;
end;

-- switch 
declare 
    v int(3):=&scope;
begin
    case v
         when 10 then
              dbms_output.put_line('need to effort');
         when 20 then
              dbms_output.put_line('need to a');
         else
              dbms_output.put_line('need to b');
    end case;
end;

-- loop 循环
declare 
    v int(3):=&scope;
begin
    loop
      if v<0 then exit; end if;
      v:=v-1;
    end loop; 
end;    

declare 
    v int(3):=&scope;
begin
    while v>0 loop
     v := v-1;
    end loop; 
end;  

-- for 循环
declare 
    v int(3):=&scope;
begin
    for i in 0..v loop
        dbms_output.put_line('i'+i);
        dbms_output.put_line('v'+v);
    end loop; 
end; 



-- 异常处理

declare
  data_not_found exception;
  d emp%rowtype;
begin
  -- select 这里必须含into
  select * into d from emp where emp.empno = 1;
  if sql%notfound then
         raise data_not_found;
         --dbms_output.put_line('end');
  else
         -- 不能输出行，必须为一个数据
         dbms_output.put_line(d.ename);
  end if;
exception
  when no_data_found then
       dbms_output.put_line('未找到数据');
  when others then
       dbms_output.put_line('其他异常');   
end;

-- 这里测试自定异常
declare
  data_not_found exception;
  d emp%rowtype;
begin
  delete from emp where emp.empno = 1;
  dbms_output.put_line('continue');
  if sql%notfound then
         raise data_not_found;
         --dbms_output.put_line('end');
  else
         -- 不能输出行，必须为一个数据
         dbms_output.put_line(d.ename);
  end if;
exception
  when no_data_found then
       dbms_output.put_line('未找到数据');
  when others then
       dbms_output.put_line('其他异常');   
end;



 
