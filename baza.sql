-- Tabela: Klienci
CREATE TABLE Klienci (
    numer_klienta INT PRIMARY KEY,
    imie VARCHAR(50),
    nazwisko VARCHAR(50),
    miasto VARCHAR(50),
    ulica VARCHAR(50),
    dom VARCHAR(10),
    numer_telefonu VARCHAR(15)
);

-- Przykładowe rekordy
INSERT INTO Klienci VALUES (1, 'Jan', 'Kowalski', 'Warszawa', 'Mickiewicza', '10', '123456789');
INSERT INTO Klienci VALUES (2, 'Anna', 'Nowak', 'Kraków', 'Słowackiego', '15', '987654321');

-- Tabela: Rodzaj_Pomaranczy
CREATE TABLE Rodzaj_Pomaranczy (
    id_pomaranczy INT PRIMARY KEY,
    nazwa VARCHAR(50),
    data_zbioru DATE
);

-- Przykładowe rekordy
INSERT INTO Rodzaj_Pomaranczy VALUES (1, 'Valencia', '2024-05-20');
INSERT INTO Rodzaj_Pomaranczy VALUES (2, 'Navel', '2024-05-22');

-- Tabela: Magazyn
CREATE TABLE Magazyn (
    id_magazynu INT PRIMARY KEY,
    id_pomaranczy INT,
    ilosc INT,
    FOREIGN KEY (id_pomaranczy) REFERENCES Rodzaj_Pomaranczy(id_pomaranczy)
);

-- Przykładowe rekordy
INSERT INTO Magazyn VALUES (1, 1, 1000);
INSERT INTO Magazyn VALUES (2, 2, 500);

-- Tabela: Pracownicy
CREATE TABLE Pracownicy (
    id_pracownika INT PRIMARY KEY,
    imie VARCHAR(50),
    nazwisko VARCHAR(50)
);

-- Przykładowe rekordy
INSERT INTO Pracownicy VALUES (1, 'Marek', 'Zieliński');
INSERT INTO Pracownicy VALUES (2, 'Katarzyna', 'Kowalczyk');

-- Tabela: Zamowienia
CREATE TABLE Zamowienia (
    nr_zamowienia INT PRIMARY KEY,
    numer_klienta INT,
    id_pomaranczy INT,
    data_wysylki DATE,
    id_pracownika INT,
    FOREIGN KEY (numer_klienta) REFERENCES Klienci(numer_klienta),
    FOREIGN KEY (id_pomaranczy) REFERENCES Rodzaj_Pomaranczy(id_pomaranczy),
    FOREIGN KEY (id_pracownika) REFERENCES Pracownicy(id_pracownika)
);

-- Przykładowe rekordy
INSERT INTO Zamowienia VALUES (1, 1, 1, '2024-06-01', 1);
INSERT INTO Zamowienia VALUES (2, 2, 2, '2024-06-02', 2);

-- Tabela: Transport
CREATE TABLE Transport (
    id_transportu INT PRIMARY KEY,
    nr_zamowienia INT,
    rodzaj_ciezarowki VARCHAR(50),
    FOREIGN KEY (nr_zamowienia) REFERENCES Zamowienia(nr_zamowienia)
);

-- Przykładowe rekordy
INSERT INTO Transport VALUES (1, 1, 'Duża ciężarówka');
INSERT INTO Transport VALUES (2, 2, 'Mała ciężarówka');
INSERT INTO Transport VALUES (3, 2, 'Średnia ciężarówka');

-- Indeksy
CREATE INDEX idx_klient_nazwisko ON Klienci(nazwisko);
CREATE INDEX idx_zamowienia_data_wysylki ON Zamowienia(data_wysylki);

-- Relacje między tabelami:
-- Klienci -> Zamowienia (numer_klienta)
-- Rodzaj_Pomaranczy -> Zamowienia (id_pomaranczy)
-- Pracownicy -> Zamowienia (id_pracownika)
-- Zamowienia -> Transport (nr_zamowienia)
-- Rodzaj_Pomaranczy -> Magazyn (id_pomaranczy)
