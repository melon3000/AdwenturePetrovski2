--funktsioonid fail nr 32
use AdventureWorksDW2019

--Tabelisiseväärtusega funktsioon e Inline Table Valued function (ILTVF) koodinäide:
Create Function fn_ILTVF_GetEmployees()

Returns Table
as
Return (Select EmployeeKey, FirstName, CAST(BirthDate AS date) as DOB
	From dbo.DimEmployee)

SELECT * FROM fn_ILTVF_GetEmployees();
 
