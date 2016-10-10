
CREATE PROCEDURE dbo.GetNameNumberEmail 
@LastName nvarchar(30), 
@PhoneNumber nvarchar(20), 
@Name nvarchar(20)
AS

SELECT 
per.FirstName, 
per.LastName, 
perpho.PhoneNumber, 
perphotyp.Name, 
email.EmailAddress

FROM Person.Person AS per
INNER JOIN Person.PersonPhone AS perpho 
ON per.BusinessEntityID = perpho.BusinessEntityID 

INNER JOIN Person.PhoneNumberType AS perphotyp 
ON perpho.PhoneNumberTypeID = perphotyp.PhoneNumberTypeID

INNER JOIN Person.EmailAddress AS email
ON per.BusinessEntityID = email.BusinessEntityID
 
WHERE per.LastName LIKE '' + ISNULL(@LastName, per.LastName) + '%'
AND perphotyp.Name LIKE '%' + ISNULL(@Name, perphotyp.Name) + '%'
AND perpho.PhoneNumber LIKE '%' + ISNULL(@PhoneNumber, perpho.PhoneNumber) + '%'





EXEC dbo.GetNameNumberEmail @LastName = 'A', @PhoneNumber = '3', @Name = 'Home'



SELECT* FROM Person.Person
SELECT* FROM Person.PersonPhone
SELECT* FROM Person.PhoneNumberType
SELECT* FROM Person.EmailAddress