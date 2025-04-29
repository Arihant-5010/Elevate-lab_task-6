use intern_task;

CREATE TABLE sales (
    Transaction_ID INT PRIMARY KEY,         
    Date DATE,                              
    Product_Category VARCHAR(255),          
    Product_Name VARCHAR(255),              
    Units_Sold INT,                       
    Unit_Price DECIMAL(10, 2),              
    Total_Revenue DECIMAL(10, 2),           
    Region VARCHAR(255),                    
    Payment_Method VARCHAR(255)             
);
/*Total Revenue by Year*/
SELECT
    EXTRACT(YEAR FROM Date) AS Year,            
    SUM(Total_Revenue) AS Revenue         
FROM
    sales
GROUP BY
    EXTRACT(YEAR FROM Date)                    
ORDER BY
    Year;
    
/*Total Units Sold by Product Category*/
SELECT
    Product_Category,                           
    SUM(Units_Sold) AS Total_Units_Sold         
FROM
    sales
GROUP BY
    Product_Category
ORDER BY
    Total_Units_Sold DESC;  
    
/*Average Unit Price by Product*/
SELECT
    Product_Name,                              
    AVG(Unit_Price) AS Average_Unit_Price       
FROM
    sales
GROUP BY
    Product_Name
ORDER BY
    Average_Unit_Price DESC;   
    
/*Revenue by Region*/
    SELECT
    Region,                                    
    SUM(Total_Revenue) AS Total_Revenue         
FROM
    sales
GROUP BY
    Region
ORDER BY
    Total_Revenue DESC;  
    
    /*Total Revenue and Units Sold by Payment Method*/
    SELECT
    Payment_Method,                            
    SUM(Total_Revenue) AS Total_Revenue,        
    SUM(Units_Sold) AS Total_Units_Sold       
FROM
    sales
GROUP BY
    Payment_Method
ORDER BY
    Total_Revenue DESC;    
    
/*Top 5 Products by Total Revenue*/
SELECT
    Product_Name,                              
    SUM(Total_Revenue) AS Total_Revenue         
FROM
    sales
GROUP BY
    Product_Name
ORDER BY
    Total_Revenue DESC                           
LIMIT 5; 

/*Revenue by Product Category in 2024*/
SELECT
    Product_Category,                           
    SUM(Total_Revenue) AS Total_Revenue         
FROM
    sales
WHERE
    EXTRACT(YEAR FROM Date) = 2024             
GROUP BY
    Product_Category
ORDER BY
    Total_Revenue DESC;
    
    /* Revenue for a Specific Product*/
    SELECT
    Product_Name,                              
    SUM(Total_Revenue) AS Total_Revenue         
FROM
    sales
WHERE
    Product_Name =  'iPhone 14 Pro'              
GROUP BY
    Product_Name;
    
    /* Units Sold and Revenue by Product Category*/
    SELECT
    Product_Category,                           
    SUM(Units_Sold) AS Total_Units_Sold,         -
    SUM(Total_Revenue) AS Total_Revenue         
FROM
    sales
GROUP BY
    Product_Category
ORDER BY
    Total_Revenue DESC;      
    
    /*Revenue and Units Sold by Date*/
    SELECT
    Date,                                      
    SUM(Total_Revenue) AS Total_Revenue,        
    SUM(Units_Sold) AS Total_Units_Sold         
FROM
    sales
GROUP BY
    Date
ORDER BY
    Date;                                      


/* Most Common Payment Methods*/
SELECT 
    Payment_Method,
    COUNT(*) AS Usage_Count
FROM sales
GROUP BY Payment_Method
ORDER BY Usage_Count DESC;

/*Highest Revenue Transaction*/
SELECT *
FROM sales
ORDER BY Total_Revenue DESC
LIMIT 1;





                                       






