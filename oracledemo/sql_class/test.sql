create table tuser (
id number(10,0) primary key,
username varchar2(10),
pwd varchar2(10)
)

insert into tuser values(seq_id.nextval,'����','123456');
select * from tuser;

select * from emp;
select * from emp where job='MANAGER';
create table t(a,b,c,d,e,f,g,h) as select e.* from emp e where exists (select empno from emp m where m.mgr=e.empno);



select * from (select t.*,rownum r from t) tmp where r>=3 and r<=4 group by A  ;

-- �����ѯ,����ѯ�ֶα���Ϊselect��������ģ��Ҳ�����*�������
select e.sal from emp e group by sal ;


-- �ϲ��ַ���
select concat('abc','123') from dual;

-- ����������ĸ��ĸ��д������Сд
select initcap('tHis is a beautiful Flower') from dual;

-- �ַ�������,��һ���Ǳ����ַ������ڶ����ǲ�ѯ���ַ������������ǿ�ʼλ�ã����ĸ��ǳ��ֵڼ���
select instr('I am so Handsome',' ',3,2) from dual;

-- �ַ��������
select lpad('(-_-)',10,'!') from dual;
select rpad('(-_-)',10,'!') from dual;
select lpad(rpad('(-_-)',10,'!'),15,'!') lpad from dual;

select '\n\n\n\n\n\n' as n from dual;

-- ȡ���ַ�����һ����ȥ�����ַ������ڶ�������Ҫ��ɾ�����ַ��ļ���
select trim('  a  ') from dual;

select ltrim('ababab  z   abababa','aa') from dual;
select rtrim('ababab  z   abababa','ba') from dual;
select rtrim('ababab  z   abababa','zseba') from dual;

select substr('����һ������',3,3);

-- ����ת��
SELECT TO_DATE(
    'January 15, 1989, 11:00 A.M.',
    'Month dd, YYYY, HH:MI A.M.',
     'NLS_DATE_LANGUAGE = American')
     FROM DUAL;
     
SELECT TO_CHAR(INTERVAL '123-2' YEAR(3) TO MONTH) FROM DUAL;

SELECT SYSDATE From DUAL;


SELECT TO_CHAR(SYSDATE , 'YYYY-MM-DD HH24:MM:SS' )  From DUAL;
