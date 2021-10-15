USE Vaccination

go

--------------SELECT--------------

CREATE PROCEDURE SP_SelectStateById
@id tinyint
As
Begin
SELECT Name FROM State 
WHERE idState = @id
End

EXECUTE SP_SelectStateById 7

go

CREATE PROCEDURE SP_SelectVaccineById
@id tinyint
As
Begin
SELECT Name, Dose, First_Vaccination_Date, Second_Vaccination_Date FROM Vaccine 
WHERE idVaccine = @id
End

EXECUTE SP_SelectVaccineById 7

go

CREATE PROCEDURE SP_SelectCampusById
@id tinyint
As
Begin
SELECT C.Address,S.Name, V.Name FROM Campus C INNER JOIN State S ON C.idState = S.idState INNER JOIN Vaccine V ON C.idVaccine = V.idVaccine
WHERE idCampus = @id 
End

EXECUTE SP_SelectCampusById 1

go

CREATE PROCEDURE SP_SelectPersonnel_KeyById
@id tinyint
As 
Begin
SELECT Name FROM Personnel_Key
WHERE idPersonnel_Key = @id 
End

EXECUTE SP_SelectPersonnel_KeyById 15

go

CREATE PROCEDURE SP_SelectPersonnelById
@id int
As 
Begin
SELECT P.Name, P.Paternal_Surname, P.Maternal_Surname, Pe.Name FROM Personnel P INNER JOIN Personnel_Key Pe ON P.idPersonnel_Key = Pe.idPersonnel_Key
WHERE idPersonnel = @id 
End

EXECUTE SP_SelectPersonnelById 3

go

CREATE PROCEDURE SP_SelectCitizenById
@id int
As 
Begin
SELECT Ci.Name, Ci.Paternal_Surname, Ci.Maternal_Surname, C.Address, V.Name FROM Citizen Ci INNER JOIN Campus C ON Ci.idCampus = C.idCampus INNER JOIN Vaccine V ON Ci.idVaccine = V.idVaccine
WHERE idCitizen = @id 
End

EXECUTE SP_SelectCitizenById 6

go

CREATE PROCEDURE SP_SelectCitizen_ReportById
@id int
As 
Begin
SELECT Ci.Name, Ci.Paternal_Surname, Ci.Maternal_Surname, V.Name, P.Name, P.Paternal_Surname, P.Maternal_Surname FROM Citizen_Report Cir INNER JOIN Citizen Ci ON Cir.idCitizen = Ci.idCitizen INNER JOIN Vaccine V ON Cir.idVaccine = V.idVaccine INNER JOIN Personnel P ON Cir.idPersonnel = P.idPersonnel
WHERE idReport = @id 
End

EXECUTE SP_SelectCitizen_ReportById 5

go

---------------INSERT--------------------------

CREATE PROCEDURE SP_InsertState
@Name varchar(30)
As
Begin
EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
INSERT State(Name)
VALUES(@Name)
End

EXECUTE SP_InsertState 'Coahuila'
SELECT * FROM State

go

CREATE PROCEDURE SP_InsertVaccine
@Name varchar(50),
@Dose varchar(30),
@First_Vaccination_Date smalldatetime,
@Second_Vaccination_Date smalldatetime
As
Begin
EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
INSERT Vaccine(Name, Dose, First_Vaccination_Date, Second_Vaccination_Date)
VALUES(@Name, @Dose, @First_Vaccination_Date, @Second_Vaccination_Date)
End

EXECUTE SP_InsertVaccine 'Pfizer', 2, '2020-08-14 13:30:01', '2020-12-21 9:50:01'
SELECT * FROM Vaccine

go

CREATE PROCEDURE SP_InsertCampus
@Address varchar(100),
@idState tinyint,
@idVaccine tinyint
As
Begin
EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
INSERT Campus(Address, idState, idVaccine)
VALUES(@Address, @idState, @idVaccine)
End

EXECUTE SP_InsertCampus 'Aquiles Serdan # 549', 2, 50
SELECT * FROM Campus

go

CREATE PROCEDURE SP_InsertPersonnel_Key
@idPersonnel_key tinyint,
@Name varchar(30)
As
Begin
EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
INSERT Personnel_Key(idPersonnel_Key, Name)
VALUES(@idPersonnel_key, @Name)
End

EXECUTE SP_InsertPersonnel_Key 35,'Colaborador'
SELECT * FROM Personnel_Key

go

CREATE PROCEDURE SP_InsertPersonnel
@Name varchar(30),
@Paternal_Surname varchar(100),
@Maternal_Surname varchar(100),
@Address varchar(100),
@Telephone_Number varchar(10),
@idPersonnel_Key tinyint,
@idCampus tinyint
As
Begin
EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
INSERT Personnel(Name, Paternal_Surname, Maternal_Surname, Address, Telephone_Number, idPersonnel_Key, idCampus)
VALUES(@Name, @Paternal_Surname, @Maternal_Surname, @Address, @Telephone_Number, @idPersonnel_Key,@idCampus)
End

EXECUTE SP_InsertPersonnel 'Jacinto', 'Lopez', 'Rios', 'Pedro Loza # 23', 5528479137, 35, 4
SELECT * FROM Personnel

go

CREATE PROCEDURE SP_InsertCitizen
@Name varchar(30),
@Paternal_Surname varchar(100),
@Maternal_Surname varchar(100),
@Address varchar(100),
@Telephone_Number varchar(10),
@Age tinyint,
@idState tinyint,
@idCampus tinyint,
@idVaccine tinyint,
@idPersonnel int
As
Begin
EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
INSERT Citizen(Name, Paternal_Surname, Maternal_Surname, Address, Telephone_Number, Age, idState, idCampus, idVaccine, idPersonnel)
VALUES(@Name, @Paternal_Surname, @Maternal_Surname, @Address, @Telephone_Number, @Age, @idState, @idCampus, @idVaccine, @idPersonnel)
End

EXECUTE SP_InsertCitizen 'Laura', 'Santana', 'Morales', 'Juriquilla # 2367', 9927136802, 35, 6, 5, 3, 6
SELECT * FROM Citizen

go

CREATE PROCEDURE SP_InsertCitizen_Report
@idCitizen int,
@idState tinyint,
@idCampus tinyint,
@idVaccine tinyint,
@idPersonnel int
As
Begin
EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
INSERT Citizen_Report(idCitizen, idState, idCampus, idVaccine, idPersonnel)
VALUES(@idCitizen, @idState, @idCampus, @idVaccine, @idPersonnel)
End

EXECUTE SP_InsertCitizen_Report 2, 5, 5, 7, 2
SELECT * FROM Citizen_Report


----------------UPDATE--------------------------

go

CREATE PROCEDURE SP_UpdateState
@id tinyint,
@Name varchar(50)
As
Begin
EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
UPDATE State
SET Name = @Name
WHERE idState =@id
End

EXECUTE SP_UpdateState 3, 'Guanajuato'
SELECT * FROM State

go 

CREATE PROCEDURE SP_UpdateVaccine
@id tinyint,
@Name varchar(50),
@Dose varchar(30)
As
Begin
EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
UPDATE Vaccine
SET Name = @Name, Dose = @Dose
WHERE idVaccine =@id
End

EXECUTE SP_UpdateVaccine 7, 'Cansino Reforzado', 1
SELECT * FROM Vaccine

go

CREATE PROCEDURE SP_UpdateCampus
@id tinyint,
@Address varchar(50)
As
Begin
EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
UPDATE Campus
SET Address = @Address
WHERE idCampus =@id
End

EXECUTE SP_UpdateCampus 5, 'Patzcuaro # 98'
SELECT * FROM Campus

go

CREATE PROCEDURE SP_UpdatePersonnel_Key
@id tinyint,
@Name varchar(30)
As
Begin
EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
UPDATE Personnel_Key
SET Name = @Name
WHERE idPersonnel_Key =@id
End

EXECUTE SP_UpdatePersonnel_Key 13, 'Estudiante Avanzado'
SELECT * FROM Personnel_Key

go

CREATE PROCEDURE SP_UpdatePersonnel
@id int,
@Maternal_Surname varchar(100)
As
Begin
EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
UPDATE Personnel
SET Maternal_Surname = @Maternal_Surname
WHERE idPersonnel =@id
End

EXECUTE SP_UpdatePersonnel 6, 'Valdivia'
SELECT * FROM Personnel

go

CREATE PROCEDURE SP_UpdateCitizen
@id int,
@Telephone_Number varchar(10)
As
Begin
EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
UPDATE Citizen
SET Telephone_Number = @Telephone_Number
WHERE idCitizen =@id
End

EXECUTE SP_UpdateCitizen 3, 8849325700
SELECT * FROM Citizen

go

CREATE PROCEDURE SP_UpdateCitizen_Report
@id int,
@idState tinyint
As
Begin
EXECUTE sp_MSforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT ALL";
UPDATE Citizen_Report
SET idState = @idState
WHERE idReport =@id
End

EXECUTE SP_UpdateCitizen_Report 3, 7
SELECT * FROM Citizen_Report


-------------DELETE-------------------

go

CREATE PROCEDURE SP_DeleteState
@id tinyint
As
Begin
Begin Try
EXECUTE sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
DELETE FROM State
WHERE idState = @id
End Try
Begin Catch
PRINT'ERROR';
End Catch
End

EXECUTE SP_DeleteState 4
SELECT * FROM State

go

CREATE PROCEDURE SP_DeleteVaccine
@id tinyint
As
Begin
Begin Try
EXECUTE sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
DELETE FROM Vaccine
WHERE idVaccine = @id
End Try
Begin Catch
PRINT'ERROR';
End Catch
End

EXECUTE SP_DeleteVaccine 2
SELECT * FROM Vaccine

go

CREATE PROCEDURE SP_DeleteCampus
@id tinyint
As
Begin
Begin Try
EXECUTE sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
DELETE FROM Campus
WHERE idCampus = @id
End Try
Begin Catch
PRINT'ERROR';
End Catch
End

EXECUTE SP_DeleteCampus 5
SELECT * FROM Campus

go

CREATE PROCEDURE SP_DeletePersonnel_Key
@id tinyint
As
Begin
Begin Try
EXECUTE sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
DELETE FROM Personnel_Key
WHERE idPersonnel_Key = @id
End Try
Begin Catch
PRINT'ERROR';
End Catch
End

EXECUTE SP_DeletePersonnel_Key 2
SELECT * FROM Personnel_Key

go

CREATE PROCEDURE SP_DeletePersonnel
@id tinyint
As
Begin
Begin Try
EXECUTE sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
DELETE FROM Personnel
WHERE idPersonnel = @id
End Try
Begin Catch
PRINT'ERROR';
End Catch
End

EXECUTE SP_DeletePersonnel 6
SELECT * FROM Personnel

go

CREATE PROCEDURE SP_DeleteCitizen
@id tinyint
As
Begin
Begin Try
EXECUTE sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
DELETE FROM Citizen
WHERE idCitizen = @id
End Try
Begin Catch
PRINT'ERROR';
End Catch
End

EXECUTE SP_DeleteCitizen 2
SELECT * FROM Citizen

go

CREATE PROCEDURE SP_DeleteCitizen_Report
@id int
As
Begin
Begin Try
EXECUTE sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
DELETE FROM Citizen_Report
WHERE idReport = @id
End Try
Begin Catch
PRINT'ERROR';
End Catch
End

EXECUTE SP_DeleteCitizen_Report 2
SELECT * FROM Citizen_Report