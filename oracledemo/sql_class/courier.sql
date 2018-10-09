-- �α�
declare
v_row emp%rowtype;
-- �����α�
cursor cur_emp is select * from emp;
begin
       -- begin ���ݲ���Ϊ��
       dbms_output.put_line('hello');
       -- �����α�
       open cur_emp;
       loop
            -- ��ȡһ������
            fetch cur_emp into v_row;
            -- ���û��ȡ�����ݾ��˳�
            exit when cur_emp%notfound;
            dbms_output.put_line(v_row.ename);
       end loop;
       -- �ر��α�
       close cur_emp;
end;

-- ��ȡ���ű������
declare
type emp_table_type is table of emp%rowtype index by binary_integer;
emp_table emp_table_type;
cursor cur_emp is select * from emp;
begin
open cur_emp;
-- ��ȡ����
fetch cur_emp bulk collect into emp_table;
close cur_emp;
-- for��������
for i in emp_table.first..emp_table.last loop
dbms_output.put_line(emp_table(i).ename||'      '||emp_table(i).job);
end loop;
end;

-- �������α�
declare
-- ��Ҫ���洢�ı�ṹ
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


-- ���α�
declare
cursor cur_emp is select * from emp;
begin
   -- for��������
   for v_row in cur_emp loop
       dbms_output.put_line(v_row.ename||'      '||v_row.job);
   end loop;
end;

-- �������α�
begin
   -- for��������
   for v_row in (select * from emp) loop
       dbms_output.put_line(v_row.ename||'      '||v_row.job);
   end loop;
end;


-- �α����
declare
type emp_table_type is table of emp%rowtype index by binary_integer;
emp_table emp_table_type;
emp_row emp%rowtype;
-- �����α��������
type cur_type is ref cursor;
-- �����α����
cur_emp cur_type;
begin
   -- ���α���������α궨��
   open cur_emp for select * from emp where emp.empno=7369;
   -- ���α��ȡ����
   fetch cur_emp bulk collect into emp_table;
   close cur_emp;
   -- �������
   dbms_output.put_line(emp_table(emp_table.first).ename);
end;


