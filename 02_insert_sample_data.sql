-- Extracted from the original academic project documentation.
-- Run AFTER 01_create_database.sql, against the BankingAnalytics database.
-- Synthetic demonstration data; not real bank/customer records.
-- Run ONCE against a newly created empty database to avoid duplicates.

USE BankingAnalytics;

INSERT INTO Branches (branch_name, city, region)
VALUES
('Central Branch', 'Tirana', 'Central'),
('North Branch', 'Shkoder', 'North'),
('South Branch', 'Vlore', 'South'),
('East Branch', 'Korce', 'East'),
('West Branch', 'Durres', 'West'),
('Business Branch', 'Tirana', 'Central'),
('Digital Branch', 'Tirana', 'Central'),
('Premium Branch', 'Fier', 'South');

GO

DECLARE @i INT = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Customers (
        first_name,
        last_name,
        gender,
        birth_date,
        city,
        customer_segment
    )
    VALUES (
        CONCAT('CustomerName', @i),
        CONCAT('CustomerSurname', @i),
        CASE 
            WHEN @i % 2 = 0 THEN 'Female'
            ELSE 'Male'
        END,
        DATEADD(YEAR, - (18 + (@i % 45)), GETDATE()),
        CASE 
            WHEN @i % 6 = 0 THEN 'Tirana'
            WHEN @i % 6 = 1 THEN 'Durres'
            WHEN @i % 6 = 2 THEN 'Shkoder'
            WHEN @i % 6 = 3 THEN 'Vlore'
            WHEN @i % 6 = 4 THEN 'Korce'
            ELSE 'Fier'
        END,
        CASE 
            WHEN @i % 4 = 0 THEN 'VIP'
            WHEN @i % 4 = 1 THEN 'Standard'
            WHEN @i % 4 = 2 THEN 'Premium'
            ELSE 'Business'
        END
    );
    SET @i = @i + 1;
END;

GO

INSERT INTO TransactionTypes (
    transaction_type,
    category,
    fee_rate
)
VALUES
('Deposit', 'Credit', 0.005),
('Withdrawal', 'Debit', 0.010),
('Transfer', 'Debit', 0.015),
('Online Payment', 'Debit', 0.020),
('ATM Withdrawal', 'Debit', 0.012),
('Salary Payment', 'Credit', 0.003),
('International Transfer', 'Debit', 0.025),
('Bill Payment', 'Debit', 0.008);

GO

DECLARE @u INT = 1;

WHILE @u <= 150
BEGIN
    INSERT INTO Accounts (
        customer_id,
        branch_id,
        account_type,
        open_date,
        balance
    )
    VALUES (
        ((@u - 1) % 100) + 1,
        ((@u - 1) % 8) + 1,

        CASE
            WHEN @u % 3 = 0 THEN 'Savings'
            WHEN @u % 3 = 1 THEN 'Checking'
            ELSE 'Business'
        END,
        DATEADD(DAY, -(@u * 10), GETDATE()),
        1000 + (@u * 250)
    );
    SET @u = @u + 1;
END;

GO

DECLARE @c INT = 1;

WHILE @c <= 120
BEGIN
    INSERT INTO Cards (
        account_id,
        card_type,
        issue_date,
        expiry_date,
        card_status
    )
    VALUES (
        ((@c - 1) % 150) + 1,
        CASE
            WHEN @c % 3 = 0 THEN 'Visa'
            WHEN @c % 3 = 1 THEN 'MasterCard'
            ELSE 'Business Card'
        END,
        DATEADD(DAY, -(@c * 15), GETDATE()),
        DATEADD(YEAR, 4, DATEADD(DAY, -(@c * 15), GETDATE())),
        CASE
            WHEN @c % 5 = 0 THEN 'Blocked'
            ELSE 'Active'
        END
    );
    SET @c = @c + 1;
END;

GO

DECLARE @t INT = 1;

WHILE @t <= 1000
BEGIN
    INSERT INTO Transactions (
        account_id,
        transaction_type_id,
        transaction_date,
        amount,
        channel,
        status
    )
    VALUES (
        ((@t - 1) % 150) + 1,
        ((@t - 1) % 8) + 1,
        DATEADD(DAY, -(@t % 365), GETDATE()),
        50 + (RAND(CHECKSUM(NEWID())) * 5000),
        CASE
            WHEN @t % 4 = 0 THEN 'ATM'
            WHEN @t % 4 = 1 THEN 'Mobile App'
            WHEN @t % 4 = 2 THEN 'Online Banking'
            ELSE 'Branch'
        END,

        CASE
            WHEN @t % 10 = 0 THEN 'Failed'
            WHEN @t % 15 = 0 THEN 'Pending'
            ELSE 'Completed'
        END
    );
    SET @t = @t + 1;
END;
