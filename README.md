# Task-9-SQL-Data-Modeling
## 📌 Task Overview
This task focuses on building a **Star Schema** using SQL for analytical reporting.  
I designed a data warehouse structure with **one fact table** and **multiple dimension tables**, then loaded data from a CSV dataset and performed basic analysis queries.

---

## 🛠 Tools Used
- MySQL Server
- MySQL Workbench
- draw.io (for star schema diagram)
- CSV dataset (E-commerce sales data)

---

## 📂 Dataset
The dataset contains e-commerce sales information with the following fields:
- Order Date  
- Product Name  
- Category  
- Region  
- Quantity  
- Sales  
- Profit  

---

## ⭐ Star Schema Design

### Fact Table
**fact_sales**
- sales_id (PK)
- date_id (FK)
- product_id (FK)
- region_id (FK)
- quantity
- sales
- profit

### Dimension Tables
**dim_date**
- date_id (PK)
- order_date  

**dim_product**
- product_id (PK)
- product_name
- category  

**dim_region**
- region_id (PK)
- region_name  

The fact table is connected to all dimension tables using foreign keys, forming a proper **star schema**.

---

## 📊 Data Loading Process
1. Imported the CSV file into MySQL as a raw table.
2. Inserted distinct values into each dimension table.
3. Inserted transactional data into the fact table using joins with dimension tables.
4. Ensured referential integrity using primary and foreign keys.

---

## 📈 Analysis
Basic analytical queries were executed on the star schema, such as:
- Total sales by region
- Total profit by product category

The results of these queries were exported and saved as a CSV file.

---

## 📁 Files Included
- `task9_star_schema.sql` – SQL script for database, tables, and data insertion  
- `star_schema_diagram.png` – Visual representation of the star schema  
- `analysis_outputs.csv` – Output of analysis queries  
- `README.md` – Task explanation and documentation  

---

## ✅ Outcome
- Gained hands-on experience with **data warehouse modeling**
- Understood **fact vs dimension tables**
- Learned how star schema supports **BI and analytical queries**

---

## 👤 Author
Prepared as part of a **Data Analyst Internship – Task 9**
