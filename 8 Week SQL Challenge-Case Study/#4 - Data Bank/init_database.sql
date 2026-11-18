/*
===================================================================================================
Create Database and Schemas 
===================================================================================================
Sript Purpose:
  This script creates a new database named 'Data_Bank' after checking if it already exists.
  If the database exists, it is dropped and recreated. Additionally, the script set up three schemas 
  within the database: 'bronze', 'silver' and 'gold'

Warning:
  Running this script will drop the entire 'Data_Bank' database if it exists. All data in the Table
  will be permanently deleted. Proceed with caution and ensure you have proper backups before running 
  this script.
*/

USE master;

--Drop and recreate the 'Data_Bank' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Data_Bank')
BEGIN
     ALTER DATABASE Data_Bank SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
     DROP DATABASE Data_Bank
END;
GO

--Create the 'Data_Bank' database
CREATE DATABASE Data_Bank;
GO



USE master
GO

--Create Schema
CREATE SCHEMA Data_Bank;
GO
