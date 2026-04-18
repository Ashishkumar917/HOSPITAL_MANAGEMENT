# 🏥 Hospital Management System (SQL Project)

## 📌 Overview

This project is a **Hospital Management System database** built using **Microsoft SQL Server**. It focuses on storing, managing, and analyzing hospital data such as patients, doctors, departments, and medical expenses using SQL queries.

The project demonstrates real-world data analysis using **aggregations, window functions, and CTEs** to generate meaningful insights from hospital datasets.

---

## 🛠️ Tech Stack

* **Database:** Microsoft SQL Server (SQL Express)
* **Language:** SQL (T-SQL)
* **Tool:** SQL Server Management Studio (SSMS)

---

## 📂 Database Structure

Main table used in the project:

### 📋 `Hospital_Data`

Contains:

* Hospital_Name
* Department
* Patients_Count
* Doctors_Count
* Admission_Date
* Discharge_Date
* Medical_Expenses

---

## 🚀 Key SQL Operations

The project includes the following queries:

### 1️⃣ Total Number of Patients

* Calculates total patients across hospitals using `SUM()` and `GROUP BY`

### 2️⃣ Average Number of Doctors per Hospital

* Uses `AVG()` to find average doctor availability

### 3️⃣ Top Departments with Highest Patients

* Uses **CTE + DENSE_RANK()** (Window Function)
* Identifies top-performing departments in each hospital

### 4️⃣ Hospital with Maximum Medical Expenses

* Finds hospital with highest total expenses

### 5️⃣ Daily Average Medical Expenses

* Uses:

  * `DATEDIFF()` for total days
  * `SUM()` for total expenses
  * CTE for structured calculation
* Outputs **per-day expense per hospital**

---

## 📊 Sample Output

Example insight generated:

| Hospital Name   | Per Day Expense |
| --------------- | --------------- |
| Fortis Care     | 3837.24         |
| City Hospital   | 3824.05         |
| Sunrise Medical | 3758.89         |

---

## ▶️ How to Run

1. Open **SQL Server Management Studio (SSMS)**
2. Open the `.sql` file from this repository
3. Execute the script step-by-step:

   * Create Database
   * Use Database
   * Run queries
4. View results in the output panel

---

## 🎯 Learning Outcomes

* SQL Aggregation Functions (`SUM`, `AVG`)
* Window Functions (`DENSE_RANK`)
* Common Table Expressions (CTE)
* Data Analysis using SQL
* Real-world dataset handling

---

## 📌 Future Improvements

* Add more tables (Patients, Doctors, Billing)
* Build frontend (Web/App)
* Integrate dashboards (Power BI)

---

## 👨‍💻 Author

**Ashish Kumar Sahoo**

---

⭐ If you like this project, don't forget to give it a star!
