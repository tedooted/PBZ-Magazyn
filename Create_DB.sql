DROP TABLE IF EXISTS Klienci, Rodzaj_Pomaranczy, Magazyn, Pracownicy, Zamowienia, Transport, Znizki, Plantacja CASCADE;
CREATE TABLE Klienci (
    id_klienta INT PRIMARY KEY NOT NULL,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    miasto VARCHAR(50) NOT NULL,
    ulica VARCHAR(50) NOT NULL,
    dom VARCHAR(10) NOT NULL,
    numer_telefonu VARCHAR(15) NOT NULL
);

INSERT INTO Klienci VALUES (1, 'Jan', 'Kowalski', 'Warszawa', 'Mickiewicza', '10', '123456789');
INSERT INTO Klienci VALUES (2, 'Anna', 'Nowak', 'Kraków', 'Słowackiego', '15', '987654321');
INSERT INTO Klienci VALUES (3, 'Tomek', 'Góral', 'Gdańsk', 'Kościuszki', '7', '777777777');

CREATE TABLE Rodzaj_Pomaranczy (
    id_pomaranczy INT PRIMARY KEY NOT NULL,
    nazwa VARCHAR(50) NOT NULL,
    data_zbioru DATE NOT NULL
);

INSERT INTO Rodzaj_Pomaranczy VALUES (1, 'Valencia', '2024-05-20');
INSERT INTO Rodzaj_Pomaranczy VALUES (2, 'Navel', '2024-05-22');

CREATE TABLE Magazyn (
    id_magazynu INT PRIMARY KEY NOT NULL,
    id_pomaranczy INT NOT NULL,
    ilosc INT NOT NULL,
    FOREIGN KEY (id_pomaranczy) REFERENCES Rodzaj_Pomaranczy(id_pomaranczy)
);


INSERT INTO Magazyn VALUES (1, 1, 1000);
INSERT INTO Magazyn VALUES (2, 2, 500);


CREATE TABLE Pracownicy (
    id_pracownika INT PRIMARY KEY NOT NULL,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL
);


INSERT INTO Pracownicy VALUES (1, 'Marek', 'Zieliński');
INSERT INTO Pracownicy VALUES (2, 'Katarzyna', 'Kowalczyk');

CREATE TABLE Zamowienia (
    nr_zamowienia INT PRIMARY KEY NOT NULL,
    id_klienta INT NOT NULL,
    id_pomaranczy INT NOT NULL,
    data_wysylki DATE NOT NULL,
    id_pracownika INT NOT NULL,
    FOREIGN KEY (id_klienta) REFERENCES Klienci(id_klienta),
    FOREIGN KEY (id_pomaranczy) REFERENCES Rodzaj_Pomaranczy(id_pomaranczy),
    FOREIGN KEY (id_pracownika) REFERENCES Pracownicy(id_pracownika)
);

INSERT INTO Zamowienia VALUES (1, 1, 1, '2024-06-01', 1);
INSERT INTO Zamowienia VALUES (2, 2, 2, '2024-06-02', 2);

CREATE TABLE Transport (
    id_transportu INT PRIMARY KEY NOT NULL,
    nr_zamowienia INT NOT NULL,
    rodzaj_ciezarowki VARCHAR(50) NOT NULL,
    FOREIGN KEY (nr_zamowienia) REFERENCES Zamowienia(nr_zamowienia)
);

INSERT INTO Transport VALUES (1, 1, 'Duża ciężarówka');
INSERT INTO Transport VALUES (2, 2, 'Mała ciężarówka');
INSERT INTO Transport VALUES (3, 2, 'Średnia ciężarówka');

CREATE TYPE r_z AS ENUM ('zniżka transportowa','zniżka na produkt');

CREATE TABLE Znizki (
    id_znizki int PRIMARY KEY NOT NULL,
    rodzaj_znizki r_z NOT NULL,
    klient int NOT NULL,
    FOREIGN KEY (klient) REFERENCES Klienci(id_klienta)
);

INSERT INTO Znizki VALUES (1, 'zniżka transportowa', 3);
INSERT INTO Znizki VALUES (2, 'zniżka na produkt', 2);
INSERT INTO Znizki VALUES (3, 'zniżka transportowa', 1);

CREATE TABLE Plantacja (
    id_zbioru int PRIMARY KEY NOT NULL,
    numer_pracownika int NOT NULL,
    numer_rodzaju_pomaranczy int NOT NULL,
    FOREIGN KEY (numer_pracownika) REFERENCES Pracownicy(id_pracownika),
    FOREIGN KEY (numer_rodzaju_pomaranczy) REFERENCES Rodzaj_Pomaranczy(id_pomaranczy)
);

INSERT INTO Plantacja VALUES (1, 1, 1);
INSERT INTO Plantacja VALUES (2, 2, 2);

CREATE INDEX idx_klient_nazwisko ON Klienci(nazwisko);
CREATE INDEX idx_zamowienia_data_wysylki ON Zamowienia(data_wysylki);

-- Relacje między tabelami:
-- Klienci -> Zamowienia (id_klienta)
-- Rodzaj_Pomaranczy -> Zamowienia (id_pomaranczy)
-- Pracownicy -> Zamowienia (id_pracownika)
-- Zamowienia -> Transport (nr_zamowienia)
-- Rodzaj_Pomaranczy -> Magazyn (id_pomaranczy)
