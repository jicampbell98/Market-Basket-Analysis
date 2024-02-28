CREATE DATABASE market_database;
USE market_database;

CREATE TABLE basket_data (
    TransactionNumber INT AUTO_INCREMENT,
    BillNo INT,
    Itemname VARCHAR(255),
    Quantity INT,
    TransactionDate TIMESTAMP,
    Price DECIMAL(10, 2),
    CustomerID INT,
    Country VARCHAR(255),
    PRIMARY KEY (TransactionNumber)
);

LOAD DATA LOCAL INFILE "C:\Users\Juan Ignacio\OneDrive\Documents\Ideas\Market Basket Analysis\Assignment-1_Data.csv" INTO TABLE basket_data
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(TransactionNumber, BillNo, Itemname, Quantity, @datevar, Price, CustomerID, Country)
SET TransactionDate = STR_TO_DATE(@datevar,'%m/%d/%Y %H:%i');

# Check that the first rows look good
SELECT * FROM basket_data LIMIT 10;

# Check for Missing Values
SELECT COUNT(*) FROM basket_data WHERE TransactionNumber IS NULL;  # NO NULL VALUES
SELECT COUNT(*) FROM basket_data WHERE BillNo IS NULL;  # NO NULL VALUES
SELECT COUNT(*) FROM basket_data WHERE Itemname IS NULL;  # NO NULL VALUES
SELECT COUNT(*) FROM basket_data WHERE Quantity IS NULL;  # NO NULL VALUES
SELECT COUNT(*) FROM basket_data WHERE TransactionDate IS NULL;  # 4654 NULL VALUES
SELECT COUNT(*) FROM basket_data WHERE Price IS NULL;  # NO NULL VALUES
SELECT COUNT(*) FROM basket_data WHERE CustomerID IS NULL;  # NO NULL VALUES
SELECT COUNT(*) FROM basket_data WHERE Country IS NULL;  # NO NULL VALUES

# Remove Missing Values
DELETE FROM basket_data WHERE TransactionDate IS NULL;

# Check again
SELECT COUNT(*) FROM basket_data WHERE TransactionDate IS NULL;  # NO NULL VALUES