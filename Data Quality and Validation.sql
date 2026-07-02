CREATE TABLE Sales_Transactions (
    Txn_ID INT PRIMARY KEY,
    Customer_ID VARCHAR(10),
    Customer_Name VARCHAR(100),
    Product_ID VARCHAR(10),
    Quantity INT,
    Txn_Amount DECIMAL(10, 2),
    Txn_Date DATE,
    City VARCHAR(50)
);

CREATE TABLE Customers_Master (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

INSERT INTO Sales_Transactions (Txn_ID, Customer_ID, Customer_Name, Product_ID, Quantity, Txn_Amount, Txn_Date, City)
VALUES 
(201, 'C101', 'Rahul Mehta', 'P11', 2, 4000, '2025-12-01', 'Mumbai'),
(202, 'C102', 'Anjali Rao', 'P12', 1, 1500, '2025-12-01', 'Bengaluru'),
(203, 'C101', 'Rahul Mehta', 'P11', 2, 4000, '2025-12-01', 'Mumbai'),
(204, 'C103', 'Suresh Iyer', 'P13', 3, 6000, '2025-12-02', 'Chennai'),
(205, 'C104', 'Neha Singh', 'P14', NULL, 2500, '2025-12-02', 'Delhi'),
(206, 'C105', NULL, 'P15', 1, NULL, '2025-12-03', 'Pune'),
(207, 'C106', 'Amit Verma', 'P16', 1, 1800, NULL, 'Pune'),
(208, 'C101', 'Rahul Mehta', 'P11', 2, 4000, '2025-12-01', 'Mumbai');

INSERT INTO Customers_Master (CustomerID, CustomerName, City)
VALUES 
('C101', 'Rahul Mehta', 'Mumbai'),
('C102', 'Anjali Rao', 'Bengaluru'),
('C103', 'Suresh Iyer', 'Chennai'),
('C104', 'Neha Singh', 'Delhi');

##Q7. Write an SQL query on Sales_Transactions to list all duplicate keys and their counts using the
      ##business key (Customer_ID + Product_ID + Txn_Date + Txn_Amount ).

##Solution :-
SELECT 
    Customer_ID, 
    Product_ID, 
    Txn_Date, 
    Txn_Amount, 
    COUNT(*) AS Duplicate_Count
FROM Sales_Transactions
GROUP BY 
    Customer_ID, 
    Product_ID, 
    Txn_Date, 
    Txn_Amount
HAVING COUNT(*) > 1;

##Q8. Identify Sales_Transactions.Customer_ID values that violate referential integrity when joined with 
##Customers_Master and write a query to detect such violations.

##Solution :-
SELECT 
    t.Txn_ID, 
    t.Customer_ID, 
    t.Customer_Name
FROM Sales_Transactions t
LEFT JOIN Customers_Master m 
    ON t.Customer_ID = m.CustomerID
WHERE m.CustomerID IS NULL;
