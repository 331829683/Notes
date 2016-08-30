drop table dates;

create table datess(hj Date)
insert into datess values (to_date('2018-02-02 19:23:45','yyyy-mm-dd hh24:mi:ss'));
select hj from datess;

select table_name from user_tables;
--���ҹ���������
select e.last_name,e.EMPLOYEE_ID,t.last_name,t.EMPLOYEE_ID from employees e,employees t where e.manager_id =t.employee_id and t.last_name='Hunold';
--��ְ�������
select e.*,t.*from employees e ,EMPLOYEES t where e.MANAGER_ID = t.EMPLOYEE_ID and 
   e.HIRE_DATE<t.hire_date;
--�����ߵ�ַ
select d.*,l.STREET_ADDRESS from departments d ,locations l,employees e 
where d.manager_id = e.employee_id and d.location_id = l.LOCATION_ID;

select d.*,e.* from DEPARTMENTS d left join EMPLOYEES e on d.DEPARTMENT_ID=e.DEPARTMENT_ID ;

select e.*,d.* from EMPLOYEES e left join DEPARTMENTS d on d.DEPARTMENT_ID=e.DEPARTMENT_ID;

select e.EMPLOYEE_ID,e.LAST_NAME,e.SALARY,e.SALARY*nvl(e.COMMISSION_PCT,0) ����,j.JOB_TITLE,d.DEPARTMENT_NAME from JOBS j ,EMPLOYEES e left join DEPARTMENTS d on  e.DEPARTMENT_ID=d.DEPARTMENT_ID  where e.JOB_ID=j.JOB_ID;

select d.* from departments d where department_id in (select department_id from employees group by department_id);

select e.* from employees e where e.SALARY>(select salary from EMPLOYEES where employee_id=103);

select e.* from EMPLOYEES e where e.SALARY>(select avg(salary)from EMPLOYEES);

select e.DEPARTMENT_ID,e.JOB_ID,max(e.salary) from EMPLOYEES e group by e.JOB_ID,e.DEPARTMENT_ID; 

select e.DEPARTMENT_ID,count(*),avg(e.salary) from EMPLOYEES e GROUP by e.DEPARTMENT_ID;

select e.job_id,min(e.salary) from employees e  group by e.job_id having min(e.salary)>5000;

select e.department_id,avg(e.salary) from employees e group by e.department_id having avg(e.salary)<10000 and department_id is not null;--
--��ѯƽ�����ʵ���6000�Ĳ��ż���Ա����Ϣ
--1 ʹ���������� Ч���Ը� ע�����Ŀ�ֵ
select * from  (select e.department_id from employees e group by e.department_id having avg(e.salary)<10000) s left join EMPLOYEES t  on s.department_id=t.department_id;
--2 ��ֵ����
select a.*,b.* from EMPLOYEES a,DEPARTMENTS b where a.department_id in (select department_id from employees group by department_id having avg(salary)<10000 ) and a.department_id =b.department_id;
--------
select last_name from EMPLOYEES e,DEPARTMENTS d where e.department_id = d.department_id and d.DEPARTMENT_NAME='Sales';

select * from EMPLOYEES where job_id = (select job_id from EMPLOYEES where employee_id=140);

select last_name,salary from employees where salary >(select max(salary) from employees where department_id=30);
--�������ŵ�ƽ����ְ���
select department_id,count(*) ����,avg(salary),avg((select to_char(sysdate,'yyyy') from dual)- to_char(hire_date,'yyyy')) from EMPLOYEES group by department_id ;

select hire_date from EMPLOYEES;

select to_char(sysdate,'yyyy')- to_char(hire_date,'yyyy') from dual,EMPLOYEES;
--������ĳ����ƽ���������
select * from employees where salary in (select avg(salary) from employees group by department_id) ;
--�����뱾����ƽ��������� �Ȳ��������
insert into employees values(210,'r','e','32',34,sysdate,'AD_ASST',2200,0.3,134,210);
select *from EMPLOYEES e where e.salary = (select avg(t.salary) from EMPLOYEES t group by department_id having t.department_id = e.department_id);

--��ѯ����5000�Ĳ��ź�Ա����Ϣ
--��ȷ��
select d.*,s.* from departments d ,employees s where 5000<all(select salary from employees e where d.department_id = e.department_id) and d.department_id = s.department_id;
--��ȷ��
select * from (select d.* from departments d  where 5000<all(select salary from employees e where d.department_id = e.department_id)) d , EMPLOYEES s where d.department_id = s.department_id;

--��ѯ����Ա�����ʴ���10000�Ĳ���  any ��all ��ʹ��<any С��ĳһ��ֵ��С�����ֵ��<all С����Сֵ

select distinct  d.* from DEPARTMENTS d ,employees e where 10000<all(select salary from employees e where d.department_id = e.department_id)  and d.department_id = e.department_id;

--4000 �� 8000 �Ĳ���Ա�� ȥ���ղ���
--֮ǰ���߼������� 
select * from departments f,employees em
where not exists  (
            select d.* from departments d
            where exists (
                        select * from employees e
                        where d.department_id = e.department_id  and (salary <4000 or salary >8000)--between 4000 and 8000
                        ) 
            and d.department_id = f.department_id
            ) and f.DEPARTMENT_ID=em.DEPARTMENT_ID;

select * from employees where department_id in (10);

commit;
--��ѯ�������Ĳ���
select * from (select department_id,count(*) ���� from employees group by department_id order by count(*) desc ) r where rownum <2;

select * from (select * from employees where department_id = 30  order by salary desc) e where rownum <4;

--��ѯ����Ϊ5-10��Ա��
select * from employees order by salary desc;

--�к��Ѿ�
select * from (select salary,rownum ee from employees e order by salary desc ) r where ee between 5 and 10;

--���ϣ�
select * from (
          select rownum ee ,es.* from (
          --�������������кţ���ѡȡ�������ǶԵģ� �������кţ���������ȡ��������δ�����˳����
              select * from employees order by salary desc
              ) es --employee_id,first_name,last_name,salary
) ew where ee between 5 and 10;

--������Ա������ͳһ�޸�Ϊ����ƽ�����ʼ���1000 ע��Ҫ���ع��㣬��Ȼ���ݾ�ȫ����
savepoint a;
select department_id,avg(salary)+1000 from employees group by department_id order by department_id desc;
select * from employees order by department_id desc;
update employees e set salary =((select avg(salary) from employees s group by department_id having e.department_id=s.department_id)+1000) where e.department_id is not null;


rollback to a;
commit;

---��ȡһ�����ڵĵ������һ�������  ����һ����ȡ�����ĺ������õ�����
select extract(day from last_day(hire_date)) from employees;
--��ǰ�µ����ڶ�����ְ����Ա
select  * from employees where extract (day from (last_day (hire_date)))-2 = extract (day from hire_date);
--��ѯ�������ʮ���Ա��
select * from employees where extract (year from sysdate) - extract(year from hire_date)>=10;

select employee_id,FIRST_NAME,initcap(last_name) from employees ;

select * from  employees where first_name like '_e%';
select  employee_id,replace(first_name,'s','S') from employees ;
commit;
--��ѯ���ʸ��ڱ����ŵ�Ա�����䲿��ƽ������
select * from (select department_id,avg(salary) ƽ������ from employees group by department_id) d,employees e where e.department_id=d.department_id and e.salary>d.ƽ������; 
commit;