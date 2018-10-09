
-- ������
declare   -- ������������
    v_ename varchar2(20);
begin
    -- &�����������
    select ename into v_ename from emp where empno=&no;
    -- �����Ϣ
    dbms_output.put_line('Ա������Ϊ'||v_ename);
exception
    -- ���û�������쳣
    when no_data_found then
    dbms_output.put_line('Ա��������');
end;


declare
    -- ���峣��
    v_pi constant number(3,2):=3.14;
    v_r number(2):=23;
    v_area number(7,2);
begin
    -- ����԰�����
    v_area:=v_pi*v_r*v_r;
    dbms_output.put_line(v_area);
end;

-- ��̬��������
declare
    v_ename emp.ename%type;
    v_emp emp%rowtype;
begin
    select ename into v_ename from emp where empno=7369;
    select * into v_emp from emp where empno=7369;
    dbms_output.put_line('Ա��7369������Ϊ'||v_ename);
    dbms_output.put_line('Ա��7369�Ĺ���Ϊ'||v_emp.job);
end;

-- ����ṹ��
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

-- ��ṹ��
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

-- loop ѭ��
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

-- for ѭ��
declare 
    v int(3):=&scope;
begin
    for i in 0..v loop
        dbms_output.put_line('i'+i);
        dbms_output.put_line('v'+v);
    end loop; 
end; 



-- �쳣����

declare
  data_not_found exception;
  d emp%rowtype;
begin
  -- select ������뺬into
  select * into d from emp where emp.empno = 1;
  if sql%notfound then
         raise data_not_found;
         --dbms_output.put_line('end');
  else
         -- ��������У�����Ϊһ������
         dbms_output.put_line(d.ename);
  end if;
exception
  when no_data_found then
       dbms_output.put_line('δ�ҵ�����');
  when others then
       dbms_output.put_line('�����쳣');   
end;

-- ��������Զ��쳣
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
         -- ��������У�����Ϊһ������
         dbms_output.put_line(d.ename);
  end if;
exception
  when no_data_found then
       dbms_output.put_line('δ�ҵ�����');
  when others then
       dbms_output.put_line('�����쳣');   
end;



 
