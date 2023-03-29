use assignment;
# Q.1 
select * from employee where deptno=10 and salary>3000;

# Q.2 


# a)
SELECT
count(*) from students where marks >=50 and marks<80;
# b)
SELECT
count(*) from students where marks >=80;

# Q.3


select distinct city from station where id%2 =0;

# Q.4 
select (count(city)-count(distinct city)) from station;

# Q.5 
# a)
select distinct CITY from STATION where left(city,1) in ('a', 'e', 'i', 'o', 'u');

#b)
SELECT DISTINCT(CITY) FROM STATION WHERE CITY LIKE 'a%a' OR CITY LIKE 'e%e' OR CITY LIKE 'i%i' OR CITY LIKE 'o%o' 
OR CITY LIKE 'u%u';

# c)

select distinct CITY from STATION where left(city,1) not in ('a', 'e', 'i', 'o', 'u');

# d)

SELECT DISTINCT CITY FROM STATION
WHERE CITY NOT LIKE 'a%' 
AND CITY NOT LIKE 'e%'
AND CITY NOT LIKE 'i%'
AND CITY NOT LIKE 'o%'
AND CITY NOT LIKE 'u%'
AND CITY NOT LIKE '%a' 
AND CITY NOT LIKE '%e'
AND CITY NOT LIKE '%i'
AND CITY NOT LIKE '%o'
AND CITY NOT LIKE '%u';

# Q.6

select first_name from emp where salary>2000 and datediff(curdate(),hire_date)< 36*30 order by salary desc;

# Q.7

select sum(salary) as total_salary,deptno  from employee group by deptno;
select * from employee;
# Q.8


select count(*) from city where population>100000;

# Q.9 

select sum(population) as population,district from city where district ='california';

# Q.10 
select avg(population) as average from city;

# Q.11


select o.ordernumber,o.status,o.customernumber,c.customername,o.comments from orders o
join customers c 
on o.customernumber=c.customernumber where o.status= 'disputed';






