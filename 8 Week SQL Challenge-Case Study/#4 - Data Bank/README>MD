## [Case Study 4 : Data Bank](https://8weeksqlchallenge.com/case-study-4/)
<p align="center">
<img src="https://8weeksqlchallenge.com/images/case-study-designs/4.png" alt="Image" width="450" height="450">



## Table Of Contents
  - [Introduction](#introduction)

  - [Dataset](#dataset)
  - [Entity Relationship Diagram](#entity-relationship-diagram)
  - [Case Study Solutions](#case-study-solutions)
  - [Contributing](#contributing)
  - [Support](#support) 
  

## Introduction
Danny thought that there should be some sort of intersection between these new age banks, cryptocurrency and the data world…so he decides to launch a new initiative - Data Bank!

Data Bank runs just like any other digital bank - but it isn’t only for banking activities, they also have the world’s most secure distributed data storage platform!

Customers are allocated cloud data storage limits which are directly linked to how much money they have in their accounts. There are a few interesting caveats that go with this business model, and this is where the Data Bank team need your help!

The management team at Data Bank want to increase their total customer base - but also need some help tracking just how much data storage their customers will need.

This case study is all about calculating metrics, growth and helping the business analyse their data in a smart way to better forecast and plan for their future developments!



## Dataset
Key datasets for this case study : 

### 1. **`regions`** : 

The regions table contains the region_id and their respective region_name values

region_id |	region_name |
|--|--|
1 |	Africa |
2 |	America |
3 |	Asia |
4 |	Europe |
5 |	Oceania |


### 2. **`Customer Nodes`** : 

Customers are randomly distributed across the nodes according to their region - this also specifies exactly which node contains both their cash and data.

This random distribution changes frequently to reduce the risk of hackers getting into Data Bank’s system and stealing customer’s money and data!

Below is a sample of the top 5 rows of the `data_bank.customer_nodes` : 


customer_id |	region_id |	node_id |	start_date |	end_date |
|--|--|--|--|--|
1 |	3 |	4 |	2020-01-02 |	2020-01-03 |
2 |	3 |	5 |	2020-01-03 |	2020-01-17 |
3 |	5 |	4 |	2020-01-27 |	2020-02-18 |
4 |	5 |	4 |	2020-01-07 |	2020-01-19 |
5 |	3 |	3 |	2020-01-15 |	2020-01-23 |



### 3. **`Customer Transactions`** : 

This table stores all customer deposits, withdrawals and purchases made using their Data Bank debit card.

Below is a sample of the top 5 rows of the `data_bank.customer_transactions` : 


customer_id |	txn_date |	txn_type |	txn_amount |
|--|--|--|--|
429 |	2020-01-21 |	deposit |	82 |
155 |	2020-01-10 |	deposit |	712 |
398 |	2020-01-01 |	deposit |	196 |
255 |	2020-01-14 |	deposit |	563 |
185 |	2020-01-29 |	deposit |	626 |


## Entity Relationship Diagram

![image](https://github.com/faizanxmulla/sql-portfolio/assets/71728480/9eb590d1-4234-462e-987d-f836a424ba05)




## Case Study Solutions
- [1. Customer Nodes Exploration](1.%20Customer-Nodes-Exploration.md)

- [2. Customer Transactions](2.%20Customer-Transactions.md)

- [3. Data Allocation](3.%20Data-Allocation.md)

- [4. Extra Challenge](4.%20Extra-Challenge.md)

- [5. Extension Request](5.%20Extension-Request.md)



## [Case Study 6 : Clique Bait](https://8weeksqlchallenge.com/case-study-6/)
<p align="center">
<img src="https://8weeksqlchallenge.com/images/case-study-designs/6.png" alt="Image" width="450" height="450">



## Table Of Contents
  - [Introduction](#introduction)

  - [Dataset](#dataset)
  - [Case Study Solutions](#case-study-solutions)
  - [Contributing](#contributing)
  - [Support](#support) 
  

## Introduction
Clique Bait is not like your regular online seafood store - the founder and CEO Danny, was also a part of a digital data analytics team and wanted to expand his knowledge into the seafood industry!

In this case study - you are required to support Danny’s vision and analyse his dataset and come up with creative solutions to calculate funnel fallout rates for the Clique Bait online store.



## Dataset
Key datasets for this case study : 

### 1. **`users`** : 
Customers who visit the Clique Bait website are tagged via their cookie_id.

user_id |	cookie_id |	start_date |
|--|--|--|
397 |	3759ff |	2020-03-30 00:00:00 |
215 |	863329 |	2020-01-26 00:00:00 |
191 |	eefca9 |	2020-03-15 00:00:00 |
89 |	764796 |	2020-01-07 00:00:00 |

### 2. **`events`** : 
Customer visits are logged in this events table at a cookie_id level and the event_type and page_id values can be used to join onto relevant satellite tables to obtain further information about each event.

visit_id |	cookie_id |	page_id |	event_type |	sequence_number |	event_time |
|--|--|--|--|--|--|
719fd3 |	3d83d3 |	5 |	1 |	4 |	2020-03-02 00:29:09.975502 |
fb1eb1 |	c5ff25 |	5 |	2 |	8 |	2020-01-22 07:59:16.761931 |
23fe81 |	1e8c2d |	10 |	1 |	9 |	2020-03-21 13:14:11.745667 |
ad91aa |	648115 |	6 |	1 |	3 |	2020-04-27 16:28:09.824606 |


### 3. **`Event Identifier`** : 

The event_identifier table shows the types of events which are captured by Clique Bait’s digital data systems.

event_type |	event_name |
|--|--|
1 |	Page View |
2 |	Add to Cart |
3 |	Purchase |
4 |	Ad Impression |
5 |	Ad Click |


### 4. **`Campaign Identifier`** : 


This table shows information for the 3 campaigns that Clique Bait has ran on their website so far in 2020.

campaign_id |	products |	campaign_name |	start_date |	end_date |
|--|--|--|--|--|
1 |	1-3 |	BOGOF - Fishing For Compliments |	2020-01-01 00:00:00 |	2020-01-14 00:00:00 |
2 |	4-5 |	25% Off - Living The Lux Life |	2020-01-15 00:00:00 |	2020-01-28 00:00:00 |
3 |	6-8 |	Half Off - Treat Your Shellf(ish) |	2020-02-01 00:00:00 |	2020-03-31 00:00:00 |




### 5. **`Page Hierarchy`** : 


This table lists all of the pages on the Clique Bait website which are tagged and have data passing through from user interaction events.



## Case Study Solutions
- [1. ERD diagram](1.%20ERD-diagram.md)

- [2. Digital Analysis](2.%20Digital-Analysis.md)

- [3. Product Funnel Analysis](3.%20Product-Funnel-Analysis.md)

- [4. Campaign Analysis](4.%20Campaigns-Analysis.md)


