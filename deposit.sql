CREATE DATABASE deposit

USE deposit2;


CREATE TABLE Departament
(
cod_departament INT PRIMARY KEY IDENTITY,
nume_departament VARCHAR(20) NOT NULL,
data_infintare DATE NOT NULL
)


CREATE TABLE Angajati
(
cod_angajat INT PRIMARY KEY IDENTITY,
nume_angajat VARCHAR(50) NOT NULL,
data_nasterii DATE NOT NULL,
post VARCHAR(20) NOT NULL,
cod_departament INT FOREIGN KEY REFERENCES Departament(cod_departament)
--relatie 1-m
--un departament poate sa aiba mai multi angajati, dar un angajat poate lucra doar la un departament
)


CREATE TABLE Utilaje
(
cod_utilaj INT PRIMARY KEY IDENTITY,
tip_utilaj VARCHAR(20) NOT NULL,
nume_utilaj VARCHAR(30) NOT NULL,
ultima_folosinta DATETIME,
cod_departament INT FOREIGN KEY REFERENCES Departament(cod_departament)
--relatie 1-m
--un departament poate sa aiba mai multe utilaje, dar un utilaj poate fi doar la un departament
)


CREATE TABLE Transport
(
cod_transport INT PRIMARY KEY IDENTITY,
tip_vehicul VARCHAR(20) NOT NULL,
tip_transport VARCHAR(20) NOT NULL
)


CREATE TABLE Vehicul
(
cod_vehicul INT PRIMARY KEY IDENTITY,
nume_vehicul VARCHAR(30) NOT NULL,
an_fabricatie INT NOT NULL,
cod_transport INT FOREIGN KEY REFERENCES Transport(cod_transport)
--relatie 1-m
--un transport poate sa aiba mai multe vehicule, dar un vehicul poate sa fie doar la un transport
)


CREATE TABLE Magazine
(
cod_magazin INT PRIMARY KEY IDENTITY,
nume_magazin VARCHAR(50) NOT NULL,
locatie_magazin VARCHAR(50) NOT NULL
)


CREATE TABLE TransportMagazine
(
cod_transport INT FOREIGN KEY REFERENCES Transport(cod_transport),
cod_magazin INT FOREIGN KEY REFERENCES Magazine(cod_magazin),
nr_livrari INT,--numarul de livrari facute de un transport la un magazin
CONSTRAINT pk_TransportMagazine PRIMARY KEY(cod_transport, cod_magazin)
--relatie m-n
--un transport poate avea mai multe magazine pentru livrare, dar si un magazin poate avea mai multe transporturi
)


CREATE TABLE Furnizor
(
cod_furnizor INT PRIMARY KEY IDENTITY,
nume_furnizor VARCHAR(30) NOT NULL,
locatie_furnizor VARCHAR(30) NOT NULL,
numar_contact INT NOT NULL
--relatie 1-m
--un furnizor poate avea mai multe produse, dar un produs poate sa fie doar de la un furnizor
)


CREATE TABLE Produse
(
cod_produs INT PRIMARY KEY IDENTITY,
nume_produs VARCHAR(30) NOT NULL,
numar_produse INT NOT NULL,
data_fabricatie DATE NOT NULL,
data_expirare DATE NOT NULL,
cod_furnizor INT FOREIGN KEY REFERENCES Furnizor(cod_furnizor),
cod_departament INT FOREIGN KEY REFERENCES Departament(cod_departament)
--relatie 1-m
--un departament poate avea mai multe produse, dar un produs poate sa fie doar la un departament
)


CREATE TABLE FirmePartenere
(
cod_firma INT PRIMARY KEY IDENTITY,
nume_firma VARCHAR(30) NOT NULL,
locatie_firma VARCHAR(40) NOT NULL,
numar_contact INT NOT NULL
--relatie 1-m
--un departament poate avea mai multe produse, dar un produs poate sa fie doar la un departament
)