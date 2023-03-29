use assignment;
# Q.1)

Delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `order_status`(in in_month int, in in_year int)
BEGIN
select ordernumber,orderdate,status from orders
where 
in_month=month(shippeddate) and in_year=year(shippeddate);

END// 


call order_status(5,2002);

# Q.2 

create table cancellations(
id int primary key auto_increment,
customernumber int,
ordernumber int,
comments varchar(250));


delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancel_order`()
BEGIN
insert into cancellations (customernumber,ordernumber,comments)
select customernumber,ordernumber,comments
from orders where status='cancelled';

END//

call cancel_order();


# Q.3 a)
delimiter//
create function purchase_status(in_customernumber int)
returns varchar(20)
reads sql data
deterministic
begin
declare statu varchar(20);
declare total float default 0;
set total=(select sum(amount) from payments where in_customernumber = customernumber);
if total < 25000 then set statu= 'Silver';
elseif total>25000 and amount <50000 then set statu = 'Gold';
elseif total>50000 then set statu='Platinum';
end if;
return statu;
end//

# Q.3 (b)

delimiter //
create procedure cust_detail()
begin
select customernumber, customername, if (creditlimit>50000,"Platinum",if(50000>creditlimit>25000,"Gold","Silver"))
from customers;
end//

Q.4)

delimiter //
create trigger trg_movies_update
after  delete on movies 
for each row 
begin
update rentals
set movieid= id 
where movieid = old.id ;
end;

delimiter //
create trigger trg_movies_delete
after  delete on movies 
for each row 
begin
delete from rentals 
where movieid 
not in (select distinct id from movies);
end//

#  Q.5 
select fname from employee order by salary desc limit 2,1 ;

# Q.6

select *,
rank() over( order by salary desc )
as rank_num from employee;



 
















