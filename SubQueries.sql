CREATE TABLE Employee (
  emp_id INT,
  name VARCHAR(50),
  department_id VARCHAR(50),
  salary INT
  );
  
CREATE TABLE Department (
    department_id VARCHAR(50),
    department_name VARCHAR(50),
    location VARCHAR(50)
    );
    
CREATE TABLE Sales (
      sale_id INT,
      emp_id INT,
      sale_amount INT,
      sale_date DATE
      );
      
INSERT INTO Employee VALUES
(101, 'Abhishek', 'D01', 62000),
(102, 'Shubham', 'D01', 58000),
(103, 'Priya', 'D02', 67000),
(104, 'Rohit', 'D02', 64000),
(105, 'Neha', 'D03', 72000),
(106, 'Aman', 'D03', 55000),
(107, 'Ravi', 'D04', 60000),
(108, 'Sneha', 'D04', 75000),
(109, 'Kiran', 'D05', 70000),
(110, 'Tanuja', 'D05', 65000);

INSERT INTO Department VALUES
('D01', 'Sales', 'Mumbai'),
('D02', 'Marketing', 'Delhi'),
('D03', 'Finance', 'Pune'),
('D04', 'HR', 'Bengaluru'),
('D05', 'IT', 'Hyderabad');

INSERT INTO Sales VALUES
(201, 101, 4500, "2025-01-05"),
(202, 102, 7800, "2025-01-10"),
(203, 103, 6700, "2025-01-14"),
(204, 104, 12000, "2025-01-20"),
(205, 105, 9800, "2025-02-02"),
(206, 106, 10500, "2025-02-05"),
(207, 107, 3200, "2025-02-09"),
(208, 108, 5100, "2025-02-15"),
(209, 109, 3900, "2025-02-20"),
(210, 110, 7200, "2025-03-01");