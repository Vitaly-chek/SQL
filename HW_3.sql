-- Вывод таблиц
select * from employees;
select * from salary_1;
select * from employee_salary;
select * from roles_1;
select * from roles_employee;

-- 1. Âûâåñòè âñåõ ðàáîòíèêîâ ÷üè çàðïëàòû åñòü â áàçå, âìåñòå ñ çàðïëàòàìè.

 select employee_name, monthly_salary from employees E
	join employee_salary ES on E.id = ES.employee_id
	join salary_1 S on  S.id = ES.salary_1_id;
	
-- 2. Âûâåñòè âñåõ ðàáîòíèêîâ ó êîòîðûõ ÇÏ ìåíüøå 2000.
	
select employee_name, monthly_salary from employees E
	join employee_salary ES on E.id = ES.employee_id
	join salary_1 S on  S.id = ES.salary_1_id
	where monthly_salary < 2000
	order by S.id;
	
-- 3. Âûâåñòè âñå çàðïëàòíûå ïîçèöèè, íî ðàáîòíèê ïî íèì íå íàçíà÷åí. (ÇÏ åñòü, íî íå ïîíÿòíî êòî å¸ ïîëó÷àåò.)

select employee_id, monthly_salary from salary_1 S
	left join employee_salary ES on S.id = ES.salary_1_id
	where ES.employee_id is null;

-- 4. Âûâåñòè âñå çàðïëàòíûå ïîçèöèè  ìåíüøå 2000 íî ðàáîòíèê ïî íèì íå íàçíà÷åí. (ÇÏ åñòü, íî íå ïîíÿòíî êòî å¸ ïîëó÷àåò.)

select employee_id, monthly_salary from salary_1 S
	left join employee_salary ES on S.id = ES.salary_1_id
	where ES.employee_id is null and monthly_salary < 2000;

-- 5. Íàéòè âñåõ ðàáîòíèêîâ êîìó íå íà÷èñëåíà ÇÏ.

select employee_name, salary_1_id from employees E
	left join employee_salary ES on E.id = ES.employee_id
	where ES.salary_1_id is null
	order by E.id;

-- 6. Âûâåñòè âñåõ ðàáîòíèêîâ ñ íàçâàíèÿìè èõ äîëæíîñòè.

select employee_name, role_name from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	order by E.id;
	
-- 7. Âûâåñòè èìåíà è äîëæíîñòü òîëüêî Java ðàçðàáîò÷èêîâ.

select employee_name, role_name from employees E	
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	where role_name like '%Java%'
	order by E.id;

-- 8. Âûâåñòè èìåíà è äîëæíîñòü òîëüêî Python ðàçðàáîò÷èêîâ.

select employee_name, role_name from employees E	
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	where role_name like '%Python%'
	order by E.id;

-- 9. Âûâåñòè èìåíà è äîëæíîñòü âñåõ QA èíæåíåðîâ.

select employee_name, role_name from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	where role_name like '%QA%'
	order by E.id;

-- 10. Âûâåñòè èìåíà è äîëæíîñòü ðó÷íûõ QA èíæåíåðîâ.

select employee_name, role_name from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	where role_name like '%Manual%QA%'
	order by E.id;

-- 11. Âûâåñòè èìåíà è äîëæíîñòü àâòîìàòèçàòîðîâ QA

select employee_name, role_name from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	where role_name like '%Automation%QA%'
	order by E.id;

-- 12. Âûâåñòè èìåíà è çàðïëàòû Junior ñïåöèàëèñòîâ

select employee_name, monthly_salary as salary_junior_qa from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.id
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%Junior%'
	order by S.monthly_salary;

-- 13. Âûâåñòè èìåíà è çàðïëàòû Middle ñïåöèàëèñòîâ

select employee_name, monthly_salary as salary_middle_qa from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.id
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%Middle%'
	order by S.monthly_salary;

-- 14. Âûâåñòè èìåíà è çàðïëàòû Senior ñïåöèàëèñòîâ

select employee_name, monthly_salary as salary_senior_QA from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.id
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%Senior%'
	order by S.monthly_salary;

-- 15. Âûâåñòè çàðïëàòû Java ðàçðàáîò÷èêîâ

select monthly_salary as Salary_Java_dev from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.id
	join salary_1 S on ES.salary_1_id = S.id 
	where role_name like '%ava%eveloper%'
	order by S.monthly_salary;

-- 16. Âûâåñòè çàðïëàòû Python ðàçðàáîò÷èêîâ

select  monthly_salary as Salary_Python_dev from employees E
	join employee_salary ES on E.id = ES.employee_id
	join salary_1 S on S.id = ES.salary_1_id 
	join roles_employee RE on E.id  = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	where role_name like '%Python%'
	order by monthly_salary;
	
-- 17. Âûâåñòè èìåíà è çàðïëàòû Junior Python ðàçðàáîò÷èêîâ
	
select employee_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id 
	where role_name like '%unior%ython%'
	order by monthly_salary;
	
-- 18. Âûâåñòè èìåíà è çàðïëàòû Middle JS ðàçðàáîò÷èêîâ

select employee_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id 
	where role_name like '%iddle%ava%cript'
	order by monthly_salary;

-- 19. Âûâåñòè èìåíà è çàðïëàòû Senior Java ðàçðàáîò÷èêîâ

select employee_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id 
	where role_name like '%enior%ava%'
	order by monthly_salary;

-- 20. Âûâåñòè çàðïëàòû Junior QA èíæåíåðîâ

select employee_name, monthly_salary, role_name from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id 
	where role_name like '%unior%QA%'
	order by monthly_salary;

-- 21. Âûâåñòè ñðåäíþþ çàðïëàòó âñåõ Junior ñïåöèàëèñòîâ

select avg(monthly_salary) as srednyaya_ZP from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%Junior%';
	

-- 22. Âûâåñòè ñóììó çàðïëàò JS ðàçðàáîò÷èêîâ
	
select sum(monthly_salary) as summa_zp from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%ava%cript%';
	
-- 23. Âûâåñòè ìèíèìàëüíóþ ÇÏ QA èíæåíåðîâ
	
select min(monthly_salary) as min_zp from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%QA%';
	
-- 24. Âûâåñòè ìàêñèìàëüíóþ ÇÏ QA èíæåíåðîâ
	
select max(monthly_salary) as max_zp from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%QA%';	
	
-- 25. Âûâåñòè êîëè÷åñòâî QA èíæåíåðîâ
	
select count(role_name) as kolvo_QA from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%QA%';	
	
-- 26. Âûâåñòè êîëè÷åñòâî Middle ñïåöèàëèñòîâ.
	
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

-- 27. Âûâåñòè êîëè÷åñòâî ðàçðàáîò÷èêîâ
	
select count(role_name) as kolvo_QA from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%eveloper%';		
	
-- 28. Âûâåñòè ôîíä (ñóììó) çàðïëàòû ðàçðàáîò÷èêîâ.
	
select sum(monthly_salary) as summa_zp_dev from employees E
	join roles_employee RE on E.id = RE.employee_id 
	join roles_1 R on R.id = RE.role_id 
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where role_name like '%eveloper%';	
	
-- 29. Âûâåñòè èìåíà, äîëæíîñòè è ÇÏ âñåõ ñïåöèàëèñòîâ ïî âîçðàñòàíèþ
	
select employee_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	order by monthly_salary;
	
-- 30. Âûâåñòè èìåíà, äîëæíîñòè è ÇÏ âñåõ ñïåöèàëèñòîâ ïî âîçðàñòàíèþ ó ñïåöèàëèñòîâ ó êîòîðûõ ÇÏ îò 1700 äî 2300
	
select employee_name, role_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where monthly_salary > 1700 and monthly_salary < 2300
	order by monthly_salary	;
	
-- 31. Âûâåñòè èìåíà, äîëæíîñòè è ÇÏ âñåõ ñïåöèàëèñòîâ ïî âîçðàñòàíèþ ó ñïåöèàëèñòîâ ó êîòîðûõ ÇÏ ìåíüøå 2300
	
select employee_name, role_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where  monthly_salary < 2300
	order by monthly_salary	;
	
-- 32. Âûâåñòè èìåíà, äîëæíîñòè è ÇÏ âñåõ ñïåöèàëèñòîâ ïî âîçðàñòàíèþ ó ñïåöèàëèñòîâ ó êîòîðûõ ÇÏ ðàâíà 1100, 1500, 2000
	
select employee_name, role_name, monthly_salary from employees E
	join roles_employee RE on E.id = RE.employee_id
	join roles_1 R on R.id = RE.role_id
	join employee_salary ES on E.id = ES.employee_id 
	join salary_1 S on S.id = ES.salary_1_id
	where  monthly_salary = 1100 or monthly_salary = 1500 or monthly_salary = 2000
	order by monthly_salary;	
	
