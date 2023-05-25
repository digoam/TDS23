USE AdventureWorks2012

-- QUANTOS PRODUTOS VERMELHOS TEM PRECO ENTRE 500 E 1000 USD 

SELECT COUNT(*) AS 'PRODUTOS VERMELHOS' FROM Production.Product
WHERE COLOR ='RED'
AND ListPrice BETWEEN 500 AND 1000

-- PRODUTOS QUE TEM ESSA SEQ DE CARACTER NO NOME ROAD 
SELECT * FROM Production.Product
WHERE NAME LIKE '%ROAD%'

SELECT TOP 10 * FROM SaleS.SalesOrderDetail ORDER BY LineTotal ASC
SELECT * FROM SALES.SalesOrderDetail

SELECT TOP 10 MAX(LINETOTAL)
AS TOTALVENDAS FROM Sales.SalesOrderDetail

SELECT FirstName, COUNT (FirstName) AS QTDE FROM Person.Person
GROUP BY FirstName

SELECT SpecialOfferID, sum (UnitPrice) AS 'TOTAL VENDAS' FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID
ORDER BY SUM (UnitPrice) DESC


select ProductID, COUNT(ProductID) AS 'Qtde produtos ate hoje' from Sales.SalesOrderDetail 
group by ProductID




SELECT ProductID, AVG(OrderQty) FROM Sales.SalesOrderDetail
GROUP BY ProductID



SELECT TOP 10 ProductID, SUM(LineTotal)FROM Sales.SalesOrderDetail
group by ProductID
order by sum(linetotal)


SELECT ProductID, COUNT(ProductID) as Qtd,avg (OrderQty) AS MEDIA FROM Sales.SalesOrderDetail