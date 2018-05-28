--PROJEKT na Bazy Danych IV.
/*Sklad osobowy
Paweł Wiejak 5762
Paweł Mańskowski 5123
Bartek Górski 5070

Oficjalnie do naszej grupy dopisany był Artur Kwiatkowski
ale nie udało nam się z nim skontaktować.
*/



CREATE TABLE dziennik_ocen
(
  dziennik_ocen_id		serial		NOT NULL,
  uczen				varchar(20)	NOT NULL,
  przedmiot				
  nauczyciel			
  ocena
  data
  godzina
  CONSTRAINT dziennik_ocen_pkey PRIMARY KEY (dziennik_ocen_id)
);

CREATE TABLE uczen
(
  uczen_id			serial		NOT NULL,
  nazwisko
  imie
  data_urodzenia
  kod_pocztowy
  miejscowosc
  ulica_nr
  rodzice
);

CREATE TABLE rodzic
(
  rodzic_id			serial		NOT NULL,
  imie_mamy
  nr_tel_mamy
  imie_taty
  nr_tel_taty
);


CREATE TABLE przedmiot
(
  przedmiot_id			serial		NOT NULL,
  nazwa_pelna
  nazwa_skrot
);

CREATE TABLE nauczyciel
(
  nauczyciel_id			serial		NOT NULL,
  nazwisko
  imie
  tytul_naukowy
  staz_pracy
  nr_tel
  mail
);


CREATE TABLE tytul_naukowy
(
  ocena_id			serial		NOT NULL,
  nazwa_pelna
  nazwa_skrot
);


CREATE TABLE ocena
(
  ocena_id			serial		NOT NULL,
  nazwa_pelna
  nazwa_skrot
);



