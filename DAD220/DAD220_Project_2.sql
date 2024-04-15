USE QuantigrationUpdates;

-- Retrieve number of returns by state --

SELECT Customers.State,
       COUNT(RMA.RMAID) AS Returns
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN RMA ON Orders.OrderID = RMA.OrderID
GROUP BY Customers.State
ORDER BY Returns DESC;

-- Retrieve percentage of total returns by product type --

SELECT Product_Type,
       ROUND((COUNT(RMAID) / total.total_rmas) * 100, 3) AS Pct_Returns
FROM
    (SELECT Orders.Description AS Product_Type,
            RMAID
     FROM RMA
     INNER JOIN Orders ON Orders.OrderID = RMA.OrderID) AS RMA_Products
CROSS JOIN
    (SELECT COUNT(*) AS total_rmas
     FROM RMA) AS total
GROUP BY Product_Type,
         total.total_rmas
ORDER BY Pct_Returns DESC;