-- Inserty do tabeli Klienci
INSERT INTO Klienci VALUES (3, 'Piotr', 'Wójcik', 'Gdańsk', 'Gdańska', '5', '123321123');
INSERT INTO Klienci VALUES (4, 'Marta', 'Wiśniewska', 'Łódź', 'Łódzka', '12', '321123321');
INSERT INTO Klienci VALUES (5, 'Andrzej', 'Krawczyk', 'Poznań', 'Poznańska', '20', '456654456');
INSERT INTO Klienci VALUES (6, 'Joanna', 'Zalewska', 'Wrocław', 'Wrocławska', '18', '654456654');

-- Inserty do tabeli Rodzaj_Pomaranczy
INSERT INTO Rodzaj_Pomaranczy VALUES (3, 'Cara Cara', '2024-05-25');
INSERT INTO Rodzaj_Pomaranczy VALUES (4, 'Blood Orange', '2024-05-27');

-- Inserty do tabeli Magazyn
INSERT INTO Magazyn VALUES (3, 3, 200);
INSERT INTO Magazyn VALUES (4, 4, 300);

-- Inserty do tabeli Pracownicy
INSERT INTO Pracownicy VALUES (3, 'Tomasz', 'Lewandowski');
INSERT INTO Pracownicy VALUES (4, 'Ewa', 'Kwiatkowska');

-- Inserty do tabeli Zamowienia
INSERT INTO Zamowienia VALUES (3, 3, 3, 150, '2024-06-03', 3);
INSERT INTO Zamowienia VALUES (4, 4, 4, 100, '2024-06-04', 4);
INSERT INTO Zamowienia VALUES (5, 5, 1, 200, '2024-06-05', 1);
INSERT INTO Zamowienia VALUES (6, 6, 2, 250, '2024-06-06', 2);

-- Inserty do tabeli Transport
INSERT INTO Transport VALUES (3, 3, 'Średnia ciężarówka');
INSERT INTO Transport VALUES (4, 4, 'Mała ciężarówka');
INSERT INTO Transport VALUES (5, 5, 'Duża ciężarówka');
INSERT INTO Transport VALUES (6, 6, 'Duża ciężarówka');

-- Inserty do tabeli Dostawy
INSERT INTO Dostawy VALUES (3, 3, 400, '2024-05-28');
INSERT INTO Dostawy VALUES (4, 4, 350, '2024-05-29');

-- Inserty do tabeli Odbiorcy
INSERT INTO Odbiorcy VALUES (3, 'Firma DEF', 'Szczecin', 'Warszawska', '8', '333444555');
INSERT INTO Odbiorcy VALUES (4, 'Firma GHI', 'Katowice', 'Chorzowska', '7', '444555666');

-- Inserty do tabeli Zamowienia_Odbiorcy
INSERT INTO Zamowienia_Odbiorcy VALUES (3, 3, 3);
INSERT INTO Zamowienia_Odbiorcy VALUES (4, 4, 4);

