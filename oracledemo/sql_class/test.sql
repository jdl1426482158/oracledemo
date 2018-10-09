create table tuser (
id number(10,0) primary key,
username varchar2(10),
pwd varchar2(10)
)

insert into tuser values(seq_id.nextval,'潇潇','123456');
select * from tuser;

select * from emp;
select * from emp where job='MANAGER';
create table t(a,b,c,d,e,f,g,h) as select e.* from emp e where exists (select empno from emp m where m.mgr=e.empno);



select * from (select t.*,rownum r from t) tmp where r>=3 and r<=4 group by A  ;

-- 分组查询,被查询字段必须为select后面给出的，且不能是*号里面的
select e.sal from emp e group by sal ;


-- 合并字符串
select concat('abc','123') from dual;

-- 将单词首字母字母大写，后面小写
select initcap('tHis is a beautiful Flower') from dual;

-- 字符串查找,第一个是被查字符串，第二个是查询的字符串，第三个是开始位置，第四个是出现第几次
select instr('I am so Handsome',' ',3,2) from dual;

-- 字符左右填充
select lpad('(-_-)',10,'!') from dual;
select rpad('(-_-)',10,'!') from dual;
select lpad(rpad('(-_-)',10,'!'),15,'!') lpad from dual;

select '\n\n\n\n\n\n' as n from dual;

-- 取出字符，第一个被去除的字符串，第二个是需要被删除的字符的集合
select trim('  a  ') from dual;

select ltrim('ababab  z   abababa','aa') from dual;
select rtrim('ababab  z   abababa','ba') from dual;
select rtrim('ababab  z   abababa','zseba') from dual;

select substr('你是一个人吗',3,3);

-- 日期转换
SELECT TO_DATE(
    'January 15, 1989, 11:00 A.M.',
    'Month dd, YYYY, HH:MI A.M.',
     'NLS_DATE_LANGUAGE = American')
     FROM DUAL;
     
SELECT TO_CHAR(INTERVAL '123-2' YEAR(3) TO MONTH) FROM DUAL;

SELECT SYSDATE From DUAL;


SELECT TO_CHAR(SYSDATE , 'YYYY-MM-DD HH24:MM:SS' )  From DUAL;
