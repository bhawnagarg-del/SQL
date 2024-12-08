create database wallmart
use wallmart
create table sessions(session_id int,user_id int ,session_date datetime)

insert into sessions values(1,1,'2024-01-02'),
(2,2,'2024-01-03'),
(3,3,'2024-01-07'),
(4,3,'2024-01-04'),
(5,4,'2024-01-03'),
(6,4,'2024-01-09'),
(7,5,'2024-01-01'),
(8,5,'2024-01-02'),
(9,3,'2024-01-08'),
(10,5,'2024-01-05')

create table orders(order_id int,user_id int ,order_value int,order_date datetime)

insert into orders values(1,1,154,'2024-01-01'),
(2,2,450,'2024-01-03'),
(3,3,398,'2024-01-07'),
(4,3,780,'2024-01-04'),
(5,4,121,'2024-01-03'),
(6,4,238,'2024-01-09'),
(7,5,152,'2024-01-01'),
(8,5,70,'2024-01-02'),
(9,3,171,'2024-01-08'),
(10,5,341,'2024-01-05')

-----query to solve.
--join:we are joint the data1 and data2 table  on user_id.
--cast:we are casting the session date and order date to remove the time part for comparison.
--sum:we are calcuate the total order value for the orders place on the same day.
--group by :we are grouping the result by user_id and session_date to get the totals for each day.
select s.user_id, cast(s.session_date as date)as session_date, count(o.order_id)as total_orders, sum(o.order_value)as total_order from sessions s

join orders o on s.user_id =o.user_id

where cast(s.session_date as date)=cast(o.order_date as date)

group by s.user_id,cast(s.session_date as date)

order by s.user_id,session_date

--