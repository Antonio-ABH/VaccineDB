USE Vaccination

go

CREATE VIEW Citizen_Vaccine
As
SELECT Ci.Name 'Name Citizen', Ci.Paternal_Surname 'Paternal Surname', Ci.Maternal_Surname 'Maternal Surname', V.Name 'Name Vaccine'
FROM Citizen Ci
INNER JOIN Vaccine V
ON Ci.idVaccine = V.idVaccine

SELECT * FROM Citizen_Vaccine

go

CREATE VIEW Vaccine_State
As
SELECT V.Name 'Vaccine Name', S.Name 'State Name'
FROM Vaccine V
INNER JOIN Citizen_Report Cr ON Cr.idVaccine = V.idVaccine
INNER JOIN State S ON Cr.idState = S.idState

SELECT * FROM Vaccine_State Order By [Vaccine Name]

go

CREATE VIEW Personnel_Citizen
As
SELECT P.Name 'Personnel Name Applied to', Ci.Name 'Citizen Name', Ci.Paternal_Surname 'Paternal Surname', Ci.Maternal_Surname 'Maternal Surname'
FROM Personnel P
INNER JOIN Citizen_Report Cr ON Cr.idPersonnel = P.idPersonnel
INNER JOIN Citizen Ci ON Cr.idCitizen = Ci.idCitizen

SELECT * FROM Personnel_Citizen

go

CREATE VIEW Date_Citizen_VaccineApplied
As
SELECT Ci.Name 'Citizen Name', Ci.Paternal_Surname 'Paternal Surname', Ci.Maternal_Surname 'Maternal Surname', V.Name 'Vaccine Name', V.Dose, V.First_Vaccination_Date, V.Second_Vaccination_Date
FROM Citizen Ci
INNER JOIN Citizen_Report Cr ON Cr.idCitizen = Ci.idCitizen
INNER JOIN Vaccine V ON Cr. idVaccine = V.idVaccine

SELECT * FROM Date_Citizen_VaccineApplied

go

CREATE VIEW Avg_Age
As
SELECT AVG(Age) As AverageAge
FROM Citizen 

SELECT * FROM Avg_Age

go

CREATE VIEW Sum_Age
As
SELECT SUM(Age) As SumAge
FROM Citizen 

SELECT * FROM Sum_Age

go

CREATE VIEW Max_Age
As
SELECT MAX(Age) As MaxAge
FROM Citizen

SELECT * FROM Max_Age

go

CREATE VIEW Min_Age
As
SELECT MIN(Age) As MinAge
FROM Citizen

SELECT * FROM Min_Age

go

CREATE VIEW Campus_Vaccine
As
SELECT C.Address 'Address', V.Name 'Vaccine Name'
FROM Campus C
INNER JOIN Citizen_Report Cr ON Cr.idCampus = C.idCampus
INNER JOIN Vaccine V ON Cr.idVaccine = V.idVaccine

SELECT * FROM Campus_Vaccine

go

CREATE VIEW Comparison_Age
As
SELECT Ci.Name, Ci.Paternal_Surname 'Paternal Surname', Ci.Maternal_Surname 'Maternal Surname', Ci.Age
FROM Citizen Ci
WHERE Age < 43

SELECT * FROM Comparison_Age

go

CREATE VIEW Hide_Name
As 
SELECT Ci.idCitizen, Ci.Name, Ci.Paternal_Surname 'Paternal Surname', Ci.Maternal_Surname 'Maternal Surname'
FROM Citizen Ci
WHERE Ci.Name <> 'Jose'

SELECT * FROM Hide_Name

go

CREATE VIEW Range_Age
As
SELECT Ci.idCitizen, Ci.Name, Ci.Paternal_Surname 'Paternal Surname', Ci.Maternal_Surname 'Maternal Surname', Ci.Age
FROM Citizen Ci
WHERE Ci.Age BETWEEN 30 AND 60

SELECT * FROM Range_Age

go

CREATE VIEW Distinct_State
As 
SELECT S.Name
FROM State S
WHERE S.Name <> 'Puebla'

SELECT * FROM Distinct_State

go

CREATE VIEW FirstVaccine
As
SELECT Ci.idCitizen, Ci.Name, Ci.Paternal_Surname 'Paternal Surname', Ci.Maternal_Surname 'Maternal Surname', V.First_Vaccination_Date
FROM Citizen Ci
INNER JOIN Citizen_Report Cr ON Cr.idCitizen = Ci.idCitizen
INNER JOIN Vaccine V ON Cr.idVaccine = V.idVaccine

SELECT * FROM FirstVaccine

go

CREATE VIEW Concat_Citizen_Vaccine
As
SELECT CONCAT(Ci.Name,'  ' , Ci.Paternal_Surname, '  ', Ci.Maternal_Surname, '  ', V.Name) As CitizenVaccined
FROM Citizen Ci
INNER JOIN Citizen_Report Cr ON Cr.idCitizen = Ci.idCitizen
INNER JOIN Vaccine V ON Cr.idVaccine = V.idVaccine

SELECT * FROM Concat_Citizen_Vaccine