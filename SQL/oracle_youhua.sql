CREATE TABLE STUDENT (SNO NUMBER NOT NULL , SNAME VARCHAR2(20) NOT NULL , SSEX CHAR(10) NOT NULL , SAGE NUMBER , SDEPT VARCHAR2(20) , CONSTRAINT STUDENT_PK PRIMARY KEY ( SNO  ));
create table Course( Cno number primary key,Cname varchar2(20) not null,Cpno number,  Ccredit varchar(20));
CREATE TABLE SC ( SNO NUMBER NOT NULL , CNO NUMBER NOT NULL , GRADE NUMBER , CONSTRAINT SC_PK PRIMARY KEY (  SNO , CNO  ));

alter table SC add CONSTRAINT SC_sno foreign key (sno) references student(sno);
alter table SC add CONSTRAINT SC_cno foreign key (cno) references course(cno);

insert into student values(14,'rt','��',21,'CS');
insert into course values (46,'��ѧ����',45,2);
insert into sc values (12,45,68);
----����������

select * from test;

-- ��ѯ�����ļ�·��
select * from v$controlfile;

-- ������־�ļ���Ϣ
select group#,sequence#,members,bytes,status,archived from v$log;

-- ���������־��
select * from v$logfile;
alter database add logfile('F:\DB\Oracle\Data\Log\REDO04A.log','F:\DB\Oracle\Data\Log\REDO04B.log'
)size 10m;
alter database drop logfile group 3;
alter database add logfile group 3('F:\DB\Oracle\Data\Log\REDO03A.log','F:\DB\Oracle\Data\Log\REDO03B.log','F:\DB\Oracle\Data\Log\REDO03C.log'
)size 15m;
-- ǿ���л���־�� ����ǰ�飨group 1�����л����γ�inactive״̬ʱ��ɾ��
alter system switch logfile;
-- ɾ��1 �����1 �����޸�1
alter database drop logfile group 1;
alter database add logfile group 1('F:\DB\Oracle\Data\Log\REDO01A.log','F:\DB\Oracle\Data\Log\REDO01B.log','F:\DB\Oracle\Data\Log\REDO01C.log'
)size 15m;
-- ��ռ�Ĺ���
select tablespace_name,block_size,extent_management,segment_space_management from dba_tablespaces;
-- ������ռ�
 create tablespace myth
datafile 'F:\DB\Oracle\Data\DBF\myth01.DBF' size 30m,'F:\DB\Oracle\Data\DBF\myth02.DBF' size 30m 
extent management local 
uniform size 1m;

