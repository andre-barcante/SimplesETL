SELECT SOH.OrderDate, P.Name, SUM(CAST(SOD.OrderQty AS INT64)) AS OrderQty
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Sales.SalesOrderDetail AS SOD
        ON SOD.SalesOrderID = SOH.SalesOrderID
INNER JOIN Production.Product AS P
        ON P.ProductID= SOD.ProductID
GROUP BY 1, 2