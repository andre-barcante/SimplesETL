SELECT
	IF(MiddleName IS NULL,
		CONCAT(FirstName, ' ', LastName),
		CONCAT(FirstName, ' ', MiddleName, ' ', LastName)
	) AS FullName,
    COUNT(SOH.SalesOrderID) AS Orders
FROM Person.Person AS P
INNER JOIN Sales.Customer AS C ON CAST(C.PersonID AS INT64) = CAST(P.BusinessEntityID AS INT64)
INNER JOIN Sales.SalesOrderHeader AS SOH ON SOH.CustomerID = C.CustomerID
GROUP BY 1
ORDER BY 2 DESC