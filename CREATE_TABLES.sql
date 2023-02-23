--USE master;
--GO

--CREATE DATABASE ExpenseTracker;
--GO

USE ExpenseTracker;
GO 

-- create user table
CREATE TABLE [User] (
  [user_id] INT PRIMARY KEY IDENTITY(1, 1),
  [user_name] VARCHAR(150),
  [password] VARCHAR(150)
);
GO


-- create ExpenseLabel table 
CREATE TABLE [ExpenseLabel] (
  [expense_label_id] INT PRIMARY KEY IDENTITY(1, 1),
  [fk_user_id] INT,
  [expense_label] VARCHAR(150),
  [expense_label_limit] DECIMAL(12,2),
  [expense_label_start_date] DATE,
  [expense_label_end_date] DATE
);
GO

ALTER TABLE [ExpenseLabel] ADD FOREIGN KEY ([fk_user_id]) REFERENCES [User] ([user_id]);
GO


-- create PurchaseComapny table
CREATE TABLE [PurchaseCompany] (
  [purchase_company_id] INT PRIMARY KEY IDENTITY(1, 1),
  [fk_user_id] INT,
  [purchase_company_name] VARCHAR(150) NULL
);
GO

ALTER TABLE [PurchaseCompany] ADD FOREIGN KEY ([fk_user_id]) REFERENCES [User] ([user_id]);
GO


-- create Payment table 
CREATE TABLE [Payment] (
  [payment_id] INT PRIMARY KEY IDENTITY(1, 1),
  [fk_user_id] INT,
  [payment_description] VARCHAR(150),
  [payment_amount] DECIMAL(12,2),
  [payment_date] DATE
);
GO

ALTER TABLE [Payment] ADD FOREIGN KEY ([fk_user_id]) REFERENCES [User] ([user_id]);
GO


-- create Expense table 
CREATE TABLE [Expense] (
  [expense_id] INT PRIMARY KEY IDENTITY(1, 1),
  [fk_user_id] INT,
  [fk_purchase_company_id] INT,
  [fk_expense_label_id] INT,
  [fk_payment_id] INT
);
GO

ALTER TABLE [Expense] ADD FOREIGN KEY ([fk_user_id]) REFERENCES [User] ([user_id]);
GO

ALTER TABLE [Expense] ADD FOREIGN KEY ([fk_expense_label_id]) REFERENCES [ExpenseLabel] ([expense_label_id]);
GO

ALTER TABLE [Expense] ADD FOREIGN KEY ([fk_purchase_company_id]) REFERENCES [PurchaseCompany] ([purchase_company_id]);
GO

ALTER TABLE [Expense] ADD FOREIGN KEY ([fk_payment_id]) REFERENCES [Payment] ([payment_id]);
GO
