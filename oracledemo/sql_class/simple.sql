create table clazz (
       clazz_id number(4,0) primary key,
       clazz_name varchar2(10) not null
)

insert into clazz value(20,'11')
union
(21,'23');

select 1+1 from dual;

select clazz_id as sdf from clazz


insert into clazz values(10, 'aabb');

select * from clazz;

SELECT value$ FROM sys.props$ WHERE parameter = 'NLS_CHARACTERSET';
SELECT * FROM NLS_DATABASE_PARAMETERS ;
select userenv('language') from dual;

insert all into clazz values(1,'a')
into clazz values(2,'b')
into clazz values(3,'c')
select 1 from dual;

-- �����oracle��from����ʡ��,��from dual������
select 1+1 from dual 

-- ���������
SELECT DBMS_RANDOM.RANDOM FROM DUAL; 

-- α��,���ܵ�������ʹ�ã���Ҫ����Ӳ�ѯ��ʹ��
-- ���ǶԲ�ѯ������Ա༭
select c.*,rowid from clazz c;
select * from clazz for update;

-- ��ҳ��ѯ,��*Ϊ���������ͻ����Ҫ�������
select * from (select c.*,rownum r from clazz c) where r>2 and r<4;

alter table clazz add constraint tase unique (clazz_name)

