CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(50),
    Monthly_Sales INT,
    Income INT,
    Region VARCHAR(20)
);

INSERT INTO Customers (Customer_ID, Name, City, Monthly_Sales, Income, Region)
VALUES 
(101, 'Rahul Mehta', 'Mumbai', 12000, 65000, 'West'),
(102, 'Anjali Rao', 'Bengaluru', NULL, NULL, 'South'),
(103, 'Suresh Iyer', 'Chennai', 15000, 72000, 'South'),
(104, 'Neha Singh', 'Delhi', NULL, NULL, 'North'),
(105, 'Amit Verma', 'Pune', 18000, 58000, NULL),
(106, 'Karan Shah', 'Ahmedabad', NULL, 61000, 'West'),
(107, 'Pooja Das', 'Kolkata', 14000, NULL, 'East'),
(108, 'Riya Kapoor', 'Jaipur', 16000, 69000, 'North');

DELETE FROM Customers
WHERE Region IS NULL;



##Q8. Listwise Deletion 
##Remove all rows where Region is missing.
##Tasks:
##Identify affected rows
##Show the dataset after deletion
##Mention how many records were lost

##1. Solution :- 
SELECT * FROM Customers
WHERE Monthly_Sales IS NULL
OR Income IS NULL OR Region IS
NULL;

##2. Solution :-
SELECT * FROM Customers;

##3. Solution :-
SELECT COUNT(*) AS Lost_Records_Count
FROM Customers
WHERE Monthly_Sales IS NULL 
   OR Income IS NULL 
   OR Region IS NULL;
   

##Q9. Imputation 
##Handle missing values in Monthly_Sales using:
##Forward Fill
##Tasks:
##Apply forward fill


##1. Solution :-
WITH GroupedSales AS (
    SELECT 
        Customer_ID,
        Name,
        City,
        Monthly_Sales,
        Income,
        Region,
        -- This counts how many non-null values have appeared so far
        COUNT(Monthly_Sales) OVER (ORDER BY Customer_ID) AS sales_group
    FROM Customers
)
SELECT 
    Customer_ID,
    Name,
    City,
    -- This picks the first non-null value in each group
    FIRST_VALUE(Monthly_Sales) OVER (PARTITION BY sales_group ORDER BY Customer_ID) AS Monthly_Sales_Filled,
    Income,
    Region
FROM GroupedSales;


##Q10. Flagging Missing Data
##Create a flag column for missing Income.
##Tasks:
##Create Income_Missing_Flag (0 = present, 1 = missing)
##Show updated dataset
##Count how many customers have missing income

## Solution :-
-- Query to show updated dataset with Flag
SELECT 
    *,
    CASE 
        WHEN Income IS NULL THEN 1 
        ELSE 0 
    END AS Income_Missing_Flag
FROM Customers;

-- Query to count missing income customers
SELECT 
    COUNT(*) AS Missing_Income_Count
FROM Customers
WHERE Income IS NULL;