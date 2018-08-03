SET client_encoding='utf-8';


create table typ_nieruchomosci
(
 ID_typnieruchomosci        varchar(3)            NOT NULL,
 typ_nieruchomosci          varchar               NOT NULL,
 CONSTRAINT                 typ_nieruchomosci_pk  PRIMARY KEY(ID_typnieruchomosci)
);

create table stanowisko
(
  ID_stanowisko              varchar(3)        NOT NULL,
  nazwa_stanowiska           varchar           NOT NULL,
  pensja                     char              NOT NULL,
  nr_telefonu                char              NOT NULL,
  email                      varchar           NOT NULL,
  data_zatrudnia             date              NOT NULL,
  CONSTRAINT                 stanowisko_pk     PRIMARY KEY(ID_stanowisko)
);

create table pracownicy
(
  ID_pracownik               serial            NOT NULL,
  stanowisko2                 varchar                   ,
  imie                       varchar           NOT NULL,
  nazwisko                   varchar           NOT NULL,
  data_urodzenia             date              NOT NULL,
  data_zatrudnia             date              NOT NULL,
  stanowisko                 varchar           NOT NULL,
  CONSTRAINT                 pracownicy_pk PRIMARY KEY(ID_pracownik),
  CONSTRAINT                 stanowisko_fk FOREIGN KEY(stanowisko2)
                                           REFERENCES stanowisko(ID_stanowisko)
                                           ON UPDATE CASCADE ON DELETE CASCADE
);


create table nieruchomosc
(
  ID_nieruchomosc           serial               NOT NULL,
  typ_nieruchomosci         char                         ,
  nr_kw                     varchar(6)           NOT NULL,
  metraz                    char                 NOT NULL,
  adres                     varchar              NOT NULL,
  CONSTRAINT                nieruchomosc_pk      PRIMARY KEY(ID_nieruchomosc),
  CONSTRAINT                typ_nieruchomosci_fk FOREIGN KEY(typ_nieruchomosci)
                                                 REFERENCES typ_nieruchomosci (ID_typnieruchomosci)
);


create table klient
(
 ID_klient                  serial          NOT NULL,
 nieruchomosc               serial                  ,
 pracownik                  serial                  ,
 PESEL                      char            NOT NULL,
 imie                       varchar         NOT NULL,
 nazwisko                   varchar         NOT NULL,
 nr_telefonu                char            NOT NULL,
 adres                      char            NOT NULL,
 email                      varchar         NOT NULL,

 CONSTRAINT                 klient_pk       PRIMARY KEY(ID_klient),
 CONSTRAINT                 nieruchomosc_fk FOREIGN KEY (nieruchomosc)
                                            REFERENCES nieruchomosc(ID_nieruchomosc),
 CONSTRAINT                 pracownicy_fk   FOREIGN KEY(pracownik)
                                            REFERENCES pracownicy(ID_pracownik)
);

create table biuro
(
  ID_biuro                  serial          NOT NULL,
  pracownicy                serial                  ,
  nieruchomosc              serial                  ,
  klient                    serial                  ,
  CONSTRAINT                biuro_pk PRIMARY KEY(ID_biuro),
  CONSTRAINT                pracownicy_fk FOREIGN KEY(pracownicy)
                                          REFERENCES pracownicy(ID_pracownik),
  CONSTRAINT                nieruchomosc_fk FOREIGN KEY(nieruchomosc)
                                          REFERENCES nieruchomosc(ID_nieruchomosc),
  CONSTRAINT                klient_fk     FOREIGN KEY(klient)
                                          REFERENCES klient(ID_klient)
);
