-- ������� ������� employees
create table employees
	(
		id serial primary key,
		employee_name varchar(50) not null
	);

-- ������� �������
--drop table employees;

-- ����� ������� employees
select * from employees;

-- ����� ��������� ������� � ������� employee_name
select count(employee_name) from employees;


-- ��������� ������� employee 70 ��������
insert into employees(employee_name)
	values ('Vadim'),
		   ('Pam'),
		   ('Elizabeth'),
		   ('Marlin'),
		   ('Thomas'),
		   ('Michael'),
		   ('Elliott'),
		   ('James'),
		   ('Steven'),
		   ('Anna_5'),
		   ('Anna_6'),
		   ('Anna_7'),
		   ('Anna_8'),
		   ('Anna_9'),
		   ('8_Jermaine'),
		   ('8_Terence'),
		   ('8_Mabel'),
		   ('8_Jarred'),
		   ('8_Mary'),
		   ('8_Yoshie'),
		   ('8_Alice'),
		   ('8_David'),
		   ('8_Robert'),
		   ('8_Stanley'),
		   ('8_James'),
		   ('8_Patty'),
		   ('8_Jackson'),
		   ('Leticia_Long'),
		   ('Bettye_Bevington'),
		   ('Christopher_Kumro'),
		   ('Olive_Warne'),
		   ('Kenneth_Coleman'),
		   ('William_Owen'),
		   ('Richard_Laflam'),
		   ('Bettye_Bevington'),
		   ('Frida_Krieger'),
		   ('Rocky_Siddon'),
		   ('Veronica_Jones'),
		   ('Michael_Carrano'),
		   ('Joanne_Hubler'),
		   ('Thomas_Patel'),
		   ('Angelina_Venezia'),
		   ('Albert_Madrigal'),
		   ('Ernest_Wood'),
		   ('Mary_Tornow'),
		   ('Marion_Daniel'),
		   ('Carey_Biro'),
		   ('Brenda_Walstrum');

-- ���������� ������ � �������
insert into employees(employee_name)
	values ('Dennis_Carr'),	
		   ('Jack_Stensrud'),
		   ('Jimmy_Robinson'),
		   ('Randall_Strop'),
		   ('Steven_Melancon'),	
		   ('Donna_Mellish'),
		   ('Scott_Beaty'),
		   ('Enrique_Gibson'),
		   ('Stanley_Hickman'),	
		   ('Gloria_Mercado'),
		   ('Michael_White'),
		   ('Milton_Russell'),
		   ('Tanya_Aki'),	
		   ('Dawn_Dwelle'),
		   ('Rex_Wilson'),
		   ('Donald_Hayner'),
		   ('Elmer_Dixon'),	
		   ('Steven_Horton'),
		   ('Fay_Akins'),
		   ('Jay_Biggs'),
		   ('Marie_Casto'),	
		   ('Kenneth_Jackson');

-- ������� ������� salary_1
create table salary_1
	(
		id serial primary key,
		monthly_salary int not null
	);

-- ����� ������� salary_1
select * from salary_1;

-- ��������� ������� salary 15 ��������:
insert into salary_1(monthly_salary)
	values (1000),
	 	   (1100),
	  	   (1300),
	  	   (1400),
	 	   (1500),
	  	   (1600),
	  	   (1700),
	 	   (1800),
	  	   (1900),
	  	   (2000),
	 	   (2100),
	  	   (2200),
	  	   (2300),
	 	   (2400),
	  	   (2500);

--�������� �������� � ������� monthly_salary
insert into salary_1(monthly_salary)
values(6000);
	  	  
-- ������� ������� employee_salary
create table employee_salary
	(
		id serial primary key,
		employee_id int not null unique,
		salary_1_id int not null
	);

-- ��������� ������� employee_salary 40 ��������:
insert into employee_salary(employee_id, salary_1_id)
	values (3, 1),
		   (78, 7),
		   (45, 4),
		   (76, 2),
		   (13, 3),
		   (40, 12),
		   (38, 15),
		   (77, 7),
		   (23, 9),
		   (27, 10),
		   (68, 2),
		   (79, 1),
		   (36, 13),
		   (44, 9),
		   (75, 7),
		   (53, 4),
		   (10, 2),
		   (8, 7),
		   (4, 11),
		   (7, 8),
		   (74, 13),
		   (1, 12),
		   (6, 15),
		   (67, 14),
		   (69, 10),
		   (64, 9),
		   (73, 2),
		   (63, 5),
		   (9, 7),
		   (72, 9),
		   (31, 3),
		   (29, 8),
		   (57, 12),
		   (80, 14),
		   (35, 11),
		   (39, 10),
		   (28, 11),
		   (71, 5),
		   (17, 15),
		   (11, 12);
		  
-- ����� ������� employee_salary
select * from employee_salary;

-- ������� ������� employee_salary
-- drop table employee_salary;

--������� ������� roles
create table roles_1
	(
		id serial primary key,
		role_name int not null unique
	);

-- ����� ������� employee_salary
select * from roles_1;

-- �������� ��� ������ role_name � int �� varchar(30)
alter table roles_1
	alter column role_name type varchar(30) using role_name::varchar(30);
	
insert into roles_1(role_name)
	values ('Junior Python developer'),
		   ('Middle Python developer'),
		   ('Senior Python developer'),
		   ('Junior Java developer'),
		   ('Middle Java developer'),
		   ('Senior Java developer'),
		   ('Junior JavaScript developer'),
		   ('Middle JavaScript developer'),
		   ('Senior JavaScript developer'),
		   ('Junior Manual QA engineer'),
		   ('Middle Manual QA engineer'),
		   ('Senior Manual QA engineer'),
		   ('Project Manager'),
		   ('Designer'),
		   ('HR'),
		   ('CEO'),
		   ('Sales manager'),
		   ('Junior Automation QA engineer'),
		   ('Middle Automation QA engineer'),
		   ('Senior Automation QA engineer');
		   
-- ������� ������� roles_employee
create table roles_employee
(
		id serial primary key,
		employee_id int not null unique,
		role_id int not null,
		foreign key (employee_id)
			references employees(id),
		foreign key (role_id)
			references roles_1(id)
	);
	
-- ����� ������� roles_employee
select * from roles_employee;

-- ������� ������� roles_employee
-- drop table roles_employee;

-- ��������� ������� roles_employee 40 ��������:
insert into roles_employee(employee_id, role_id)
	values (1, 20),
		   (4, 1),
		   (7, 13),
		   (13,15),
		   (53, 2),
		   (70, 4),
		   (12, 7),
		   (16, 9),
		   (18, 11),
		   (26, 16),
		   (21, 13),
		   (28, 12),
		   (27, 19),
		   (33, 20),
		   (31, 18),
		   (37, 17),
		   (35, 17),
		   (46, 16),
		   (42, 15),
		   (49, 11),
		   (19, 1),
		   (20, 2),
		   (55, 13),
		   (58, 18),
		   (51, 3),
		   (69, 20),
		   (67, 1),
		   (62, 1),
		   (64, 20),
		   (9, 15),
		   (5, 17),
		   (39, 12),
		   (52, 13),
		   (60, 16),
		   (68, 5),
		   (40, 6),
		   (59, 3),
		   (29, 14),
		   (32, 13),
		   (23, 1);