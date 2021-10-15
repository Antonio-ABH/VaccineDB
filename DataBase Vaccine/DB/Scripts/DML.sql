USE Vaccination

go

INSERT INTO State (Name)
VALUES
('Jalisco'),
('Monterrey'),
('Distrito Federal'),
('Sonora'),
('Michoacan'),
('Puebla'),
('Queretaro');

go

INSERT INTO Vaccine (Name, Dose, First_Vaccination_Date, Second_Vaccination_Date)
VALUES
('Pfizer', 2, '2019-01-19 13:03:34', '2019-04-10 09:25:01'),
('Moderna', 2, '2019-03-10 11:09:09', '2019-06-09 12:54:11'),
('Sputnik', 2, '2019-08-07 15:27:31', '2019-12-18 14:22:49'),
('Aztra', 2, '2019-05-14 10:00:04', '2019-08-13 10:48:01'),
('Jhonson', 2, '2019-07-23 14:23:45', '2019-10-01 13:52:01'),
('Cansino', 2, '2019-01-14 11:03:59', '2019-03-16 09:33:01'),
('Moderna', 2, '2019-04-06 15:45:24', '2019-07-20 15:25:01');

go

INSERT INTO Campus (Address, idState, idVaccine)
VALUES
('Manuel Delgado # 34', 2, 4),
('Alcalde # 456', 4, 5), 
('Simon Bolivar # 1256', 7, 1),
('Medellin # 467', 6, 5),
('Cotzin # 23', 4, 1),
('Jade # 298', 6 ,6),
('Gonzalez Gallo # 976', 4, 3);

go

INSERT INTO Personnel_Key(idPersonnel_Key, Name)
VALUES
(20, 'Medico'),
(15, 'Enfermera'),
(07, 'Paramedico'),
(13, 'Estudiante'),
(2, 'Practiante'); 

go

INSERT INTO Personnel(Name, Paternal_Surname, Maternal_Surname, Address, Telephone_Number, idPersonnel_Key, idCampus)
VALUES
('Juan', 'Perez', 'Andrade', 'San Alonso # 45', 3356281902, 20, 2),
('Gerardo', 'Rubio', 'Saenz', 'Aldama # 345', 9958217514, 15, 4),
('Daniela', 'Santibanez', 'Rios', 'Providencia # 879', 4455281692, 15, 4),
('Petra', 'Santos', 'Jimenez', 'Abasolo # 12', 7781306428, 2, 7),
('Diana', 'Almazan', 'Guajardo', 'Medrano # 657', 8878503921, 07, 3),
('Pedro', 'Ceballos', 'Ugalde', 'Puerto Yabaros # 890', 6638174652, 13, 1),
('Ruben', 'Cerna', 'Grimaldo', 'La Paz # 2098', 7716284618, 13, 2);

go

INSERT INTO Citizen (Name, Paternal_Surname, Maternal_Surname, Address, Telephone_Number, Age, idState, idCampus, idVaccine, idPersonnel)
VALUES
('Julia', 'Pelaez', 'Santos', 'Ramon Corona # 90', 5596382816, 20, 1, 4, 6, 4),
('Sandra', 'Fernandez', 'Ugalde', 'Juarez # 450', 9935871694, 45, 4, 5, 2, 2),
('Ramon', 'Canoa', 'Grodaz', 'Av. Vallarta # 087', 1129864798, 87, 4, 7, 1, 6),
('Esmeralda', 'Centeno', 'Baeza', 'Ruben Dario # 532', 8803971458, 29, 6, 1, 5, 4),
('Kaylor', 'Nava', 'Andrade', 'San Felipe # 132', 3397165846, 55, 7, 4, 6, 7),
('Jose', 'Gallardo', 'Bueno', 'Novoa # 789', 4469349875, 43, 1, 3, 1, 6),
('Felipe', 'Diaz', 'Lopez', 'San Alonso #326', 2816470231, 39, 3, 7, 1, 5);

go

INSERT INTO Citizen_Report (idCitizen, idState, idCampus, idVaccine, idPersonnel)
VALUES
(2, 4, 4, 6, 2),
(1, 1, 5, 7, 7),
(3, 2, 4, 6, 4),
(5, 5, 6, 7, 3),
(4, 6, 7, 1, 3),
(3, 3, 1, 2, 2),
(7, 2 ,1 ,1 ,6);

