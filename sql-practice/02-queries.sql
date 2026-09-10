
11)  Write a query to find the name and numbers of all salesmen who had more than one customer.
    -> ) SELECT s.name, COUNT(s.salesman_id)
       FROM salesman_43b7 s
    -> JOIN customer_43b7 c
    -> ON s.salesman_id = c.salesman_id
    -> GROUP By s.name,s.salesman_id
    ->  HAVING COUNT(s.salesman_id) > 1;
12) Write a queries to find all orders with order amounts which are on or above-average amounts for their customers
select o.* from orders_43b7 o where purch_amt>(select avg(o2.purch_amt) from orders_43b7 o2 where o.customer_id=o2.customer_id);
13)  Write a query to find the sums of the amounts from the orders table, grouped by date, eliminating all those dates where the sum was not at least 1000.00 above the maximum order amount for that date.
select ord_date,sum(purch_amt) as sum from orders_43b7 group by ord_Date having sum > max(purch_amt)+1000;
14) Write a query to extract the data from the customer table if and only if one or more of the customers in the customer table are located in London
select * from customer_43b7 where(select count(customer_id) from customer_43b7 where city='London')>0 and city='London';
15) Write a query to find the salesmen who have multiple customers.explain the functionality
select DISTINCT(s.salesman_id),s.name,count(c.customer_id) as count_cust from salesman_43b7 s join customer_43b7 c on s.salesman_id=c.salesman_id group by s.salesman_id,s.name having count_cust>1;
