--PROJEKT na Bazy Danych IV.
/*Sklad osobowy
Paweł Wiejak 5762
Paweł Mańkowski 5123
Bartek Górski 5070

Oficjalnie do naszej grupy dopisany był Artur Kwiatkowski
ale nie udało nam się z nim skontaktować.
*/


CREATE TABLE przedmiot
(
  przedmiot_id			serial  NOT NULL,
  nazwa             varchar(30) NOT NULL,
  CONSTRAINT przedmiot_pkey PRIMARY KEY (przedmiot_id)
  
);

CREATE TABLE typ_egzaminu
(
	typ_egzaminu_id serial NOT NULL,
	rodzaj_egzaminu varchar(20) NOT NULL,
	CONSTRAINT typ_egzaminu_pkey PRIMARY KEY (typ_egzaminu_id)
);

CREATE TABLE tytul_naukowy
(
  tytul_naukowy_id		serial	NOT NULL,
  nazwa_skrot			varchar(20)  NOT NULL,
  CONSTRAINT tytul_naukowy_pkey PRIMARY KEY (tytul_naukowy_id)
);

CREATE TABLE opiekun
(
	opiekun_id serial NOT NULL,
	nazwisko varchar(30) NOT NULL,
	imie varchar(30) NOT NULL,
	telefon numeric(9) NOT NULL,
	email varchar(50),
	CONSTRAINT opiekun_pkey PRIMARY KEY (opiekun_id)
);

CREATE TABLE uczen
(
  uczen_id			serial		NOT NULL,
  nazwisko			varchar(30)	NOT NULL,
  imie				varchar(30)	NOT NULL,
  kod_pocztowy    numeric(5) NOT NULL,
  miejscowosc     varchar(20) NOT NULL,
  ulica_nr    varchar(30) NOT NULL,
  data_urodzenia    DATE NOT NULL,
  opiekun			integer NOT NULL,
  CONSTRAINT uczen_pkey PRIMARY KEY (uczen_id),
	CONSTRAINT fk_uczen_opiekun FOREIGN KEY (opiekun)
		REFERENCES opiekun (opiekun_id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE nauczyciel
(
  nauczyciel_id		serial		NOT NULL,
  nazwisko			varchar(30)	NOT NULL,
  imie				varchar(30)	  NOT NULL,
	przedmiot_1 			integer NOT NULL,
	przedmiot_2 			integer,
  tytul_naukowy		integer   NOT NULL,
  staz_pracy_lata		integer,
  telefon				numeric(9),
  email				varchar(50),
  CONSTRAINT nauczyciel_pkey PRIMARY KEY (nauczyciel_id),
	CONSTRAINT fk_nauczyciel_przedmiot_1 FOREIGN KEY (przedmiot_1)
		REFERENCES przedmiot (przedmiot_id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT fk_nauczyciel_przedmiot_2 FOREIGN KEY (przedmiot_2)
		REFERENCES przedmiot (przedmiot_id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT fk_nauczyciel_tytul_naukowy FOREIGN KEY (tytul_naukowy)
		REFERENCES tytul_naukowy (tytul_naukowy_id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
);



CREATE TABLE klasa
(
	klasa_id serial NOT NULL,
	nazwa varchar(30) NOT NULL,
	uczen integer NOT NULL,
	wychowawca integer NOT NULL,
	CONSTRAINT klasa_pkey PRIMARY KEY (klasa_id),
	CONSTRAINT fk_klasa_uczen FOREIGN KEY (uczen)
		REFERENCES uczen (uczen_id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT fk_klasa_wychowawca FOREIGN KEY (wychowawca)
		REFERENCES nauczyciel (nauczyciel_id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
);



CREATE TABLE dziennik_ocen
(
  dziennik_ocen_id		serial		NOT NULL,
	klasa integer NOT NULL,
	przedmiot integer NOT NULL,
	nauczyciel integer NOT NULL,
	uczen integer NOT NULL,
	ocena numeric(2,1) NOT NULL,
	data date NOT NULL,
	typ_egzaminu integer NOT NULL,
  CONSTRAINT dziennik_ocen_pkey PRIMARY KEY (dziennik_ocen_id),
	CONSTRAINT fk_dziennik_ocen_klasa FOREIGN KEY (klasa)
		REFERENCES klasa (klasa_id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT fk_dziennik_ocen_przedmiot FOREIGN KEY (przedmiot)
		REFERENCES przedmiot (przedmiot_id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT fk_dziennik_ocen_nauczyciel FOREIGN KEY (nauczyciel)
		REFERENCES nauczyciel (nauczyciel_id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT fk_dziennik_ocen_uczen FOREIGN KEY (uczen)
		REFERENCES uczen (uczen_id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT fk_dziennik_ocen_typ_egzaminu FOREIGN KEY (typ_egzaminu)
		REFERENCES typ_egzaminu (typ_egzaminu_id) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
);

INSERT INTO typ_egzaminu (rodzaj_egzaminu) VALUES ('sprawdzian');
INSERT INTO typ_egzaminu (rodzaj_egzaminu) VALUES ('kartkówka');
INSERT INTO typ_egzaminu (rodzaj_egzaminu) VALUES ('odpowiedź ustna');
INSERT INTO typ_egzaminu (rodzaj_egzaminu) VALUES ('praca domowa');
INSERT INTO typ_egzaminu (rodzaj_egzaminu) VALUES ('aktywność');


INSERT INTO tytul_naukowy (nazwa_skrot) VALUES ('inż.');
INSERT INTO tytul_naukowy (nazwa_skrot) VALUES ('mgr');
INSERT INTO tytul_naukowy (nazwa_skrot) VALUES ('mgr inż.');
INSERT INTO tytul_naukowy (nazwa_skrot) VALUES ('dr');
INSERT INTO tytul_naukowy (nazwa_skrot) VALUES ('dr hab.');

INSERT INTO przedmiot (nazwa) VALUES ('biologia');
INSERT INTO przedmiot (nazwa) VALUES ('polski');
INSERT INTO przedmiot (nazwa) VALUES ('matematyka');
INSERT INTO przedmiot (nazwa) VALUES ('chemia');
INSERT INTO przedmiot (nazwa) VALUES ('fizyka');
INSERT INTO przedmiot (nazwa) VALUES ('religia');
INSERT INTO przedmiot (nazwa) VALUES ('plastyka');
INSERT INTO przedmiot (nazwa) VALUES ('informatyka');

INSERT INTO nauczyciel (nazwisko,imie,przedmiot_1,tytul_naukowy,staz_pracy_lata,telefon,email) VALUES ('Zajac','Jan','1','1','1','345748029','Zajac.Jan@gmail.com');
INSERT INTO nauczyciel (nazwisko,imie,przedmiot_1,tytul_naukowy,staz_pracy_lata,telefon,email) VALUES ('Pawlowski','Andrzej','2','2','2','833797112','Pawlowski.Andrzej@gmail.com');
INSERT INTO nauczyciel (nazwisko,imie,przedmiot_1,tytul_naukowy,staz_pracy_lata,telefon,email) VALUES ('Wieczorek','Tomasz','5','4','3','787391646','Wieczorek.Tomasz@gmail.com');
INSERT INTO nauczyciel (nazwisko,imie,przedmiot_1,tytul_naukowy,staz_pracy_lata,telefon,email) VALUES ('Jablonska','Aneta','6','4','1','500316696','Jablonska.Aneta@gmail.com');
INSERT INTO nauczyciel (nazwisko,imie,przedmiot_1,tytul_naukowy,staz_pracy_lata,telefon,email) VALUES ('Wrobel','Dominika','7','1','3','680475819','Wrobel.Dominika@gmail.com');
INSERT INTO nauczyciel (nazwisko,imie,przedmiot_1,tytul_naukowy,staz_pracy_lata,telefon,email) VALUES ('Nowakowski','Przemyslaw','8','2','2','789329155','Nowakowski.Przemyslaw@gmail.com');
INSERT INTO nauczyciel (nazwisko,imie,przedmiot_1,przedmiot_2,tytul_naukowy,staz_pracy_lata,telefon,email) VALUES ('Michalski','Zenon','3','7','3','4','601102609','Michalski.Zenon@gmail.com');
INSERT INTO nauczyciel (nazwisko,imie,przedmiot_1,przedmiot_2,tytul_naukowy,staz_pracy_lata,telefon,email) VALUES ('Krol','Pawel','4','7','5','15','360196354','Krol.Pawel@gmail.com');


SELECT * from dziennik_ocen;
SELECT * from klasa;
SELECT * from nauczyciel;
SELECT * from uczen;
SELECT * from opiekun;
SELECT * from tytul_naukowy;
SELECT * from typ_egzaminu;
SELECT * from przedmiot;


DROP TABLE dziennik_ocen;
DROP TABLE klasa;
DROP TABLE nauczyciel;
DROP TABLE uczen;
DROP TABLE opiekun;
DROP TABLE tytul_naukowy;
DROP TABLE typ_egzaminu;
DROP TABLE przedmiot;


