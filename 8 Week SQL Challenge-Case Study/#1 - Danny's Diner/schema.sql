use "Danny's Diner";

IF OBJECT_ID('dbo.sales','U') IS NOT NULL
	DROP TABLE dbo.sales;

GO

CREATE TABLE sales(
"customer_id" VARCHAR(1),
"order_date" DATE,
"product_id" INTEGER);

IF OBJECT_ID('dbo.menu','U') IS NOT NULL
	DROP TABLE dbo.menu;

GO

CREATE TABLE menu(
"product_id" INT PRIMARY KEY,
"product_name" VARCHAR(10),
"price" INT);

IF OBJECT_ID('dbo.members','U') IS NOT NULL
	DROP TABLE dbo.members;

GO
CREATE TABLE members(
"customer_id" VARCHAR(1) PRIMARY KEY,
"joindate" DATE);

INSERT INTO sales
  ("customer_id", "order_date", "product_id")
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
 
 INSERT INTO menu
  ("product_id", "product_name", "price")
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');

  INSERT INTO members
  ("customer_id", "joindate")
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');
  
  INSERT INTO members
  ("customer_id","joindate")
  VALUES 
  ('C', '2021-01-12');