SELECT SalesOrderID, OrderDate, SUM(CAST(REPLACE(CAST(TotalDue AS STRING), ',', '.') AS FLOAT64)) AS TotalDue
FROM Sales.SalesOrderHeader
WHERE TIMESTAMP(OrderDate) >= "2011-09-01" AND TIMESTAMP(OrderDate) < "2011-10-01"
GROUP BY 1, 2
HAVING TotalDue > 1000