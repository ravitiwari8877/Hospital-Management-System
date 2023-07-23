CREATE DATABASE COMP;
USE COMP;

-- Branch Table
CREATE TABLE Branch (
  branch_id INT,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date date,
  CONSTRAINT BranchPK PRIMARY KEY (branch_id,mgr_id)
);

-- Employee Table
CREATE TABLE Employee (
  emp_id INT,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_date Date,
  sex varchar (2),
  salary int,
  super_id int,
  branch_id INT,
  CONSTRAINT EmployeesPK PRIMARY KEY (emp_id,super_id),
  FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);


-- Client Table
CREATE TABLE Client (
  client_id INT,
  Client_name VARCHAR(40),
  branch_id INT,
  CONSTRAINT ClientPK PRIMARY KEY (client_id),
  FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

-- Works with Table
CREATE TABLE Works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  CONSTRAINT Works_with PRIMARY KEY (emp_id,client_id)
  );
  
  
  -- Branch Supplier Table
CREATE TABLE Branch_Supplier (
  branch_id INT,
  supplier_name varchar (40),
  supply_types varchar(30),
  CONSTRAINT Branch_Supplier PRIMARY KEY (branch_id,supplier_name)
  );

-- inserting data into the Branch 
INSERT INTO Branch (branch_id, branch_name, mgr_id, mgr_start_date)
VALUES
  (1, 'Corporate', 100, '2006-02-09'),
  (2, 'Scranton', 102, '1992-04-06'),
  (3, 'Stamford', 106, '1998-02-13');
  
  -- inserting data into the Employee 
  INSERT INTO Employee (emp_id, first_name, last_name, birth_date, sex, salary, super_id, branch_id)
VALUES
  (100, 'David', 'Wallace', '1967-11-17', 'M', 250000.00, 102, 1),
  (101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000.00, 100, 1),
  (102, 'Michael', 'Scott', '1964-03-15', 'M', 75000.00, 100, 2),
  (103, 'Angela', 'Martin', '1971-06-25', 'F', 63000.00, 102, 2),
  (104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000.00, 102, 2),
  (105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000.00, 102, 2),
  (106, 'Josh', 'Porter', '1969-09-05', 'M', 78000.00, 100, 3),
  (107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000.00, 106, 3),
  (108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000.00, 106, 3);
  
   -- inserting data into the Client 
  INSERT INTO Client (client_id, client_name, branch_id)
VALUES
  (400, 'Dunmore Highschool', 2),
  (401, 'Lackawana Country', 2),
  (402, 'FedEx', 3),
  (403, 'John Daly Law, LLC', 3),
  (404, 'Scranton Whitepages', 2),
  (405, 'Times Newspaper', 3),
  (406, 'FedEx', 2);
  
  -- inserting data into the Works_with 
  INSERT INTO Works_with (emp_id, client_id, total_sales)
VALUES
  (105, 400, 55000.00),
  (102, 401, 267000.00),
  (108, 402, 22500.00),
  (107, 403, 5000.00),
  (108, 403, 12000.00),
  (105, 404, 33000.00),
  (107, 405, 26000.00),
  (102, 406, 15000.00),
  (105, 406, 130000.00);
  
   -- inserting data into the Branch_Supplier 
  INSERT INTO Branch_Supplier (branch_id, supplier_name, supply_types)
VALUES
  (2, 'Hammer Mill', 'Paper'),
  (2, 'Uni-ball', 'Writing Utensils'),
  (3, 'Patriot Paper', 'Paper'),
  (2, 'J.T. Forms & Labels', 'Custom Forms'),
  (3, 'Uni-ball', 'Writing Utensils'),
  (3, 'Hammer Mill', 'Paper'),
  (3, 'Stamford Lables', 'Custom Forms');
  
  
  -- 1- Retrieve the names of all emp in the Corporate Branch---- 
  Select first_name, last_name from employee where branch_id = 1;
  
  -- 2- Retrieve the client details associated with the 'Scranton' branch ;
SELECT C.client_name
FROM Client AS C
Join branch AS B
ON C.branch_id = B.branch_id
where B.branch_name = 'Scranton' ;

  
  