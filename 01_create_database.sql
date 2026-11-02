-- Extracted from the original academic project documentation.
-- Run in SQL Server Management Studio (SSMS).
-- Creates the BankingAnalytics database and six related tables.

CREATE DATABASE BankingAnalytics;
GO

GO

USE BankingAnalytics;
GO

GO

CREATE TABLE Branches (
    branch_id INT IDENTITY(1,1) PRIMARY KEY,
    branch_name NVARCHAR(100) NOT NULL,
    city NVARCHAR(50) NOT NULL,
    region NVARCHAR(50) NOT NULL
);

CREATE TABLE Customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    gender NVARCHAR(10) NOT NULL,
    birth_date DATE NOT NULL,
    city NVARCHAR(50) NOT NULL,
    customer_segment NVARCHAR(30) NOT NULL
);

CREATE TABLE Accounts (
    account_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    account_type NVARCHAR(30) NOT NULL,
    open_date DATE NOT NULL,
    balance DECIMAL(18,2) NOT NULL,

CONSTRAINT FK_Accounts_Customers FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
CONSTRAINT FK_Accounts_Branches FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

CREATE TABLE TransactionTypes (
    transaction_type_id INT IDENTITY(1,1) PRIMARY KEY,
    transaction_type NVARCHAR(50) NOT NULL,
    category NVARCHAR(30) NOT NULL,
    fee_rate DECIMAL(5,4) NOT NULL
);

CREATE TABLE Transactions (
    transaction_id INT IDENTITY(1,1) PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_type_id INT NOT NULL,
    transaction_date DATE NOT NULL,
    amount DECIMAL(18,2) NOT NULL,
    channel NVARCHAR(30) NOT NULL,
    status NVARCHAR(20) NOT NULL,

CONSTRAINT FK_Transactions_Accounts FOREIGN KEY (account_id) REFERENCES Accounts(account_id),
CONSTRAINT FK_Transactions_TransactionTypes FOREIGN KEY (transaction_type_id) REFERENCES TransactionTypes(transaction_type_id)
);

CREATE TABLE Cards (
    card_id INT IDENTITY(1,1) PRIMARY KEY,
    account_id INT NOT NULL,
    card_type NVARCHAR(30) NOT NULL,
    issue_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    card_status NVARCHAR(20) NOT NULL,

CONSTRAINT FK_Cards_Accounts FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);
