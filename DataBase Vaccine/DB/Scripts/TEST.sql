USE Vaccination

go

----------SELECT---------------

EXECUTE SP_SelectStateById 7
go
EXECUTE SP_SelectVaccineById 7
go
EXECUTE SP_SelectCampusById 1
go
EXECUTE SP_SelectPersonnel_KeyById 15
go
EXECUTE SP_SelectPersonnelById 3
go
EXECUTE SP_SelectCitizenById 6
go
EXECUTE SP_SelectCitizen_ReportById 5

go

------------INSERT----------------

EXECUTE SP_InsertState 'Coahuila'
go
EXECUTE SP_InsertVaccine 'Pfizer', 2, '2020-08-14 13:30:01', '2020-12-21 9:50:01'
go
EXECUTE SP_InsertCampus 'Aquiles Serdan # 549', 2, 50
go
EXECUTE SP_InsertPersonnel_Key 35,'Colaborador'
go
EXECUTE SP_InsertPersonnel 'Jacinto', 'Lopez', 'Rios', 'Pedro Loza # 23', 5528479137, 35, 4
go
EXECUTE SP_InsertCitizen 'Laura', 'Santana', 'Morales', 'Juriquilla # 2367', 9927136802, 35, 6, 5, 3, 6
go
EXECUTE SP_InsertCitizen_Report 2, 5, 5, 7, 2

go


------------UPDATE------------------

EXECUTE SP_UpdateState 3, 'Guanajuato'
go
EXECUTE SP_UpdateVaccine 7, 'Cansino Reforzado', 1
go
EXECUTE SP_UpdateCampus 5, 'Patzcuaro # 98'
go
EXECUTE SP_UpdatePersonnel_Key 13, 'Estudiante Avanzado'
go
EXECUTE SP_UpdatePersonnel 6, 'Valdivia'
go
EXECUTE SP_UpdateCitizen 3, 8849325700
go
EXECUTE SP_UpdateCitizen_Report 3, 7

go


-----------DELETE-----------------

EXECUTE SP_DeleteState 4
go
EXECUTE SP_DeleteVaccine 2
go
EXECUTE SP_DeleteCampus 5
go
EXECUTE SP_DeletePersonnel_Key 2
go
EXECUTE SP_DeletePersonnel 6
go
EXECUTE SP_DeleteCitizen 2
go
EXECUTE SP_DeleteCitizen_Report 2
