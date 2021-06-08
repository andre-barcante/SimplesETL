SELECT Name
FROM (
	SELECT Name, MAX(OrderQty) AS OrderQty
	FROM (
		SELECT
			LAST_VALUE(Name)
			OVER(
			PARTITION BY DaysToManufacture
			ORDER BY OrderQty
			ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
			) AS Name,
			OrderQty
		FROM(
			SELECT P.Name,
				P.DaysToManufacture,
				SUM(CAST(SOD.OrderQty AS INT64)) AS OrderQty
			FROM Sales.SalesOrderDetail AS SOD
			INNER JOIN Sales.SpecialOfferProduct AS SOP
				ON SOP.SpecialOfferID = SOD.SpecialOfferID
				AND SOP.ProductID = SOD.ProductID
			INNER JOIN Production.Product AS P
				ON P.ProductID = SOD.ProductID
			GROUP BY 1, 2
		)
	)
	GROUP BY 1
	ORDER BY 2 DESC
)
LIMIT 3