SELECT * FROM Person.Person
WHERE BusinessEntityID = 5
OR BusinessEntityID = 111
OR BusinessEntityID = 23

/*
AND - E
OR - OU
NOT - acompanhado
=
>
<
<>
>=
<=

*/
SELECT Production.Product.Weight FROM Production.Product
WHERE Weight > 500
and Weight <= 700

SELECT * FROM HumanResources.Employee 
where MaritalStatus = 'M'
and SalariedFlag = 1


SELECT * FROM HumanResources.Employee
WHERE SalariedFlag = 1
AND MaritalStatus = 'M'
AND BirthDate <= '1983/01/01'

SELECT * FROM Person.Person 
where FirstName = 'Peter'
and LastName = 'Krebs'

SELECT * FROM Person.EmailAddress
WHERE BusinessEntityID = '26'

SELECT Person.Person.FirstName, Person.Person.LastName,Person.EmailAddress.EmailAddress
FROM Person.Person,Person. EmailAddress
WHERE Person.BusinessEntityID = EmailAddress.BusinessEntityID
and Person.BusinessEntityID = 26

SELECT COUNT(*) AS 'QTDE DE PRODUTOS'FROM Production.Product

SELECT DISTINCT NAME FROM Production.Product

SELECT 
