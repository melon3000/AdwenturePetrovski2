--funktsioonid fail nr 32
use AdventureWorksDW2019

--Tabelisiseväärtusega funktsioon e Inline Table Valued function (ILTVF) koodinäide:
Create Function fn_ILTVF_GetEmployees()

Returns Table
as
Return (Select EmployeeKey, FirstName, CAST(BirthDate AS date) as DOB
	From dbo.DimEmployee)

SELECT * FROM fn_ILTVF_GetEmployees();

-- Mitme avaldisega tabeliväärtusega funktsioonid e multi-statement table valued function (MSTVF):
create function fn_mstvf_getemployees()
returns @Table table (id int,Name nvarchar(20), DOB date)
as
begin
insert into @Table
select EmployeeKey,FirstName,cast(BirthDate as date)
from dimEmployee
return
end
--kontroll
Select * from fn_MSTVF_GetEmployees()

