use AulaJoin


CREATE Table TabelaA (
ID int, 
nome varchar (10),
);


CREATE Table TabelaB (
ID int, 
nome varchar (10),
);

SELECT * FROM sys.tables

INSERT INTO TabelaA (ID, nome) values (
1, 'Robo'
)
INSERT INTO TabelaA (ID, nome) values (
2, 'Macaco'
)
INSERT INTO TabelaA (ID, nome) values (
3, 'Samurai'
)
INSERT INTO TabelaA (ID, nome) values (
4, 'Monitor'
)
SELECT * FROM TabelaA

INSERT INTO TabelaB(ID, nome) values (
1, 'Espada'
)
INSERT INTO TabelaB(ID, nome) values (
2, 'Robo'
)
INSERT INTO TabelaB (ID, nome) values (
3, 'Mario'
)
INSERT INTO TabelaB(ID, nome) values (
4, 'Samurai'
)
SELECT * FROM TabelaB

SELECT * FROM TabelaA A
INNER JOIN TabelaB B
ON A.nome = B.nome

SELECT * FROM TabelaA A 
FULL OUTER JOIN TabelaB B 
ON A.nome = B.nome

SELECT * FROM TabelaA A 
LEFT JOIN TabelaB B
ON A.nome = B.nome
WHERE B.nome IS NULL


USE AdventureWorks2012

SELECT ProductID,Name, ProductNumber FROM Production.Product
WHERE Name LIKE '%CHAI%'
UNION
SELECT ProductID,Name, ProductNumber FROM Production.Product
WHERE Name LIKE '%DECAL%'
ORDER BY NAME DESC

-- PERSON.PERSON / EMAILADDRES
-- ID, LASTNAME, EMAIL

SELECT P.BusinessEntityID,P.FirstName,P.LastName,PE.EmailAddress
FROM PERSON.Person P
inner join Person.EmailAddress PE 
ON P.BusinessEntityID = PE.BusinessEntityID
INNER JOIN HumanResources.Employee HR
ON P.BusinessEntityID = HR.BusinessEntityID
WHERE HR.JobTitle LIKE '%DESI%'

-- NOME DOS PRODUTOS E AS INFORMAÇÕES DE SUBCATEGORIA 
-- LISTPRICE NAME NOME SUBCATEGORIA 
-- PRODUCT/ PRODUCSUBCATEGORY

SELECT PP.ListPrice,PP.Name, PS.Name AS SUB FROM Production.Product PP
INNER JOIN Production.ProductSubcategory PS 
on  PP.ProductSubcategoryID = PS.ProductSubcategoryID

-- TRAZER O CLIENTE ID, TIPO DE TELEFON, O ID DO TELEFONE, O NUMERO DO TELEFONE 
-- PERSONPHONE E PHONENUMBERTYPE 

SELECT * FROM Person.PersonPhone
SELECT * FROM Person.PhoneNumberType

SELECT PP.BusinessEntityID, PT.Name, PP.PhoneNumberTypeID, PP.PhoneNumber
FROM Person.PersonPhone as PP
inner join Person.PhoneNumberType as PT 
on PP.PhoneNumberTypeID = PT.PhoneNumberTypeID
INNER JOIN Person.Person AS PN 
ON PP.BusinessEntityID = PN.BusinessEntityID


-- PESSOAS Q TEM CARTAO DE CREDITO REGISTRADO 
--ID, NOME, E-MAIL
--PESSOAS Q NAO TEM CARTAO DE CREDITO REGISTRADO 
--ID, NOME, E-MAIL
--TABELAS PERSON, EMAILADDRESS, SALES.PERSONCREDITCARD

SELECT * FROM Person.Person
SELECT * FROM Sales.PersonCreditCard
SELECT * FROM Person.EmailAddress


SELECT PP.BusinessEntityID, PP.FirstName, PC.CreditCardID
FROM Person.Person PP
INNER JOIN Sales.PersonCreditCard PC 
ON PP.BusinessEntityID = PC.BusinessEntityID	

SELECT PP.BusinessEntityID, PP.FirstName, PC.CreditCardID
FROM Person.Person PP
LEFT JOIN Sales.PersonCreditCard PC 
ON PP.BusinessEntityID = PC.BusinessEntityID	
LEFT JOIN Person.EmailAddress PE
ON PP.BusinessEntityID = PE.BusinessEntityID
WHERE PC.CreditCardID IS NOT NULL
AND PE.EmailAddress IS NOT NULL



SELECT * FROM Production.Product ORDER BY ListPrice DESC

SELECT AVG(LISTPRICE) FROM Production.Product

--438,6662

SELECT ProductID, ListPrice FROM Production.Product
WHERE ListPrice> 438.6662

SELECT ProductID, ListPrice FROM Production.Product
WHERE ListPrice> (SELECT AVG(LISTPRICE) FROM Production.Product)

SELECT * FROM Person.Person

SELECT* FROM HumanResources.Employee
WHERE JobTitle = 'DESIGN ENGINEER'

SELECT*FROM Person.Person
WHERE BusinessEntityID IN (5,6,15)

SELECT FirstName
FROM Person.Person
WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM HumanResources.Employee
WHERE JobTitle = 'DESIGN ENGINEER')


