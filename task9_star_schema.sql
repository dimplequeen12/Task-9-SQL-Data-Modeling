CREATE DATABASE star_schema_db;

USE star_schema_db;

CREATE TABLE dim_date (
    date_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE
);

SHOW TABLES;

CREATE TABLE dim_product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(100)
);

SHOW TABLES;

CREATE TABLE dim_region (
    region_id INT AUTO_INCREMENT PRIMARY KEY,
    region_name VARCHAR(100)
);

SHOW TABLES;

CREATE TABLE fact_sales (
    sales_id INT AUTO_INCREMENT PRIMARY KEY,

    date_id INT,
    product_id INT,
    region_id INT,

    quantity INT,
    sales DECIMAL(10,2),
    profit DECIMAL(10,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (region_id) REFERENCES dim_region(region_id)
);

SHOW TABLES;

INSERT INTO dim_date (order_date)
SELECT DISTINCT `Order Date`
FROM your_raw_table;

SHOW TABLES;

INSERT INTO dim_date (order_date)
SELECT DISTINCT `Order Date`
FROM `ecommerce_sales_data (2)`;

SELECT * FROM dim_date;

INSERT INTO dim_product (product_name, category)
SELECT DISTINCT `Product Name`, `Category`
FROM `ecommerce_sales_data (2)`;

SELECT * FROM dim_product;

INSERT INTO dim_region (region_name)
SELECT DISTINCT `Region`
FROM `ecommerce_sales_data (2)`;

SELECT * FROM dim_region;

INSERT INTO fact_sales (
    date_id,
    product_id,
    region_id,
    quantity,
    sales,
    profit
)
SELECT
    d.date_id,
    p.product_id,
    r.region_id,
    e.Quantity,
    e.Sales,
    e.Profit
FROM `ecommerce_sales_data (2)` e
JOIN dim_date d
    ON e.`Order Date` = d.order_date
JOIN dim_product p
    ON e.`Product Name` = p.product_name
   AND e.`Category` = p.category
JOIN dim_region r
    ON e.`Region` = r.region_name;
    
    SELECT * FROM fact_sales LIMIT 10;
    
    SELECT COUNT(*) FROM `ecommerce_sales_data (2)`;
SELECT COUNT(*) FROM fact_sales;



















