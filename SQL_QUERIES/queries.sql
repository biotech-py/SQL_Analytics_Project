SELECT COUNT(*) AS Total_Records
FROM Superstore; 
SELECT SUM(Sales) AS Total_Revenue
FROM Superstore;
SELECT SUM(Profit) AS Total_Profit
FROM Superstore;
SELECT COUNT(DISTINCT "Order ID") AS Unique_Orders
FROM Superstore;

SELECT
    Category,
    ROUND(SUM(Sales),2) AS Total_Revenue
FROM Superstore
GROUP BY Category
ORDER BY Total_Revenue DESC;

SELECT
    Category,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM Superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

SELECT
    Category,
    ROUND(
        (SUM(Profit) * 100.0 / SUM(Sales)),
        2
    ) AS Profit_Margin_Percent
FROM Superstore
GROUP BY Category
ORDER BY Profit_Margin_Percent DESC;

SELECT
    Region,
    ROUND(SUM(Sales),2) AS Total_Revenue
FROM Superstore
GROUP BY Region
ORDER BY Total_Revenue DESC;

SELECT
    Region,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM Superstore
GROUP BY Region
ORDER BY Total_Profit DESC;

SELECT
    State,
    ROUND(SUM(Sales),2) AS Revenue
FROM Superstore
GROUP BY State
ORDER BY Revenue DESC
LIMIT 10;

SELECT
    "Customer Name",
    ROUND(SUM(Sales),2) AS Revenue
FROM Superstore
GROUP BY "Customer Name"
ORDER BY Revenue DESC
LIMIT 10;

SELECT
    "Product Name",
    ROUND(SUM(Sales),2) AS Revenue
FROM Superstore
GROUP BY "Product Name"
ORDER BY Revenue DESC
LIMIT 10;

SELECT
    "Customer Name",
    ROUND(SUM(Sales),2) AS Revenue,

    CASE
        WHEN SUM(Sales) >= 10000 THEN 'High Value'
        WHEN SUM(Sales) >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Segment

FROM Superstore

GROUP BY "Customer Name"

ORDER BY Revenue DESC;

SELECT
    Region,

    ROUND(
        SUM(Sales) /
        COUNT(DISTINCT "Order ID"),
        2
    ) AS Avg_Order_Value

FROM Superstore

GROUP BY Region

ORDER BY Avg_Order_Value DESC;

SELECT
    "Product Name",

    ROUND(SUM(Profit),2) AS Total_Profit

FROM Superstore

GROUP BY "Product Name"

ORDER BY Total_Profit DESC

LIMIT 10;

SELECT
    "Product Name",

    ROUND(SUM(Profit),2) AS Total_Profit

FROM Superstore

GROUP BY "Product Name"

HAVING SUM(Profit) < 0

ORDER BY Total_Profit;

SELECT
    "Product Name",

    ROUND(AVG(Discount)*100,2) AS Avg_Discount

FROM Superstore

GROUP BY "Product Name"

ORDER BY Avg_Discount DESC

LIMIT 10;

SELECT
    "Customer Name",
    Revenue

FROM
(
    SELECT
        "Customer Name",
        SUM(Sales) AS Revenue
    FROM Superstore
    GROUP BY "Customer Name"
)

WHERE Revenue >
(
    SELECT AVG(Customer_Revenue)

    FROM
    (
        SELECT
            SUM(Sales) AS Customer_Revenue

        FROM Superstore

        GROUP BY "Customer Name"
    )
)

ORDER BY Revenue DESC;