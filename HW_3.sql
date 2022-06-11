-- ����� ������
select * from employees;
select * from salary_1;
select * from employee_salary;
select * from roles_1;
select * from roles_employee;

-- 1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.

 select employee_name, monthly_salary from employees E
	join employee_salary ES on E.id = ES.employee_id
	join salary_1 S on  S.id = ES.salary_1_id;
	
-- 2. ������� ���� ���������� � ������� �� ������ 2000.
	
select employee_name, monthly_salary from employees E
	join employee_salary ES on E.id = ES.employee_id
	join salary_1 S on  S.id = ES.salary_1_id
	where monthly_salary < 2000
	order by S.id;
	
-- 3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)

select employee_id, monthly_salary from salary_1 S
	left join employee_salary ES on S.id = ES.salary_1_id
	where ES.employee_id is null;

-- 4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)

select employee_id, monthly_salary from salary_1 S
	left join employee_salary ES on S.id = ES.salary_1_id
	where ES.employee_id is null and monthly_salary < 2000;

-- 5. ����� ���� ���������� ���� �� ��������� ��.

select employee_name, salary_1_id from employees E
	left join employee_salary ES on E.id = ES.employee_id
	where ES.salary_1_id is null
	order by E.id;

-- 6. ������� ���� ���������� � ���������� �� ���������.

select employee_name, role_name from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	order by E.id;
	
-- 7. ������� ����� � ��������� ������ Java �������������.

select employee_name, role_name from employees E	
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	where role_name like '%Java%'
	order by E.id;

-- 8. ������� ����� � ��������� ������ Python �������������.

select employee_name, role_name from employees E	
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	where role_name like '%Python%'
	order by E.id;

-- 9. ������� ����� � ��������� ���� QA ���������.

select employee_name, role_name from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	where role_name like '%QA%'
	order by E.id;

-- 10. ������� ����� � ��������� ������ QA ���������.

select employee_name, role_name from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	where role_name like '%Manual%QA%'
	order by E.id;

-- 11. ������� ����� � ��������� ��������������� QA

select employee_name, role_name from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	where role_name like '%Automation%QA%'
	order by E.id;

-- 12. ������� ����� � �������� Junior ������������

select employee_name, monthly_salary as salary_junior_qa from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.id
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%Junior%'
	order by S.monthly_salary;

-- 13. ������� ����� � �������� Middle ������������

select employee_name, monthly_salary as salary_middle_qa from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.id
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%Middle%'
	order by S.monthly_salary;

-- 14. ������� ����� � �������� Senior ������������

select employee_name, monthly_salary as salary_senior_QA from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.id
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%Senior%'
	order by S.monthly_salary;

-- 15. ������� �������� Java �������������

select monthly_salary as Salary_Java_dev from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.id
	join salary_1 S on ES.salary_1_id = S.id 
	where role_name like '%ava%eveloper%'
	order by S.monthly_salary;

-- 16. ������� �������� Python �������������

select  monthly_salary as Salary_Python_dev from employees E
	join employee_salary ES on E.id = ES.employee_id
	join salary_1 S on S.id = ES.salary_1_id 
	join roles_employee RE on E.id  = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	where role_name like '%Python%'
	order by monthly_salary;
	
-- 17. ������� ����� � �������� Junior Python �������������
	
select employee_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id 
	where role_name like '%unior%ython%'
	order by monthly_salary;
	
-- 18. ������� ����� � �������� Middle JS �������������

select employee_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id 
	where role_name like '%iddle%ava%cript'
	order by monthly_salary;

-- 19. ������� ����� � �������� Senior Java �������������

select employee_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id 
	where role_name like '%enior%ava%'
	order by monthly_salary;

-- 20. ������� �������� Junior QA ���������

select employee_name, monthly_salary, role_name from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id 
	where role_name like '%unior%QA%'
	order by monthly_salary;

-- 21. ������� ������� �������� ���� Junior ������������

select avg(monthly_salary) as srednyaya_ZP from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%Junior%';
	

-- 22. ������� ����� ������� JS �������������
	
select sum(monthly_salary) as summa_zp from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%ava%cript%';
	
-- 23. ������� ����������� �� QA ���������
	
select min(monthly_salary) as min_zp from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%QA%';
	
-- 24. ������� ������������ �� QA ���������
	
select max(monthly_salary) as max_zp from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%QA%';	
	
-- 25. ������� ���������� QA ���������
	
select count(role_name) as kolvo_QA from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%QA%';	
	
-- 26. ������� ���������� Middle ������������.
	
select count(role_name) as kolvo_QA from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%iddle%';	


select count(role_name) as kolvo_QA from roles_employee RE
	join roles_1 R on RE.role_id = R.id 
	join employee_salary es on es.employee_id = RE.employee_id 
	where role_name like '%iddle%';

-- 27. ������� ���������� �������������
	
select count(role_name) as kolvo_QA from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%eveloper%';		
	
-- 28. ������� ���� (�����) �������� �������������.
	
select sum(monthly_salary) as summa_zp_dev from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%eveloper%';	
	
-- 29. ������� �����, ��������� � �� ���� ������������ �� �����������
	
select employee_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	order by monthly_salary;
	
-- 30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
	
select employee_name, role_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where monthly_salary > 1700 and monthly_salary < 2300
	order by monthly_salary	;
	
-- 31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
	
select employee_name, role_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where  monthly_salary < 2300
	order by monthly_salary	;
	
-- 32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
	
select employee_name, role_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where  monthly_salary = 1100 or monthly_salary = 1500 or monthly_salary = 2000
	order by monthly_salary;	
	
