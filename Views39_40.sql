-- 39. View SQL Serveris

-- Kuvame kõik andmed tabelist DimEmployee (baastabel, mille andmeid kasutame)
SELECT * FROM DimEmployee


-- Loome view, mis kuvab töötajate põhiandmed koos osakonna nimega
-- See lihtsustab keerukate päringute kasutamist mitte-IT kasutajatele
CREATE VIEW vWEmployeesByDepartment
AS
SELECT EmployeeKey, FirstName, Salary, Gender, DepartmentName
FROM DimEmployee


-- Kuvame andmed läbi loodud view
SELECT * FROM vWEmployeesByDepartment


-- Loome view, mis kuvab ainult IT osakonna töötajad
-- Näide reataseme turvalisusest (row-level security)
CREATE VIEW vWITDepartment_Employees
AS
SELECT EmployeeKey, FirstName, Salary, Gender, DepartmentName
FROM DimEmployee
WHERE DimEmployee.DepartmentName = 'IT'


-- Loome view, mis ei näita palgainfot (Salary)
-- Näide veerutaseme turvalisusest (column-level security)
CREATE VIEW vWEmployeesNonConfidentialData
AS
SELECT EmployeeKey, FirstName, Gender, DepartmentName
FROM DimEmployee


-- Loome view, mis tagastab koondandmed — töötajate arvu osakonna kaupa
-- Näide view kasutamisest kokkuvõtlike andmete kuvamiseks
CREATE VIEW vWEmployeesCountByDepartment
AS
SELECT DepartmentName, COUNT(EmployeeKey) AS TotalEmployees
FROM DimEmployee
GROUP BY DepartmentName
