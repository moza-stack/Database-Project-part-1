--Display the department ID, department name, manager ID, and the full name of the manager--
 SELECT 
    d.Dnum,
    d.Dname,
    d.MGRSSN,
    e.Fname + ' ' + e.Lname AS ManagerFullName
FROM Departments d
LEFT JOIN Employee e
    ON d.MGRSSN = e.SSN;
	--Display the names of departments and the names of the projects they control.--
	SELECT 
    d.Dname AS DepartmentName,
    p.Pname AS ProjectName
FROM Departments d
JOIN Project p
    ON d.Dnum = p.Dnum;
	--Display full data of all dependents, along with the full name of the employee they depend on--
	SELECT 
    d.*,
    CONCAT(e.Fname, ' ', e.Lname) AS EmployeeFullName
FROM Dependent d
JOIN Employee e
    ON d.ESSN = e.SSN;
	----Display the project ID, name, and location of all projects located in Cairo or Alex--
	SELECT 
    Pnumber AS ProjectID,
    Pname   AS ProjectName,
    Plocation AS Location
FROM Project
WHERE Plocation IN ('Cairo', 'Alex');
--Display all project data where the project name starts with the letter 'A'.--
SELECT *
FROM Project
WHERE Pname LIKE 'A%';
--Display the IDs and names of employees in department 30 with a salary between 1000 and 2000 LE--
SELECT 
    SSN,
    Fname + ' ' + Lname AS EmpName
FROM Employee
WHERE Dno = 30
  AND Salary BETWEEN 1000 AND 2000;
  --Retrieve the names of employees in department 10 who work ≥ 10 hours/week on the "AL Rabwah" project--
 SELECT * FROM sys.tables WHERE name LIKE '%Works%';
 SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE '%Works%';
 SELECT e.Fname + ' ' + e.Lname AS EmployeeName
FROM Employee e
JOIN dbo.Works_for w
    ON e.SSN = w.ESSN
JOIN Project p
    ON w.Pno = p.Pnumber
WHERE e.Dno = 10
  AND p.Pname = 'AL Rabwah'
  AND w.Hours >= 10;
  --Find the names of employees who are directly supervised by "Kamel Mohamed"--
  SELECT e.Fname + ' ' + e.Lname AS EmployeeName
FROM Employee e
JOIN Employee s
    ON e.Superssn = s.SSN
WHERE s.Fname = 'Kamel'
  AND s.Lname = 'Mohamed';
  ----Retrieve the names of employees and the names of the projects they work on, sorted by project name--
  SELECT 
    e.Fname + ' ' + e.Lname AS EmployeeName,
    p.Pname AS ProjectName
FROM Employee e
JOIN Works_for w
    ON e.SSN = w.ESSN
JOIN Project p
    ON w.Pno = p.Pnumber
ORDER BY p.Pname;
--For each project located in Cairo, display the project number, controlling department name, manager's last name,address, and birthdate.---
SELECT 
    p.Pnumber AS ProjectNumber,
    d.Dname AS DepartmentName,
    e.Lname AS ManagerLastName,
    e.Address AS ManagerAddress,
    e.Bdate AS ManagerBirthdate
FROM Project p
JOIN Departments d
    ON p.Dnum = d.Dnum
JOIN Employee e
    ON d.MGRSSN = e.SSN
WHERE p.Plocation = 'Cairo';
--Display all data of managers in the company--
SELECT e.*
FROM Employee e
JOIN Departments d
    ON e.SSN = d.MGRSSN;
	--Display all employees and their dependents, even if some employees have no dependents--
	SELECT 
    e.SSN,
    e.Fname + ' ' + e.Lname AS EmployeeName,
    d.Dependent_name,
    d.Bdate
FROM Employee e
LEFT JOIN Dependent d
    ON e.SSN = d.ESSN
ORDER BY e.Lname, e.Fname;
