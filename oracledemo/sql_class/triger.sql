-- 触发器案例, 触发器只能有dml语句
-- 创建触发器
create or replace trigger tri_emp
before
insert or update or delete
on emp
begin
   -- 判断触发类型
   case
        when inserting then
             raise_application_error(-20001,'你不能插入这张表');
        when updating then
             raise_application_error(-20002,'你不能修改这张表');
        when deleting then
             raise_application_error(-20003,'你不能删除这张表');
   end case; 
end;
-- 禁止触发器
alter trigger tri_emp disable;
-- 删除触发器
drop trigger tri_emp;
-- 测试例子
insert into emp(empno) values(123);

update emp set empno=7369 where emp.empno=7369;

delete from emp where empno=7369;

-- 行级事后触发器
create or replace trigger tri_emp
after
insert or update
on emp
for each row
begin
   -- 判断触发类型
   if updating then
      raise_application_error(-20003,'你不应该修改这张表'||:old.empno);
   end if;
end;
