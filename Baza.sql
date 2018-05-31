--PROJEKT na Bazy Danych IV.
/*Sklad osobowy
Paweł Wiejak 5762
Paweł Mańskowski 5123
Bartek Górski 5070

Oficjalnie do naszej grupy dopisany był Artur Kwiatkowski
ale nie udało nam się z nim skontaktować.
*/



CREATE TABLE przedmiot
(
  przedmiot_id			serial		NOT NULL,
  nazwa_pelna			varchar(30)	NOT NULL,
  nazwa_skrot			varchar(8)	NOT NULL,
  CONSTRAINT przedmiot_pkey PRIMARY KEY (przedmiot_id)
  
);

CREATE TABLE tytul_naukowy
(
  tytul_naukowy_id		serial		NOT NULL,
  nazwa_skrot			varchar(10)	NOT NULL,
  CONSTRAINT tytul_naukowy_pkey PRIMARY KEY (tytul_naukowy_id),
);

CREATE TABLE uczen
(
  uczen_id			serial		NOT NULL,
  nazwisko			varchar(30)	NOT NULL,
  imie				varchar(30)	NOT NULL,
  klasa       integer NOT NULL,
  kod_pocztowy  numeric(5) NOT NULL,
  miejscowosc   varchar(20) NOT NULL,
  ulica_nr  varchar(30) NOT NULL,
  data_urodzenia  DATE NOT NULL,
  opiekun   integer NOT NULL,
  CONSTRAINT uczen_pkey PRIMARY KEY (uczen_id)
);

CREATE TABLE nauczyciel
(
  nauczyciel_id		serial		NOT NULL,
  nazwisko			varchar(30)	NOT NULL,
  imie				varchar(20)	NOT NULL,
  tytul_naukowy		varchar(10)	NOT NULL,
  staz_pracy_lata		integer		NOT NULL,
  nr_tel				integer		NOT NULL,
  mail				varchar(30)	NOT NULL,
  CONSTRAINT nauczyciel_pkey PRIMARY KEY (nauczyciel_id),
);

CREATE TABLE dziennik_ocen
(
  dziennik_ocen_id		serial		NOT NULL,
  uczen				varchar(50)	NOT NULL,
  przedmiot			varchar(20)	NOT NULL,	
  nauczyciel			varchar(50)	NOT NULL,
  ocena			integer		NOT NULL,
  data				date		NOT NULL,
  godzina			time		NOT NULL,
  CONSTRAINT dziennik_ocen_pkey PRIMARY KEY (dziennik_ocen_id),
);



