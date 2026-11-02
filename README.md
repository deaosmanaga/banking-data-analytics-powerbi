# Banking Data Analytics | SQL Server & Power BI

A university project where I built a **banking transaction analysis dashboard** using SQL Server and Power BI. The goal was to explore transaction activity, banking fee revenue, and customer channel usage.

## Tools
**SQL Server (T-SQL)** · **Power BI** · **Power Query** · **DAX**

## What I built
- A relational SQL Server database with six connected tables: `Customers`, `Accounts`, `Transactions`, `TransactionTypes`, `Branches`, and `Cards`.
- Synthetic sample data for **100 customers, 150 accounts, 120 cards, and 1,000 transactions**.
- Power Query transformations for customer names, dates, and transaction amount categories.
- DAX measures for transaction count, transaction amount, and fee revenue.
- An interactive Power BI dashboard showing monthly trends, banking channels, KPIs, and filters.

## Dashboard preview
![Banking analytics dashboard](screenshots/banking-dashboard-medium-filter.png)

*Preview with the **Medium** transaction amount filter selected.*

## Project files
- [`sql/`](sql/) — database creation and sample-data scripts
- [`powerbi/Banking_Analytics.pbix`](powerbi/Banking_Analytics.pbix) — Power BI report

## How to run
1. Run `sql/01_create_database.sql` in SQL Server Management Studio.
2. Run `sql/02_insert_sample_data.sql` **once** on the new database.
3. Open the `.pbix` file in Power BI Desktop. To refresh, update its SQL Server connection if needed.

**Note:** All data is synthetic. The SQL scripts are based on my original project documentation and have not yet been independently executed in a clean SQL Server environment.
