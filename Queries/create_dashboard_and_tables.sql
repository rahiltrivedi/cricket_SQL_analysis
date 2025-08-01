CREATE DATABASE cricket_analytics;
USE cricket_analytics;


/*
---------------------------------------------------------------
 Title       : IPL Cricket Data Analysis using MySQL
 Author      : [Your Name]
 Description : This project analyzes IPL cricket data using SQL.
               The database 'cricket_analytics' was created manually.
               However, tables (matches, deliveries, players) were
               NOT created manually using CREATE TABLE statements.

               Instead, the CSV files from the Kaggle dataset were
               imported directly into MySQL Workbench using the 
               "Table Data Import Wizard," which auto-generated 
               the table structure based on the CSV headers.

               Note: This method lets MySQL auto-detect column
               types, which may require adjustments later for 
               optimization or accuracy.

 Dataset     : https://www.kaggle.com/datasets/ramjidoolla/ipl-data-set
---------------------------------------------------------------
*/

select * from matches;
select * from players;
select count(*) from deliveries;
