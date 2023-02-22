--USE master;
--GO

--CREATE DATABASE BudgetTrackingApp;
--GO

-- Use the database 
USE BudgetTrackingApp
GO

-- Create User table 
CREATE TABLE [User] (
  [user_id] INT PRIMARY KEY IDENTITY(1, 1),
  [username] VARCHAR(150),
  [password] VARCHAR(50),
  [email] VARCHAR(100),
  [full_name] VARCHAR(150)
);
GO



-- Create Budget table
CREATE TABLE [Budget] (
  [budget_id] INT PRIMARY KEY IDENTITY(1, 1),
  [fk_user_id] INT NOT NULL,
  [budget_name] VARCHAR(150),
  [budget_start_date] DATE,
  [budget_end_date] DATE,
  [budget_target_amount] DECIMAL(12,2)
);
GO

ALTER TABLE [Budget] ADD FOREIGN KEY ([fk_user_id]) REFERENCES [User] ([user_id]);
GO



-- Create Transactions table
CREATE TABLE [Transaction] (
  [transaction_id] INT PRIMARY KEY IDENTITY(1, 1),
  [fk_budget_id] INT NOT NULL,
  [transaction_date] DATE,
  [transaction_amount] DECIMAL(12,2),
  [transaction_description] VARCHAR(1000),
  [fk_income_id] INT NULL,
  [fk_expense_id] INT NULL
);
GO

-- foriegn key 
ALTER TABLE [Transaction] ADD FOREIGN KEY ([fk_budget_id]) REFERENCES [Budget] ([budget_id]);
GO



-- Create Expense table
CREATE TABLE [Expense] (
  [expense_id] INT PRIMARY KEY IDENTITY(1, 1),
  [fk_tax_implication_id] INT,
  [payment_method] VARCHAR(80),
  [expense_category_name] VARCHAR(80),
  [expense_frequency] DECIMAL(12,2)
);
GO

ALTER TABLE [Transaction] ADD FOREIGN KEY ([fk_expense_id]) REFERENCES [Expense] ([expense_id]);
GO



-- Create Income table
CREATE TABLE [Income] (
  [income_id] INT PRIMARY KEY IDENTITY(1, 1),
  [fk_tax_implication_id] INT,
  [income_source] VARCHAR(80),
  [income_category_name] VARCHAR(80),
  [income_frequency] DECIMAL(12,2)
);
GO

ALTER TABLE [Transaction] ADD FOREIGN KEY ([fk_income_id]) REFERENCES [Income] ([income_id]);
GO



-- Create Tax_Implication table
CREATE TABLE [Tax_Implication] (
  [tax_implication_id] INT PRIMARY KEY IDENTITY(1, 1),
  [tax_implication_type] VARCHAR(80)
);
GO

ALTER TABLE [Income] ADD FOREIGN KEY ([fk_tax_implication_id]) REFERENCES [Tax_Implication] ([tax_implication_id]);
GO

ALTER TABLE [Expense] ADD FOREIGN KEY ([fk_tax_implication_id]) REFERENCES [Tax_Implication] ([tax_implication_id]);
GO
