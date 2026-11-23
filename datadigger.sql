 SHOW databases;
 CREATE DATABASE data_digger;
 USE data_digger;

 CREATE TABLE customers (
 	customersID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE, 
    address VARCHAR(200)
   );

 INSERT INTO customers (name, email, address)
 VALUES 
 ("David", "david@gmail.com", "Rajkot"),
 ("Jhon", "jhon@gmail.com", "Ahmedabad"),
 ("Alice", "alice@gmail.com", "Surat"),
 ("Ramesh", "ramesh@gmail.com", "Vadodara"),
 ("Radha", "radha@gmailcom", "Jamnagar");

 SELECT * FROM customers; 
 
 UPDATE customers SET address = "Gandhinagar" WHERE customersID = 4;

 DELETE FROM customers WHERE customersID = 2;

 SELECT * FROM customers WHERE name = "Alice";
  
 CREATE TABLE orderdetails (
  orderdetailID INT PRIMARY KEY AUTO_INCREMENT,
  orderID INT,
  productID INT,
  quantity INT,
  subtotal INT,
  FOREIGN KEY (orderID) REFERENCES orders(orderID),
  FOREIGN KEY (productID) REFERENCES products(productID)
  );

 INSERT INTO orderdetails (orderID, productID, quantity, subtotal)
 VALUES  
  (1, 1, 1, 55000),
  (1, 2, 2, 3000),
  (2, 3, 1, 15000),
  (3, 4, 3, 2400),
  (4, 5, 2, 1000);

 SELECT * FROM orderdetails WHERE orderID = 1;

 SELECT SUM(subtotal) AS totalrevenue FROM orderdetails;

 SELECT productID, SUM(quantity) AS totalquantity FROM orderdetails
 GROUP BY productID
 ORDER BY totalquantity DESC
 LIMIT 3; 

 SELECT productID, COUNT(*) AS timesold FROM orderdetails WHERE productID = 1 
 GROUP BY productID;
 
 CREATE TABLE orders (
 	orderID INT PRIMARY KEY AUTO_INCREMENT,
     customersId INT,
     orderdate DATE,
     totalamount INT,
     FOREIGN KEY (customersID) REFERENCES customers (customersID)
     );

 INSERT INTO orders (customersID, orderdate, totalamount)
 VALUES 
 (1, "2026-11-21", 2500),
 (3, "2026-11-18", 1500),
 (4, "2026-11-13", 3500),
 (1, "2026-11-08", 4500),
 (5, "2026-10-14", 1200);

 SELECT * FROM orders WHERE customersID = 1;

 UPDATE orders SET totalamount = 3000 WHERE orderID = 1;

 DELETE FROM orders WHERE orderID = 5;

 SELECT * FROM orders WHERE orderdate >= 2026-11-01 AND orderdate <= 2026-11-30;

 SELECT MAX(totalamount) AS Highest, MIN(totalamount) AS Lowest, AVG(totalamount) AS Average FROM orders;
 
  USE data_digger;
  
 CREATE TABLE products (
 productID INT PRIMARY KEY AUTO_INCREMENT,
 productname VARCHAR(100) NOT NULL,
 price INT,
 stock INT 
 );

 INSERT INTO products (productname, price, stock)
 VALUES
 ("TV", 55000, 10),   
 ("AC", 30000, 20),   
 ("Remote", 1500, 30),   
 ("Charger", 800, 15),   
 ("Chess", 500, 0);  

 SELECT * FROM products ORDER BY price DESC;

 UPDATE products SET price = 18000 WHERE productID = 2;

 DELETE FROM products WHERE stock = 0;

 SELECT * FROM products WHERE price >= 500 AND price <= 2000; 

 SELECT MAX(price) AS Expensive, MIN(price) AS Cheapest FROM products; 