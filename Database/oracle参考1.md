��б��/������  ;  ��   ִ��  ���ǣ��о���Ӧ����
show parameter instance_name   �鿴��ǰ���ݿ��SID
�������û���
create tablespace myth_data datafile 'D:\myth\a.dbf' size 50m autoextend on next 50m maxsize 2048m[extent management local;]
create user myth idenitfied by ad default tablespace myth_data;
grant connect,resource,dba to myth;

��sqlplus��
	sys as sysdba
	����
	�� 
	��ʹ�� myth ad ������
	���Թ���Ա������� ��conn  as sysdba

alert session set NLS_DATE_FORMAT='yyyy-mm-dd';���λỰ��Χ�ڣ�ȫ�ַ�Χ��global���������ڸ�ʽ

set linesize 120;���������н���ÿ����ʾ120���ַ�
set pagesize 20;����ÿ20����Ϊһ����ʾ��
col ename for a8;�����ֶ���ʾ8���ַ�
col payment for 9999;�����ֶ���ʾ4λ����
��������к���null,����ʹ��not in��������ʹ��in��
select sal*12+nvl(bonus,0);��ֵ���⣺��ѯ�����루��н*12+����

====================================================================================================
��������,����sal
select sal ��deptno from emp order by sal,deptno desc��

order by�ñ��ʽ
select *.... order by sal*12;

����������
select sal*12 ��н from emp order by ��н; 

������˳��ֵ����
select��distinct�� ename, sal*12 from emp order by 2;

�Կ��ܿ�ֵ�������򣬲�Ϊnull����ǰ��
select sal from emp order by sal nulls last��

select * from v$nls_parameters;��ѯ���ݿ�Ĭ������
oracleĬ�����ڸ�ʽ��dd-mm��-yyyy
select * from emp where ename like 'S%';��ѯ��������S��ͷ��Ա��
select * from emp where ename like ��__��;��ѯ��������2���ֵ�Ա��

select * from emp where ename like '%\_%' escape '\'; ��ѯ�����а���_��Ա������\��_ת��
select �ֶ��� ������ * ����������ܡ�

a  desc; a���������ϴ�����append׷��desc���a����Ҫ����2���ո�ȷ��append���γɵ������������һ���ո����γɺϷ���ʽ
order by pay asc/desc
where condition1 and condition2 ..; oracle�߼��ж��Ǵ��������˳��
rollback�������ϲ�����
spool c:\aa.txt
oracle���ݸ�ֵʹ��:=

========================PL/SQL============================
set serveroutput on   ���ú�ſ��Կ������
dbms_output.put_line();  ������
ִ��Ҫ��   /   ִ��


oracle �����case�ṹ���⣺
	case ����ǻ��Զ������ģ�����ִ�к����case���
	����C������Ҫ��break��������

====================�����˻��Լ���������===========
alter user hr account unlock;
 alter user hr identified by hr;

 �����û�����Ȩ:
   create user myth identified by ad
    grant connect,resource,dba,sysdba to myth

=====��¼==========================
spool  ·��
spool off
=====��ѯ��ǰ״̬��Ҫʹ��ϵͳ�û�����========
select status from v$instance;
==�����ʽ����========================
col �� for a10
col �� format 999

==�鿴���������ļ�===================
select name from v$datafile

==�鿴��Ա===========
select group#,members from v$log
==�鿴�����ļ�========
select group#,member from v$controlfile
==���������ݿ����Ա======
conn /as sysdba
==�ر����ݿ�==========
shut immediate

==������ nomount    ���Իָ������ļ�=========
startup nomount
select instance_name,status from v$instance;
==������mount �����ļ�����      ��������־�ļ����лָ�
alter database mount
==�����ļ�����open  ���Բ�ѯ���ݿ�ı�
alter database open


����ֱ��ѡ��ȫ�����ԣ���Ӱ��db��ʹ�á�
Oracleִ���Ⱦ��������������c$����ͨ��Ϊ�˰�ȫĬ�϶��ر�����������Ե��¼�鲻ͨ����
�򿪷����ܼ򵥣�ȷ�����������Server�����������У�Ȼ����CMD�������̨������
net share c$=c:
����

alter table exer_student add constraint P_F foreign key (cno) references exer_class(cno)


SQL> create table exer_class(cno number(2), constraint tu primary key(cno));

���Ѵ�����

SQL> alter table exer_student add constraint hh foreign key(cno) references exer_class(cno);
alter table exer_student add constraint hh foreign key(cno) references exer_class(cno)
                                        *
�� 1 �г��ִ���:
ORA-02298: �޷���֤ (MYTH.HH) - δ�ҵ�����ؼ���  
====���ս�����������´���һ����ռ䣬���ڸñ�ռ䴴���û����ٴ������û����===
==��Ȼ�Ѿ���������ǲ�֪��Ϊʲô������


SQL> desc eser_class;
ERROR:
ORA-04043: ���� eser_class ������


SQL> desc exer_class;
 ����                                      �Ƿ�Ϊ��? ����
 ----------------------------------------- -------- ----------------------------
 CNO                                       NOT NULL NUMBER(2)

SQL> shut immediate;
ORA-01031: Ȩ�޲���
SQL> conn as sysdba
�������û���:  3
�������:
�����ӡ�
SQL> shut immediate;
���ݿ��Ѿ��رա�
�Ѿ�ж�����ݿ⡣
ORACLE �����Ѿ��رա�

+++++++++++++++++++++++�й�ʹ�õ�ϸ��++++++++

===================�����
insert all 
   when dept=10 then into emp10
   when dept=20 then into emp20
   when dept=30 then into emp30
   when dept=40 then into emp_other
   when salary<2000 then into lowsal
   when salary>4000 then into highsal
   else into middlesal
   select * from employees;
    ֻ����һ��else ����else�����Ӧ�ý���select���
--����������else�ǲ�������������when������������� ����10 20 30 40 ���ź�
--����2000��4000�м�Ĺ���  ��ʵ�ϲ²�����ȷ��

===========����ʱ��======
��ΪDate ��timestamp����
ǰ����������ʱ����
���߿��Ծ�ȷ��С����λ���Լ�ָ�� ���磺timestamp(4)

to_date('2010-02-02 13:45:32','yyyy-mm-dd hh24:mi:ss')
to_date('2010-02-05','yyyy-mm-dd')

==================�󶨱���=============
         �о��൱��Java��preparements ���Ǹ�Set �� ������һ�����ñ���������SQL�����ִ��
    ��ʹ�ã�
variable i number;  ����һ������
exec :i :=1;  ��������ֵ
select * from tudent where id=:i;  ʹ������󶨱���

=================�������===============
��������㣺savepoint A;
�ع���rollback to A; ���߻ع����в��� rollback;

ע�� �� һ��commit���Ựע����������ǻ�ʧЧ�ģ����Բ��������˲���

=======================================��֪ʶ�������==================================================
�޸�����Oracle��alter table bbb rename column nnnnn to hh int;
�޸�����SQLServer��exec sp_rename't_student.name','nn','column';


��Լ����SELECT constraint_name, table_name, r_owner, r_constraint_name FROM all_constraints WHERE table_name = 'table_name' and owner = 'owner_name'; 


--ע��
dml�����ſ��Իع���ddl�Զ���ʿ�ύ��������������������rownum��������ҳ��ѯ��between ...and ..��������.varchar2����ָ�����ȣ�û��Ĭ�ϳ��ȡ�where�����÷��麯����avg�ȡ��������ʱ��truncate��deleteЧ�ʸߺܶࡣ

Select�б��еı��ʽ����Ҫ�������������û�б������������
�ǿ�Լ��ֻ��Ϊ�м�Լ��������Լ������Ϊ��Լ����
�����constraint con3 foreign key(id) references teacher(id)
sqlplus��½���ݿ⣺�û�����sys ���open �����ַ�����oracle1 as sysdba
�����е�½���ݿ�:sqlplus sys/open as sysdba
����Ϊdual�ı�dual��Ϊ�գ�������ѧ���������
sql>conn system/manager; 
sql>conn scott/tiger; 
exit �˳�
to_char(sal,'999,999.00')	��ʽ������
select to_char(hiredate,'mm"��"/yyyy"��"') from emp;
linesize  show linesize(Ĭ��80)       set  linesize  120
pagesize  show pagesize(Ĭ��14)       set  pagesize  5

�����û�
������ ��3�ֱ�׼��ɫ 
����QracleΪ�˼�����ǰ�İ汾���ṩ�����ֱ�׼�Ľ�ɫ(role)��CONNECT��RESOURCE��DBA�� 
����1. CONNECT Role(���ӽ�ɫ) 
������ʱ�û����ر�����Щ����Ҫ������û���ͨ��ֻ��������CONNECTrole��CONNECT��ʹ��Oracle�ļ�Ȩ�ޣ�����Ȩ��ֻ���ڶ������û��ı��з���Ȩʱ������select��insert��update��delete�ȣ��Ż��������塣ӵ�� CONNECT role���û����ܹ���������ͼ������(sequence)����(cluster)��ͬ���(synonym )���Ự(session)�����������ݿ����(link)�� 
����2. RESOURCE Role(��Դ��ɫ) 
�������ɿ�����ʽ�����ݿ��û���������RESOURCE role��RESOURCE�ṩ���û������Ȩ���Դ��������Լ��ı����С�����(procedure)��������(trigger)������(index)�ʹ�(cluster)�� 
����3. DBA Role(���ݿ����Ա��ɫ) 
����DBA roleӵ�����е�ϵͳȨ��----���������ƵĿռ��޶�͸������û��������Ȩ�޵�������SYSTEM��DBA�û�ӵ�С��������һЩDBA����ʹ�õĵ���Ȩ�ޡ� 
����һ������DBA��ɫ���û����Գ����κα���û��������DBA��CONNECT��RESOURCE ��DBA������Ȩ�ޡ���Ȼ�������Ǻ�Σ�յģ���ˣ�����������Ҫ��DBAȨ�޲�Ӧ���������Щ���Ǻ���Ҫ��һ���û��� 
��������һ���û�������Ȩ�ޣ�������ζ�Ŵ�Oracle��ɾ��������û��� Ҳ�����ƻ��û��������κα�;ֻ�Ǽ򵥽�ֹ�����Щ��ķ��ʡ�����Ҫ������Щ����û���������ǰ�����ط�����Щ�� 

Oracle��ɫ 
��ɫ�������Ȩ�޵�����ϣ�ʹ�ý�ɫ����ҪĿ�ľ���Ϊ�˼�Ȩ�޵Ĺ����ٶ����û�a��b��cΪ�������Ƕ�ӵ��Ȩ�� 

2����scott.emp����select��insert��update 
�������ֱ����Ȩ����������Ҫ����12����Ȩ�� 
������ý�ɫ�Ϳ��Լ� 
���Ƚ�create session��select on scott.emp��insert on scott.emp��update on scott.emp�����ɫ��Ȼ�󽫸ý�ɫ����a��b��c�û��������Ϳ���������Ȩ�㶨����ɫ��ΪԤ�����ɫ���Զ����ɫ���ࡣ 

����Ԥ�����ɫ 
Ԥ�����ɫ��ָOracle���ṩ�Ľ�ɫ��ÿ�ֽ�ɫ������ִ��һЩ�ض��Ĺ��������������ǽ��ܳ��õ�Ԥ�����ɫconnect��resource��dba�� 
1��connect��ɫ 
����һ��Ӧ�ÿ�����Ա��Ҫ�Ĵ󲿷�Ȩ�ޣ���������һ���û��󣬶�������£�ֻҪ���û�����connect��resource��ɫ�͹��ˣ���ôconnect��ɫ��������ϵͳȨ�ޣ� 
alter session 
create cluster 
create database link 
create session 
create view 
create sequence  

2��resource��ɫ 
����Ӧ�ÿ�����Ա����Ҫ������Ȩ�ޣ����罨���洢���̡��������ȡ�������Ҫע�����resource��ɫ������unlimited tablespaceϵͳȨ�ޡ� 
��������ϵͳȨ�ޣ�
create indextype 
create table 
create type 
create procedure 
create trigger  

3��dba��ɫ 
dba��ɫ�������е�ϵͳȨ�ޣ���with admin optionѡ�Ĭ�ϵ�dba�û�Ϊsys��system���ǿ��Խ��κ�ϵͳȨ�����������û�������Ҫע�����dba��ɫ���߱�sysdba��sysoper����Ȩ�������͹ر����ݿ⣩�� 

�����Զ����ɫ 
����˼������Լ�����Ľ�ɫ�������Լ�����Ҫ�����壬һ����DBA������������õı���û�������������Ҫ����create role��ϵͳȨ�ޣ��ڽ�����ɫʱ����ָ����֤��ʽ������֤�����ݿ���֤�ȣ��� 
1��������ɫ������֤�� �����ɫ�ǹ��õĽ�ɫ�����Բ��ò���֤�ķ�ʽ������ɫ create role ��ɫ�� not identified; 
2��������ɫ�����ݿ���֤��create role ��ɫ�� identified by tiger; 
����ɫ����Ȩ�޺͸��û���Ȩû��̫������𣬵���Ҫע�⣬ϵͳȨ�޵�unlimited tablespace�Զ���Ȩ��with grant optionѡ���ǲ��������ɫ�ġ� 

sql> grant select on scott.emp to ��ɫ��; 
sql>grant insert,update,delete on scott.emp to ��ɫ��; 
ͨ������Ĳ��裬�͸���ɫ��Ȩ�ˡ�
 

4�������ɫ��ĳ���û� 
һ������ɫ����dba����ɵģ����Ҫ�������û���ݷ����ɫ����Ҫ���û��������grant any role��ϵͳȨ�ޡ� 
grant ��ɫ�� to blake with admin option; 
��Ϊ�Ҹ���with admin optionѡ����ԣ�blake���԰�system��������Ľ�ɫ���������û��� 


show��set��������������ά��SQL*Plusϵͳ����������
SQL> set heading off --��ֹ����б��⣬Ĭ��ֵΪON 
SQL> set feedback off --��ֹ��ʾ���һ�еļ���������Ϣ��Ĭ��ֵΪ"��6�������ļ�¼������ON" 
SQL> set timing on --Ĭ��ΪOFF�����ò�ѯ��ʱ������������SQL����ִ��ʱ�䣬�������� 
SQL> set sqlprompt "SQL> " --����Ĭ����ʾ����Ĭ��ֵ����"SQL> " 
SQL> set linesize 1000 --������Ļ��ʾ�п�Ĭ��100 
SQL> set autocommit ON --�����Ƿ��Զ��ύ��Ĭ��ΪOFF 
SQL> set pause on --Ĭ��ΪOFF��������ͣ����ʹ��Ļ��ʾֹͣ���ȴ�����ENTER��������ʾ��һҳ 
SQL> set arraysize 1 --Ĭ��Ϊ15 
SQL> set long 1000 --Ĭ��Ϊ80 
˵���� 
longֵĬ��Ϊ80������1000��Ϊ����ʾ��������ݣ���Ϊ�ܶ������ֵ���ͼ���õ���long�������ͣ��磺 
SQL> desc user_views 
���� �ɿ�ֵ�� ���� 
------------------------------- -------- ---- 
VIEW_NAME NOT NULL VARCHAR2(30) 
TEXT_LENGTH NUMBER 
TEXT LONG 
SQL> define a = '''20000101 12:01:01''' --����ֲ��������������һ�������ڸ�����ʾ���������Ļس������ĳ����� 
--������define���������� 
select &a from dual; 
ԭֵ 1: select &a from dual 
��ֵ 1: select '20000101 12:01:01' from dual 
'2000010112:01:01 
----------------- 
20000101 12:01:01 
��������� 
1���û���Ҫ�����ݿ��û��µ�ÿһ�ű�ִ��һ����ͬ��SQL��������ʱ��һ�顢һ��ļ���SQL����Ǻ��鷳�� 
ʵ�ַ����� 
SQL> set heading off --��ֹ����б��� 
SQL> set feedback off --��ֹ��ʾ���һ�еļ���������Ϣ 

�����з��������ı��selectȨ������Ϊpublic 
select 'grant select on '||table_name||' to public;' from user_tables where ��������; 
ɾ���û��¸��ֶ��� 
select 'drop '||tabtype||' '||tname from tab; 
ɾ�����������û� 
select 'drop user '||username||' cascade;' from all_users where user_id>25; 
���ٱ���������ͼ 
----���ڰ����ݿ⵹�뵽�µķ������Ϻ�(���ݿ��ؽ�)����Ҫ����ͼ���±���һ�飬 
----��Ϊ�ñ�ռ���ͼ��������ռ�ı�����ӻ�������⣬��������PL/SQL���������ԣ����ٱ��롣 
SQL> SPOOL ON.SQL 
SQL> SELECT'ALTER VIEW '||TNAME||' COMPILE;' FROM TAB; 
SQL> SPOOL OFF 
Ȼ��ִ��ON.SQL���ɡ� 
SQL> @ON.SQL 
��Ȼ����Ȩ�ʹ���ͬ���Ҳ���Կ��ٽ��У��磺 
SQL> SELECT 'GRANT SELECT ON '||TNAME||' TO �û���;' FROM TAB; 
SQL> SELECT 'CREATE SYNONYM '||TNAME||' FOR �û���.'||TNAME||';' FROM TAB; 
�����б� 
���赱ǰִ������Ϊ��select * from tab; 
(a)ppend�������� ����ı�����������ǰ��β��������a order by tname�������select * from tab order by tname; 
������������������������������������������������������������������������������ע��a�����2���ո� 
(c)hange/old/new �ڵ�ǰ�����µ��ı��滻�ɵ��ı���c/*/tname���������������select tname from tab; 
(c)hange/text�����ӵ�ǰ��ɾ���ı�����������������c/tab�������������������select tname from ; 
del��������������ɾ����ǰ�� 
del n������������ɾ����n�� 
(i)nput �ı����� �ڵ�ǰ��֮�����һ�� 
(l)ist���������� ��ʾ�������������� 
(l)ist n�������� ��ʾ�������е� n �� 
(l)ist m n������ ��ʾ�������� m �� n �� 
run��������������ִ�е�ǰ������������ 
/����������������ִ�е�ǰ������������ 
r����������������ִ�е�ǰ������������ 
@�ļ����������������е����ڴ��sql�ļ����磺 
SQL> edit s<�س�> 
�����ǰĿ¼�²�����s.sql�ļ�����ϵͳ�Զ�����s.sql�ļ��� 
����������"select * from tab;"�������˳��� 
SQL> @s<�س�> 
ϵͳ���Զ���ѯ��ǰ�û��µ����б���ͼ��ͬ��ʡ� 
@@�ļ����������� ��.sql�ļ��е�����һ��.sql�ļ�ʱʹ�� 
save �ļ��������������������������ļ���ʽ���̣�ȱʡ�ļ���չ��Ϊ.sql 
get �ļ��������� ������̵�sql�ļ� 
start ��@ ִ��sql�ű�    �÷���start��@   F:\123.sql  ���е����ڴ��sql�ļ� 
spool   F:\123.sql  ������������  spool off
���������ļ���spool �ļ������� ����֮��ĸ��ֲ�����ִ�н��"���ѻ�"�����̵������ļ��ϣ�Ĭ���ļ���չ��Ϊ.lst 
spool��������������ʾ��ǰ��"���ѻ�"״̬ 
spool off��������ֹͣ��� 
���� 
SQL> spool a 
SQL> spool 
�����ѻ��� A.LST 
SQL> spool off 
SQL> spool 
��ǰ�޼��ѻ� 

desc ��������������ʾ��Ľṹ 
show user����������ʾ��ǰ�����û� 
show error������ ��ʾ���� 
show all�������� ��ʾ����68��ϵͳ����ֵ 
edit������������ ��Ĭ�ϱ༭����Windowsϵͳ��Ĭ����notepad.exe���ѻ����������һ��SQL������afiedt.buf�ļ��н��б༭ 
edit �ļ����������ѵ�ǰĿ¼��ָ����.sql�ļ�����༭�����б༭ 
clear screen���� ��յ�ǰ��Ļ��ʾ 
����Oracle sqlplus���༭���� 

ln ��������ָ����������ĵ�n�������в���������������������к����룺 
l1��ǰѡ�е�����м�Ϊ SELECT emp_id, emp_name �����ǰ��"*"��ʾ�� a ��������ֱ���ڵ�ǰ�е�ĩβ�����ַ�������������������к����룺 a , emp_dept ��ִ�е�ָ���Ϊ�� 
SELECT emp_id, emp_name, emp_dept FROM Employees WHERE emp_age > 30 
c ���������޸ĵ�ǰ����е��ַ�������������������к����룺 
c /emp_name/emp_age/��ִ�е�ָ���Ϊ�� 
SELECT emp_id, emp_age, emp_dept FROM Employees WHERE emp_age > 30 
del n ��������ɾ����n��ָ�����������������к����룺 
DEL 3 
��ִ�е�ָ���Ϊ��SELECT emp_id, emp_age, emp_dept FROM Employees 
ϵͳȨ�޵Ĵ��ݣ�
1��	ϵͳȨ�ޣ��û������ݿ�����Ȩ�ޣ�
2��	����Ȩ�ޣ��û��������û������ݶ��������Ȩ�ޣ�

��ɫ��ӵ��һϵ�е�Ȩ�޵���ϣ�������dba��connect��resource��
1��	Ԥ�����ɫ��ϵͳ����ģ�
2��	�Զ����ɫ���û��Լ�����ģ�

ʹ��profile �����û����
1)�������
create profile lock_account limit 
failed_login_attempts 3 password_lock_time 2; 
alter user xiaoming profile lock_account;
alter user xiaoming account unlock;
2)��ֹ���
create profile myprofile limit
password_lift_time 10 password_grace_time 2;
alter user xiaoming profile myprofile;
3)������ʷ��
create profile password_history limit 
password_life_time 10 password_grace_time 2
password_reuse_time 10; 
4)ɾ��profile�ļ���
drop profile password_history [cascade]

��������������������
a��	��ĸ��ͷb��	������30���ַ�d��	A-Z��a-z��0-9��$��#
oracle�������ͣ�
char(?)�ͣ� ����  ���2000�ַ� ���磺char(10)��xiao�� ǰ�ĸ��ַ��š�xiao������6���ո�ȫ��
varchar2(?):  �䳤 ���4000�ַ� ���磺varchar2(4) ֻ�����ĸ��ַ���
number�� ��Χ-1038��1038 ���Ա�ʾ������Ҳ���Ա�ʾС����
number(5,2)����ʾһ������5λ��Ч������λС������Χ-999.99��999.99��
number(5):   ��ʾһ��5λ��������Χ-99999��99999��
date: ���������պ�ʱ���룻
blob�����������ݿ��Դ��ͼƬ/����/��Ƶ,4G��
clob�� �ַ��ʹ���� ���4G��

����Լ����alter table stu disable constraint con1;
���ã� enable 

����
	��ṹ��create table stu_backup as select * from student where 1=2; ���Ʊ�ṹ��where�Ӿ��ʾ����Ϊ�٣����Բ������ݣ�ֻ���Ʊ�ṹ
	��	create table stu(sno number(4),sname varchar2(20),sex char(2),birthday date,sch number(7,2));
���Ӳ�ѯ������CREATE TABLE dept10 AS SELECT employee_id, last_name, salary��1000 newSalary FROM employees  WHERE department_id = 10;
Լ����name char(2) constraint con1 not null���м�Լ����=constraint con2 unique��name������Լ����//Ϊ�ֶ�name����������ЧԼ��
	�������ݣ�insert into student(sno,sname,sex) values(209,'����','��');
Լ����alter table stu add(constraint c1)primary key(name);
ɾ��Լ����...drop primary key|unique(column)|constraint c1 [cascade]
	�ֶΣ�	alter table student add(classID number(2));
	���ݣ�	insert into student values(209,'����','��','18-1��-1990',234.56,2);
	��ͼ;	create or replace view v1 as select * from student with read only/with check option constraint vddf;��Լ����������ͼ����ͼ���ܸ��Լ���Լ��������
	���У�CREATE SEQUENCE [schema.]������[INCREMENT BY n][START WITH n][MAXVALUE n | NOMAXVALUE][MINVALUE n | NOMINVALUE][CYCLE | NOCYCLE][CACHE n | NOCACHE];   
	������	create index ind1 on student(name);
������ǰ�潲��������ϵͳ��ɫ----CONNECT��RESOURCE��DBA���û���������Oracle�����Լ���role���û�������role�����ɱ��ϵͳȨ�޻����ߵ���Ϲ���
�û���create user xiaoming identified by tiger;��Ȩ�޲��㣩�´������û�û���κ�Ȩ��
��Ȩ�û���grant connect�� create session,resource,create view,select on emp to user1 (with grant/admin option);���裺��½���������ͼ��Ȩ��create user xiaoming identified by tiger;��Ȩ�޲��㣩�´������û�û���κ�Ȩ��
	system ��grant connect to xiaoming with admin option
������revoke select on emp from xiaoming��
SYSTEM���д����� ���û��� Ȩ�� create role STUDENT; 
��Ȩ��ɫͬ�û���grant select on CLASS to STUDENT; 
����
ɾ
	�ֶΣ�	alter table student drop column sal;
	һ����¼:  delete from student where sanme=�����塯�� 
	���м�¼: delete from student; ��ṹ���ڣ�д��־�����Իָ����ٶ�����
	���м�¼:truncate table student����ṹ���ڣ���д��־���޷��һ�ɾ���ļ�¼���ٶȿ죻
	��ṹ������:  drop table student��
	���ݣ�( ����㣺savepoint myPoint;  rollback to myPoint;)
	��	drop table��
	Լ��	alter table stu drop constraint con1;alter table stu drop unique(name)��
	���У�	drop sequence seq;
	��ͼ��	drop view v;
	��ɫ��drop role
����Լ��: disable constraint c1 [cascade]
�û�drop user user01
ɾ���û����еĶ�����ɾ���û�drop user user01 CASCADE
��



�ģ�

���password �û��� ������  
alter user user01 identified by usr01;
���ʹ��password����û�������¿��������Ļ����ʾ����dba��Ȩ���û�����ͨ��password����ı��κ������û��Ŀ���;�����û�ֻ�ܸı��Լ��Ŀ��  
 
	������	rename student to stu;
	�ֶΣ�	alter table student modify(sname char(30));
	�ֶ���������alter table t rename column a to b;
	�ֶ����ԣ�alter session set nls_date_format=��yyyy-mm-dd��;
	�޸�һ���ֶΣ�update student set sex='Ů' where sname='����';
	�޸Ķ���ֶΣ�update student set sch=sch/2,classID=1;
	update city set buildDate=to_date('1900-1-1','yyyy-mm-dd') ;
	update view1 set sal=2 where id=2;���Զ���ͼ���и���
	���У� 	alter sequence seq maxvalue 12;
���ݿ��û�����:alter user scott account unlock;

��
show all --�鿴����68��ϵͳ����ֵ 
show error���� --��ʾ���� 
���У�1. �����Թ���Ա��ݵ�¼��2. sequence_owner����Ϊ��д����������û����Ƿ��д��ֻ�д�д����ʶ��
��ǰ�û�����������select SEQUENCE_OWNER,SEQUENCE_NAME from dba_sequences where sequence_owner='�û���';
��ǰ�û�����������select count(*) from dba_sequences where sequence_owner='�û���';
��ǰ�û�������ͬ��ʵĶ��壬����������ͬ��ʵ���ʵ������ select 'desc '||tname from tab where tabtype='SYNONYM'; 
��ǰ�û������б�ļ�¼�� select 'select '''||tname||''',count(*) from '||tname||';' from tab where tabtype='TABLE';

���н�ɫ select * from dba_roles; 
��ɫ���е�ϵͳȨ�� select privilege,admin_option from role_sys_privs where role='��ɫ��'; 
��ɫ���еĶ���Ȩ�� ͨ����ѯ�����ֵ���ͼdba_tab_privs���Բ鿴��ɫ���еĶ���Ȩ�޻����е�Ȩ�ޡ� 
�û����еĽ�ɫ��Ĭ�Ͻ�ɫ �����û���������ӵ����ݿ�ʱ��Oracle���Զ��ļ���Ĭ�ϵĽ�ɫ��ͨ����ѯ�����ֵ���ͼdba_role_privs������ʾĳ���û����е����н�ɫ����ǰĬ�ϵ���ɫ�� 
select granted_role,default_role from dba_role_privs where grantee='�û���'; 	
	select * from student where birthday is (not) null;
	select * from user_constraint where table_name='student';
���н�ɫ��select * from dba_roles;
����Ա��ɫ��select * from dba_role_privs;
��ǰ�û���ɫ��select * from user_role_privs;
��ǰ�û�show user
�����û���select * from dba_users;
select * from all_users;
select * from user_users;
�û���Ĭ�ϱ�ռ�Ĺ�ϵselect username,default_tablespace from dba_users;
�鿴��ǰ�û��ܷ��ʵı�select * from user_tables; 
�û���select * from user_all_tables;
�û���ͼselect * from user_views;
���к����ʹ�����̣�select * from user_source;
��ǰ�û����ӣ�select * from v$Session;
��ǰ�û�Ȩ�ޣ�select * from session_privs;
���ݿ���SELECT NAME FROM V$DATABASE;
���б�ռ�ʹ�����select a.file_id "FileNo",a.tablespace_name "Tablespace_name",a.bytes "Bytes",a.bytes - sum(nvl(b.bytes, 0)) "Used",
       sum(nvl(b.bytes, 0)) "Free",   sum(nvl(b.bytes, 0)) / a.bytes * 100 "%free" from dba_data_files a, dba_free_space b where a.file_id = b.file_id(+) group by a.tablespace_name, a.file_id, a.bytes order by a.tablespace_name;

�û����ɫϵͳȨ��(ֱ�Ӹ�ֵ���û����ɫ��ϵͳȨ��)��
select * from dba_sys_privs;
select * from user_sys_privs;
��ɫ(ֻ�ܲ鿴��½�û�ӵ�еĽ�ɫ)��������Ȩ��select * from role_sys_privs;
�û�����Ȩ�ޣ�select * from dba_tab_privs;
select * from all_tab_privs;
select * from user_tab_privs;

��Щ�û���sysdba��sysoperϵͳȨ��(��ѯʱ��Ҫ��ӦȨ��)
select * from V$PWFILE_USERS


select ename Ա����,ename||'����ְʱ����'||to_char(hiredate,'yyyy-mm-dd') ��ְʱ�� from emp;�����ˣ�Ϊ������� ��ʽ���������
select * from emp where hiredate>'1-5��-1987' and job<>'salesman';
select * from emp where ename=��&name��;
Select * From Emp Where Mgr is null;		��ѯĳ��ֵΪ��
Select Round(Months_Between(Sysdate,'1-1��-2000')) �� From Dual;�����
select round(sysdate-to_date('1-1��-2000')/7) from dual;		�����
select instr(ename,'a',3) from emp where instr(ename,'a',1)�ӵ�1���ַ�λ�ÿ�ʼ���ң�����λ��
select instr(ename,'a',3) from emp where instr(ename,'a',1,2)�ӵ�1���ַ�λ�ÿ�ʼ���ң����ҵڶ��γ��ֵ�a�ַ���	
��ѯ����:
where���治��д�������������ж���������havingȡ����
Select D.Dname,Avg(E.Sal) From Emp e,Dept d Where E.Deptno=D.Deptno Having Avg(E.Sal)>2000 group by d.dname;
ʹ�����麯������䣬û��ʹ�ú������ֶ���Ϊ�����ֶΣ�����������group by���ý��з���.
select e.ename from emp e,dept d where e.deptno=d.deptno(+);��������
select * from emp e full outer join dept d on e.deptno=d.deptno;ȫ������ ����˫��Ŀ�ֵ��
select nvl(max(s.score),0),count(*) from teacher t left join student s on t.id=s.id group by t.id;
Select * From Emp E,Dept D where E.Deptno (+)= D.Deptno; ��߿��ܿ�ֵ��ʾ
�鿴�û������б�select * from user_tables;
��ѯ��ṹdesc emp��
��ѯ�����У�select * from emp��
ȡ���ظ���: select distinct deptno,job from emp;
ʹ���б�����select ename "����", sal*12 "��н" from emp;
����nullֵ��select ename "����", sal*12+nvl(comm,0)*12 "��н" from emp; 
ʹ���б��������select ename,sal*12+nvl(comm,0)*12 "��н" from emp order by "��н";
���������Ǹ��ˣ�select ename, sal from emp where sal in(select max(sal) from emp);
����ƽ������Ա����Ϣ��select empno,ename,sal from emp where sal > (select avg(sal) from emp);

��������ƽ�����ʺ���߹���: select deptno, avg(sal),max(sal) from emp group by deptno;(group by ��ߵ��ֶ�һ��Ҫ������select�����)
ƽ�����ʴ���2000�Ĳ��źź�ƽ�����ʺ���߹��ʣ�select deptno,avg(sal),max(sal) from emp group by deptno having avg(sal) > 2000;
�ۼ������ܽ᣺select deptno,avg(sal),max(sal) from emp group by deptno having avg(sal) > 2000 order by deptno asc;
a)	�ۼ�����ֻ�ܳ�����ѡ���С�having��order by �Ӿ��У�
b)	���select�����ͬʱ����group by ��having��order by ��ô���ǵ�˳����group by ��having��order by��
c)	��ѡ������������С����ʽ�;ۼ���������ô��Щ�кͱ��ʽ������һ��������group by �Ӿ��У�����ͻ����

to_date()����Ҫע��������͡�
substr(colName,off,num).��ȡ��off��ʼ��num���ַ�.
length(colName)������ֵ��ռ�ռ�����
int instr(colName,'����')����ֵ�д���Ŀ���ַ����򷵻���ֵ��
�ҵĲ�����¼��
update student set date_enter_school=to_date('1987-01-01','yyyy-mm-dd') where id=1;
insert into student values(2,'����','��','����',to_date('1987-02-28','yyyy-mm-dd'));
select to_char(date_enter_school,'yyyy-mm-dd') from student where id=1;
update student set hobby=replace(hobby,'����','��Ҳ������');


������ĸ����� ���ԡ�

����1�����ݿ�δ�򿪣�
�⣺startup mount;
select * from v$log;
alter database clear unarchived logfile group1;
alter database clear unarchived logfile group2;
alter database clear unarchived logfile group3;


======update ���� set ��=��
