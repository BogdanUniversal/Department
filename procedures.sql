USE depozit2

CREATE PROCEDURE adaugaAngajat @nume_angajat VARCHAR(50), @data_nasterii DATE, @post VARCHAR(20), @cod_departament INT
AS
BEGIN
INSERT INTO Angajati(nume_angajat,data_nasterii,post,cod_departament) VALUES(@nume_angajat, @data_nasterii, @post, @cod_departament);
PRINT 'S-a inserat ' + @nume_angajat + ' in tabelul Angajati';
END

EXEC adaugaAngajat 'Ion Ghita','2000-03-20','Manipulant',1;

SELECT * FROM angajati;



CREATE PROCEDURE adaugaDepartament @nume_departament VARCHAR(20), @data_infintare DATE
AS
BEGIN
INSERT INTO Departament(nume_departament,data_infintare) VALUES(@nume_departament, @data_infintare);
PRINT 'S-a inserat ' + @nume_departament + ' in tabelul Departament';
END

EXEC adaugaDepartament 'Carne','2019-04-16';

SELECT * FROM Departament;



CREATE PROCEDURE adaugaUtilaj @tip_utilaj VARCHAR(20), @nume_utilaj VARCHAR(30), @ultima_folosinta DATETIME, @cod_departament INT
AS
BEGIN
INSERT INTO Utilaje(tip_utilaj,nume_utilaj,ultima_folosinta,nume_departament) VALUES(@tip_utilaj,@nume_utilaj,@ultima_folosinta,@cod_departament);
PRINT 'S-a inserat ' + @nume_utilaj + ' in tabelul Utilaje';
END

EXEC adaugaUtilaj 'Motostivuitor','BOSCH TR20','2015-09-20 17:23:56',2;

SELECT * FROM Utilaje;


CREATE PROCEDURE adaugaVehicul @nume_vehicul VARCHAR(30), @an_fabricatie INT, @cod_transport INT
AS
BEGIN
INSERT INTO Vehicul(nume_vehicul,an_fabricatie,cod_transport) VALUES(@nume_vehicul,@an_fabricatie,@cod_transport);
PRINT 'S-a inserat ' + @nume_vehicul + ' in tabelul Vehicul';
END

EXEC adaugaVehicul 'Mercedes Sprinter',2000,1;

SELECT * FROM Vehicul;


CREATE PROCEDURE adaugaTransport @tip_vehicul VARCHAR(20), @tip_transport VARCHAR(20)
AS
BEGIN
INSERT INTO Transport(tip_vehicul,tip_transport) VALUES(@tip_vehicul,@tip_transport);
PRINT 'S-a inserat ' + @tip_vehicul + ' in tabelul Transport';
END

EXEC adaugaTransport 'Duba','Carne';
SELECT * FROM Transport;




CREATE PROCEDURE adaugaMagazin @nume_magazin VARCHAR(50), @locatie_magazin VARCHAR(50)
AS
BEGIN
INSERT INTO Magazine(nume_magazin,locatie_magazin) VALUES(@nume_magazin,@locatie_magazin);
PRINT 'S-a inserat ' + @nume_magazin + ' in tabelul Magazine';
END

EXEC adaugaMagazin 'Profi','Calea lui Traian';
SELECT * FROM Magazine;



CREATE PROCEDURE adaugaTransportMagazin @cod_transport INT, @cod_magazin INT, @nr_livrari INT
AS
BEGIN
INSERT INTO TransportMagazine(cod_transport,cod_magazin,nr_livrari) VALUES(@cod_transport,@cod_magazin,@nr_livrari);
PRINT 'S-a inserat transportul ' + CAST(@cod_transport as VARCHAR(10)) + ' la magazinul ' + CAST(@cod_magazin as VARCHAR(10)) + ' in tabelul TransportMagazine';
END

EXEC adaugaTransportMagazin 3,1,50;





CREATE PROCEDURE stergeAngajat @nume_angajat VARCHAR(50), @data_nasterii DATE
AS
BEGIN
DELETE FROM Angajati
WHERE (nume_angajat=@nume_angajat AND data_nasterii=@data_nasterii) OR nume_angajat IS NULL;
PRINT 'S-a sters angajatul ' + @nume_angajat;
END

EXEC adaugaAngajat 'Ionel Ghita','2000-03-20','Manipulant',1;
SELECT * FROM Angajati;
EXEC stergeAngajat 'Ionel Ghita','2000-03-20';





CREATE PROCEDURE modificaAngajat @nume_angajat VARCHAR(50), @data_nasterii DATE
AS
BEGIN
UPDATE Angajati
SET data_nasterii=@data_nasterii 
WHERE nume_angajat=@nume_angajat OR data_nasterii IS NULL;
PRINT 'S-a modificat angajatul ' + @nume_angajat;
END


EXEC adaugaAngajat 'Ionel Ghita','2000-03-20','Manipulant',1;
SELECT * FROM Angajati;
EXEC modificaAngajat 'Ionel Ghita','2001-10-20';
