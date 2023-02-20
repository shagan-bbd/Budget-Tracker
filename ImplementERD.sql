USE master;
GO

CREATE Database BudgetTrackerDB;
GO

USE BudgetTrackerDB;
GO

CREATE TABLE [Users] (
  [user_id] INT PRIMARY KEY IDENTITY(1, 1),
  [username] VARCHAR(150),
  [password] VARCHAR(50),
  [email] VARCHAR(100),
  [full_name] VARCHAR(150)
)
GO

CREATE TABLE [Budget] (
  [budget_id] INT PRIMARY KEY IDENTITY(1, 1),
  [user_id] INT NOT NULL,
  [budget_name] VARCHAR(150),
  [budget_start_date] DATE,
  [budget_end_date] DATE,
  [budget_target_amount] DECIMAL(6,2)
)
GO

CREATE TABLE [Transactions] (
  [transaction_id] INT PRIMARY KEY IDENTITY(1, 1),
  [user_id] INT NOT NULL,
  [budget_id] INT NOT NULL,
  [transaction_date] DATE,
  [transaction_amount] DECIMAL(6,2),
  [transaction_description] VARCHAR(MAX),
  [transaction_type] VARCHAR(50)
)
GO

CREATE TABLE [Expense_Categories] (
  [expense_category_id] INT PRIMARY KEY IDENTITY(1, 1),
  [user_id] INT NOT NULL,
  [expense_category_name] VARCHAR(80)
)
GO

CREATE TABLE [Expenses] (
  [expense_id] INT PRIMARY KEY IDENTITY(1, 1),
  [user_id] INT NOT NULL,
  [budget_id] INT NOT NULL,
  [expense_category_id] INT,
  [expense_subcategory] VARCHAR(80),
  [payment_method] VARCHAR(80),
  [expense_date] DATE,
  [expense_amount] DECIMAL(6,2),
  [expense_description] VARCHAR(MAX),
  [tags] VARCHAR(80)
)
GO

CREATE TABLE [Income_Category] (
  [income_type_id] INT PRIMARY KEY IDENTITY(1, 1),
  [user_id] INT NOT NULL,
  [income_type_name] VARCHAR(80),
  [income_type_category] VARCHAR(80),
  [income_source] VARCHAR(80),
  [income_frequency] INT,
  [tax_implications] VARCHAR(MAX)
)
GO

CREATE TABLE [Income] (
  [income_id] INT PRIMARY KEY IDENTITY(1, 1),
  [user_id] INT NOT NULL,
  [budget_id] INT NOT NULL,
  [income_type_id] INT NOT NULL,
  [income_date] DATE,
  [income_amount] DECIMAL(6,2),
  [income_description] VARCHAR(MAX)
)
GO

ALTER TABLE [Budget] ADD FOREIGN KEY ([user_id]) REFERENCES [Users] ([user_id])
GO

ALTER TABLE [Income] ADD FOREIGN KEY ([user_id]) REFERENCES [Users] ([user_id])
GO

ALTER TABLE [Income] ADD FOREIGN KEY ([budget_id]) REFERENCES [Budget] ([budget_id])
GO

ALTER TABLE [Income] ADD FOREIGN KEY ([income_type_id]) REFERENCES [Income_Category] ([income_type_id])
GO

ALTER TABLE [Income_Category] ADD FOREIGN KEY ([user_id]) REFERENCES [Users] ([user_id])
GO

ALTER TABLE [Expenses] ADD FOREIGN KEY ([expense_category_id]) REFERENCES [Expense_Categories] ([expense_category_id])
GO

ALTER TABLE [Expenses] ADD FOREIGN KEY ([user_id]) REFERENCES [Users] ([user_id])
GO

ALTER TABLE [Expense_Categories] ADD FOREIGN KEY ([user_id]) REFERENCES [Users] ([user_id])
GO

ALTER TABLE [Expenses] ADD FOREIGN KEY ([budget_id]) REFERENCES [Budget] ([budget_id])
GO

ALTER TABLE [Transactions] ADD FOREIGN KEY ([user_id]) REFERENCES [Users] ([user_id])
GO

ALTER TABLE [Transactions] ADD FOREIGN KEY ([budget_id]) REFERENCES [Budget] ([budget_id])
GO


