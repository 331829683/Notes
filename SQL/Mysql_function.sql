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