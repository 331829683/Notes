---��������,�޸Ķ���� 
delimiter //
CREATE FUNCTION hello (s CHAR(20)) RETURNS CHAR(50)
 RETURN CONCAT('Hello, ',s,'!');
//
--��������Ļ������ǵڶ���SQL���
delimiter ;

select hello('Myth ');
drop function hello;
-------------------------------------------------------

-----------------------------------------------�洢���� ʹ��call�ؼ��ֵ���-----------------------------------------
delimiter //
create procedure getGrade(classid varchar(20),years varchar(20),terms int)
	begin 
		declare num int ;
		declare i int default 0;
		
		select cname from obligatory o ,course c where o.cno = c.cno and cid =  classid and year = years and term = terms;
		
		select count(*) into num from obligatory o ,course c where o.cno = c.cno and cid =  classid and year = years and term = terms;
		
		
		grades:loop
			if i<num then ;
			end if;
			leave grades;
		end loop grades;
	end;
	//