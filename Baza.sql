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
	email varchar(40),
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
  email				varchar(30),
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


DROP TABLE dziennik_ocen;
DROP TABLE klasa;
DROP TABLE nauczyciel;
DROP TABLE uczen;
DROP TABLE opiekun;
DROP TABLE tytul_naukowy;
DROP TABLE typ_egzaminu;
DROP TABLE przedmiot;




