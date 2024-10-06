Before performing the analysis, I rename the columns which contains spaces or dashes in their names. I also formatted the data type of column Order_Date into DATETIME format.
For the sake of convenience, I joined table "order_detail" and table "list_of_orders" to create a view called "combined_order_data", by using following command:
CREATE VIEW combined_order_data AS
SELECT  list_of_orders.Order_ID, 
        list_of_orders.Order_Date, 
        list_of_orders.CustomerName, 
        list_of_orders.State, 
        list_of_orders.City, 
        order_detail.Amount, 
        order_detail.Profit, 
        order_detail.Quantity, 
        order_detail.Category, 
        order_detail.Sub_Category
FROM list_of_orders
JOIN order_detail ON order_detail.Order_ID = list_of_orders.Order_ID;

To access the table combined_order_data, I used the query: SELECT * FROM combined_order_data;

Query 1:   Find the number of orders, customers, cities, and states.
Solution:  SELECT COUNT(DISTINCT Order_ID) AS number_of_orders,
                  COUNT(DISTINCT CustomerName) AS number_of_customers, 
                  COUNT(DISTINCT City) AS number_of_cities,
                  COUNT(DISTINCT State) AS number_of_states
           FROM combined_order_data;
Query 2:  Find the total sales amount for each month.
Solution: SELECT 
          date_format(Order_Date, '%Y-%m') AS month, 
          SUM(Amount) AS total_sales 
          FROM combined_order_data
          GROUP BY month
          ORDER BY month;
Query 3:  Find the top 5 products with highest profit.
Solution: SELECT 
          Sub_Category,
          SUM(Profit) AS total_profit
          FROM order_detail
          GROUP BY Sub_Category
          ORDER BY total_profit DESC LIMIT 5;
Query 4:  Find the top 10 profitable states and cities.
Solution: SELECT
          State,
          City,
          SUM(Profit) AS total_profit
          FROM combined_order_data
          GROUP BY State, City
          ORDER BY total_profit DESC LIMIT 10;
Query 5:  Find whether the monthly sales target has been acheived by a category or not.
Solution: -- sales for each category in each month
          CREATE VIEW sales_by_category AS
          SELECT 
          DATE_FORMAT(Order_Date, '%b-%y') AS Month_of_Order,
          Category,
          SUM(Amount) AS total_sales
          FROM combined_order_data
          GROUP BY Month_of_Order, Category;
          -- whether sales target is acheived or not.
          SELECT 
          sales_by_category.Month_of_Order,
          sales_by_category.Category,
          total_sales,
          sales_target.Target,
          CASE
              WHEN total_sales >= Target THEN 'Target is achieved'
              ELSE 'Target NOT achieved'
          END AS Sales_Status
          FROM sales_by_category
          JOIN sales_target 
            ON sales_target.Month_of_Order = sales_by_category.Month_of_Order
            AND sales_target.Category = sales_by_category.Category  -- Ensure joining on both Month_of_Order and Category
          GROUP BY sales_by_category.Month_of_Order, sales_by_category.Category, sales_target.Target;
Query 6:  Find the customers who has placed highest orders in each state.
Solution: SELECT 
          State, 
          CustomerName, 
          COUNT(Order_ID) AS Total_Orders
          FROM list_of_orders
          GROUP BY State, CustomerName
          ORDER BY Total_Orders DESC;
Query 7:  Find the profit margin for each product category.
Solution: SELECT 
          Category, 
          SUM(Profit) / SUM(Amount) * 100 AS Profit_Margin
          FROM order_detail
          GROUP BY Category
          ORDER BY Profit_Margin DESC;
Query 8:  Find the customers who made purchases in year 2019.
Solution: SELECT
          CustomerName,
          State,
          City,
          Order_Date
          FROM combined_order_data 
          WHERE Order_Date BETWEEN '2019-01-01' AND '2019-03-31'; 
Query 9:  Find the loyal customers (who placed order every month).
Solution: SELECT 
          CustomerName, 
          COUNT(DISTINCT DATE_FORMAT(Order_Date, '%Y-%m')) AS Months_Ordered
          FROM list_of_orders
          WHERE Order_Date BETWEEN '2018-01-01' AND '2019-03-31'
          GROUP BY CustomerName
          HAVING Months_Ordered = 15;  





          
          
          
          
