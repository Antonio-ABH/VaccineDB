CREATE DATABASE Vaccination

go

USE Vaccination

go

CREATE TABLE State (
	idState tinyint IDENTITY (1,1) PRIMARY KEY NOT NULL,
	Name Varchar (30) NOT NULL
);

go

CREATE TABLE Vaccine (
	idVaccine tinyint IDENTITY (1,1) PRIMARY KEY NOT NULL,
	Name Varchar (50) NOT NULL,
	Dose Varchar(30) NOT NULL,
	First_Vaccination_Date smalldatetime NOT NULL,
	Second_Vaccination_Date smalldatetime NOT NULL
);

go

CREATE TABLE Campus (
	idCampus tinyint IDENTITY (1,1) PRIMARY KEY NOT NULL,
	Address Varchar(100) NOT NULL,
	idState tinyint,
	CONSTRAINT FK_Campus_State FOREIGN KEY (idState) REFERENCES State (idState),
	idVaccine tinyint,
	CONSTRAINT FK_Campus_Vaccine FOREIGN KEY (idVaccine) REFERENCES Vaccine (idVaccine),
);

go

CREATE TABLE Personnel_Key (
	idPersonnel_Key tinyint PRIMARY KEY NOT NULL,
	Name Varchar (30) NOT NULL
);

go
 
CREATE TABLE Personnel (
	idPersonnel int IDENTITY (1,1) PRIMARY KEY NOT NULL,
	Name Varchar (30) NOT NULL,
	Paternal_Surname Varchar (100) NOT NULL,
	Maternal_Surname Varchar (100) NOT NULL,
	Address Varchar(100) NOT NULL,
	Telephone_Number Varchar (10) NOT NULL,
	idPersonnel_Key tinyint,
	CONSTRAINT FK_Personnel_Personnel_key FOREIGN KEY (idPersonnel_Key) REFERENCES Personnel_Key (idPersonnel_Key),
	idCampus tinyint,
	CONSTRAINT FK_Personnel_Campus FOREIGN KEY (idCampus) REFERENCES Campus (idCampus),
);

go

CREATE TABLE Citizen (
	idCitizen int IDENTITY (1,1) PRIMARY KEY NOT NULL,
	Name Varchar (30) NOT NULL,
	Paternal_Surname Varchar (100) NOT NULL,
	Maternal_Surname Varchar (100) NOT NULL,
	Address Varchar(100) NOT NULL,
	Telephone_Number Varchar (10) NOT NULL,
	Age tinyint NOT NULL,
	idState tinyint,
	CONSTRAINT FK_Citizen_State FOREIGN KEY (idState) REFERENCES State (idState),
	idCampus tinyint,
	CONSTRAINT FK_Citizen_Campus FOREIGN KEY (idCampus) REFERENCES Campus (idCampus),
	idVaccine tinyint,
	CONSTRAINT FK_Citizen_Vaccine FOREIGN KEY (idVaccine) REFERENCES Vaccine (idVaccine),
	idPersonnel int,
	CONSTRAINT FK_Citizen_Personnel FOREIGN KEY (idPersonnel) REFERENCES Personnel (idPersonnel)
);

go

CREATE TABLE Citizen_Report (
	idReport int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idCitizen int,
	CONSTRAINT FK_Citizen_Report_Citizen FOREIGN KEY (idCitizen) REFERENCES Citizen (idCitizen),
	idState tinyint,
	CONSTRAINT FK_Citizen_Report_State FOREIGN KEY (idState) REFERENCES State (idState),
	idCampus tinyint,
	CONSTRAINT FK_Citizen_Report_Campus FOREIGN KEY (idCampus) REFERENCES Campus (idCampus),
	idVaccine tinyint,
	CONSTRAINT FK_Citizen_Report_Vaccine FOREIGN KEY (idVaccine) REFERENCES Vaccine (idVaccine),
	idPersonnel int,
	CONSTRAINT FK_Citizen_Report_Personnel FOREIGN KEY (idPersonnel) REFERENCES Personnel (idPersonnel)
);