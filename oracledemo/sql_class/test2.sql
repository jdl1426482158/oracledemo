-- for
-- out 
-- in out
create or replace procedure 
as

begin


end;


call

exec


--  һ�����
declare
    n number(4,0):=&n;
    v_sum number(8,0):=0;
begin
    for i in 0..n loop
        v_sum:=v_sum+i;
    end loop;
    dbms_output.put_line('��ͽ��Ϊ'||v_sum);
end;

-- ������ȡ�����
create or replace procedure getRan(random out number)
as
begin
random:=DBMS_RANDOM.RANDOM;  
end;

declare
    random number;
begin
    getRan(random);
    dbms_output.put_line(random);
end;


-- ������ƽ��
create or replace procedure square(num in out number)
as
begin
num:=num*num;
end;

declare
num number:=5;
begin
square(num);
dbms_output.put_line(num);
end;























select abs(mod(DBMS_RANDOM.RANDOM,100)) from dual;

SELECT TRUNC(0+3*dbms_random.value) FROM dual;


