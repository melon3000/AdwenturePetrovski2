-- 87. Except operaator
-- Loome tabeli TableA
Create Table TableA
(
    id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10)
)
Go

-- Lisame andmed TableA tabelisse
Insert into TableA values (1, 'Mark', 'Male')
Insert into TableA values (2, 'Mary', 'Female')
Insert into TableA values (3, 'Steve', 'Male')
Insert into TableA values (4, 'John', 'Male')
Insert into TableA values (5, 'Sara', 'Female')
Go

-- Loome tabeli TableB
Create Table TableB
(
    id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10)
)
Go

-- Lisame andmed TableB tabelisse
Insert into TableB values (4, 'John', 'Male')
Insert into TableB values (5, 'Sara', 'Female')
Insert into TableB values (6, 'Pam', 'Female')
Insert into TableB values (7, 'Rebeka', 'Female')
Insert into TableB values (8, 'Jordan', 'Male')
Go

-- Tagastab read, mis on TableA-s, kuid mitte TableB-s
Select Id, Name, Gender  
From TableA  
Except  
Select Id, Name, Gender  
From TableB


-- Näide DimEmployee tabeliga:
-- Tagastab töötajad, kelle palk on 50 000 kuni 59 999
Select EmployeeKey, FirstName, Gender, Salary  
From DimEmployee  
Where Salary >= 50000  
Except  
Select EmployeeKey, FirstName, Gender, Salary  
From DimEmployee  
Where Salary >= 60000  
Order By FirstName


