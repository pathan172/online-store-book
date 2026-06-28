# 📚 Online Book Store Management System (SQL Project)

A complete SQL-based Online Book Store Management System built using PostgreSQL. This project demonstrates database design, table relationships, CRUD operations, and SQL queries for analyzing bookstore data.

## 📌 Project Overview

The Online Book Store database helps manage:

- 📖 Books
- 👥 Customers
- 🛒 Orders
- 📊 Sales and Revenue Analysis

The project contains beginner to intermediate SQL queries for learning database concepts and data analysis.

---

## 🛠️ Technologies Used

- PostgreSQL
- SQL
- CSV Import
- pgAdmin (Optional)

---

## 📂 Database Structure

### Books Table
Stores information about books.

| Column | Description |
|---------|-------------|
| book_id | Primary Key |
| title | Book Name |
| author | Author Name |
| genre | Book Category |
| published_year | Publication Year |
| price | Book Price |
| stock | Available Stock |

---

### Customers Table

Stores customer details.

| Column | Description |
|---------|-------------|
| customer_id | Primary Key |
| name | Customer Name |
| email | Email Address |
| phone | Contact Number |
| city | City |
| country | Country |

---

### Orders Table

Stores customer orders.

| Column | Description |
|---------|-------------|
| order_id | Primary Key |
| customer_id | Foreign Key |
| book_id | Foreign Key |
| order_date | Order Date |
| quantity | Quantity Ordered |
| total_amount | Total Amount |

---

## ✨ Features

- Create Database
- Create Tables
- Primary Keys
- Foreign Keys
- Import CSV Data
- Data Retrieval Queries
- Aggregate Functions
- Sorting
- Filtering
- Revenue Analysis
- Customer Analysis
- Inventory Analysis

---

## 📊 SQL Queries Included

Some example queries included in the project:

- Retrieve all Fiction books
- Books published after 1950
- Customers from Canada
- Orders placed in November 2023
- Total available stock
- Most expensive book
- Customers ordering multiple books
- Orders above a certain amount
- Available genres
- Lowest stock books
- Total revenue generated
- Advanced SQL analysis queries

---

## 🚀 How to Run

1. Clone the repository

```bash
git clone https://github.com/your-username/online-book-store-sql.git
```

2. Open PostgreSQL or pgAdmin.

3. Execute the SQL file:

```
project online book store.sql
```

4. Import the required CSV datasets into:
   - Books
   - Customers
   - Orders

5. Run the SQL queries.

---

## 📁 Project Structure

```
Online-Book-Store-SQL/
│
├── project online book store.sql
├── Books.csv
├── Customers.csv
├── Orders.csv
└── README.md
```

---

## 🎯 Learning Objectives

This project helps understand:

- Database Design
- SQL Syntax
- Joins
- Aggregate Functions
- GROUP BY
- ORDER BY
- WHERE Clause
- Foreign Keys
- Data Analysis using SQL

---

## 📸 Sample Queries

```sql
-- Find all Fiction books

SELECT *
FROM books
WHERE genre='Fiction';
```

```sql
-- Total Revenue

SELECT SUM(total_amount) AS revenue
FROM orders;
```

```sql
-- Most Expensive Book

SELECT *
FROM books
ORDER BY price DESC
LIMIT 1;
```

---

## 👨‍💻 Author

**MD Anzar Khan**

- SQL
- PostgreSQL
- Data Analysis
- Database Design

---

## ⭐ If you found this project useful, don't forget to give it a Star!
