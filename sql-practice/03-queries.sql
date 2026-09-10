
Find the average order value for each city 
select  avg(o.order_amount),c.city from orders o join customer c on o.order_id=c.cid group by c.city;
list all orders placed on 2023-07-04and 2027-07-06
select * from orders where order_date in('2023-07-04','2027-07-06');
