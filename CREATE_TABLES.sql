--USE master;
--GO

--CREATE DATABASE BudgetTrackingAppFinal;
--GO

-- Use the database 
USE BudgetTrackingAppFinal
GO


CREATE TABLE [User] (
  [user_id] INT PRIMARY KEY IDENTITY(1, 1),
  [username] VARCHAR(150),
  [password] VARCHAR(50),
  [email] VARCHAR(100),
  [full_name] VARCHAR(150)
)
GO


CREATE TABLE [Budget] (
  [budget_id] INT PRIMARY KEY IDENTITY(1, 1),
  [fk_user_id] INT NOT NULL,
  [budget_name] VARCHAR(150),
  --[budget_start_date] DATE NULL,
  --[budget_end_date] DATE NULL,
  [budget_target_amount] DECIMAL(12,2) DEFAULT NULL,
  [budget_trigger_reference] VARCHAR(150)
)
GO

ALTER TABLE [Budget] ADD FOREIGN KEY ([fk_user_id]) REFERENCES [User] ([user_id])
GO


CREATE TABLE [Transaction] (
  [transaction_id] INT PRIMARY KEY IDENTITY(1, 1),
  [fk_budget_id] INT NOT NULL,
  [transaction_date] DATE,
  [transaction_amount] DECIMAL(12,2),
  [transaction_reference] VARCHAR(150),
  [transaction_3rdparty] INT
)
GO

ALTER TABLE [Transaction] ADD FOREIGN KEY ([fk_budget_id]) REFERENCES [Budget] ([budget_id])
GO



CREATE TABLE [Expense_Transaction] (
  [expense_id] INT PRIMARY KEY IDENTITY(1, 1),
  [fk_transaction_id] INT,
  [expense_recipient] VARCHAR(150)
)
GO

ALTER TABLE [Expense_Transaction] ADD FOREIGN KEY ([fk_transaction_id]) REFERENCES [Transaction] ([transaction_id])
GO



CREATE TABLE [Income_Transaction] (
  [income_id] INT PRIMARY KEY IDENTITY(1, 1),
  [fk_transaction_id] INT,
  [income_source] VARCHAR(80)
)
GO

ALTER TABLE [Income_Transaction] ADD FOREIGN KEY ([fk_transaction_id]) REFERENCES [Transaction] ([transaction_id])
GO


