SELECT SalesOrderID, COUNT(SalesOrderDetailID) AS Qtd_SalesOrderDetailID
FROM Sales.SalesOrderDetail
GROUP BY 1
HAVING COUNT(SalesOrderDetailID) > 3