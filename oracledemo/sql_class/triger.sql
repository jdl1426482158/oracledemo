-- ����������, ������ֻ����dml���
-- ����������
create or replace trigger tri_emp
before
insert or update or delete
on emp
begin
   -- �жϴ�������
   case
        when inserting then
             raise_application_error(-20001,'�㲻�ܲ������ű�');
        when updating then
             raise_application_error(-20002,'�㲻���޸����ű�');
        when deleting then
             raise_application_error(-20003,'�㲻��ɾ�����ű�');
   end case; 
end;
-- ��ֹ������
alter trigger tri_emp disable;
-- ɾ��������
drop trigger tri_emp;
-- ��������
insert into emp(empno) values(123);

update emp set empno=7369 where emp.empno=7369;

delete from emp where empno=7369;

-- �м��º󴥷���
create or replace trigger tri_emp
after
insert or update
on emp
for each row
begin
   -- �жϴ�������
   if updating then
      raise_application_error(-20003,'�㲻Ӧ���޸����ű�'||:old.empno);
   end if;
end;
