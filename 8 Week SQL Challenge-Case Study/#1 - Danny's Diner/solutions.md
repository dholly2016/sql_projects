## Case Study Questions

1. What is the total amount each customer spent at the restaurant?

2. How many days has each customer visited the restaurant?
3. What was the first item from the menu purchased by each customer?
4. What is the most purchased item on the menu and how many times was it purchased by all customers?
5. Which item was the most popular for each customer?
6. Which item was purchased first by the customer after they became a member?
7. Which item was purchased just before the customer became a member?
8. What is the total items and amount spent for each member before they became a member?
9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

<br>

**BONUS questions** :

i. Join all the things

ii. Rank all the things

---

### /* Each of the following case study questions can be answered using a single SQL statement: */

use "Danny's Diner";

### /* 1. What is the total amount each customer spent at the restaurant? */
select customer_id , sum(price) total_price
from sales s, menu m 
where s.product_id = m.product_id
group by s.customer_id;

### /* 2. How many days has each customer visited the restaurant?*/

select customer_id , COUNT(DISTINCT order_date) num_days
from sales
group by customer_id;

### /* 3. What was the first item from the menu purchased by each customer?*/
WITH ABC as  (
select customer_id,order_date,s.product_id,product_name, dense_rank()over(partition by customer_id order by order_date) rankings 
from sales s left join menu m 
on s.product_id = m.product_id)
select customer_id,order_date,product_id,product_name
from ABC 
where rankings = 1;

### /* 4. What is the most purchased item on the menu and how many times was it purchased by all customers?*/
select Top (1) m.product_name, count(s.product_id) purchase 
from sales s left join  menu m 
on s.product_id = m.product_id
group by m.product_name
order by purchase DESC;


### /* 5. Which item was the most popular for each customer?*/
WITH abc as (select customer_id , product_name, count(s.product_id) ordered  , dense_rank() over (partition by customer_id order by count(s.product_id)) rankings
from sales s ,menu m 
where s.product_id = m.product_id
group by customer_id,m.product_name)
select customer_id , product_name, ordered
from abc 
where rankings = 1;



### /* 6. Which item was purchased first by the customer after they became a member?*/
WITH abc as (
select s.customer_id , product_id , order_date,joindate, row_number() over (partition by s.customer_id order by order_date) rankings 
from sales s left join members m 
on s.customer_id = m.customer_id
where order_date > joindate)
select * 
from abc 
where rankings < 2;

### /* 7. Which item was purchased just before the customer became a member?*/

WITH abc as (select s.customer_id , product_id , order_date, joindate, row_number() over (partition by s.customer_id order by order_date DESC) ranking 
from sales s inner join members m 
on s.customer_id = m.customer_id
where order_date < joindate)
select * 
from abc 
where ranking  = 1;

### /* 8. What is the total items and amount spent for each member before they became a member?*/

select s.customer_id, count(s.product_id) total , sum(m.price) price 
from sales s , menu m , members mem
where  s.product_id = m.product_id and 
		mem.customer_id = s.customer_id and 
		order_date < joindate
group by s.customer_id;


### /* 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?*/
WITH abc as (
select product_id , case when product_id = 1 
						 then price * 20 
						 else price * 10 
					 end as points  			
from menu m)
select customer_id , sum(points)
from sales s, abc 
where s.product_id = abc.product_id
group by s.customer_id
order by s.customer_id;



### /* 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?*/
WITH abc as (SELECT *, 
		DATEADD(DAY, 6, joindate) AS valid_date, 
		EOMONTH('2021-01-1') AS last_date
FROM members)
select s.customer_id, sum(case 
							when s.product_id = 1 then price * 20 
							when s.order_date between cd.joindate and cd.valid_date then price * 20 
							else price * 10 
							end ) total_points
from sales s , menu m , abc cd ,members mem
where cd.customer_id = s.customer_id and 
	  m.product_id = s.product_id and 
	  s.order_date <= cd.last_date and 
	  mem.joindate <= s.order_date
group by s.customer_id;
	  
select * 
from members;
select * 
from menu;
select * 
from sales;

/****************************************** BONUS QUESTIONS **************************************/

/*
 ******************************************JOIN ALL THINGS****************************************

### Bonus Q1. Create a basic data table that Danny and his team can use to quickly derive insights
### without needing  to join the underlying tables using SQL. The data table should return customer id ,
### order date, product name, price, and whether or not the  customer was member @ the time of purchase 
*/

select s.customer_id,s.order_date,m.product_name,m.price,
		case
		when s.order_date < mem.joindate then  'N'
		else  'Y'
		end member
from sales s left join menu m 
on s.product_id = m.product_id 
left join members mem 
on s.customer_id = mem.customer_id;

/* 
 ******************************************RANK ALL THINGS****************************************
### Bonus Q2. Required is further information about the ranking of customer products, the ranking for 
### non-member purchases should return null ranking values for the records when customers are not yet
### part of the loyalty program.
*/
WITH cte AS(
select s.customer_id,s.order_date,m.product_name,m.price,
		case
		when s.order_date < mem.joindate then  'N'
		else  'Y'
		end member
from sales s left join menu m 
on s.product_id = m.product_id 
left join members mem 
on s.customer_id = mem.customer_id)

select *,
			case when member = 'N' Then NULL
			else DENSE_RANK() over (partition by customer_id order by order_date) 
			end 'ranking'
from cte;
















