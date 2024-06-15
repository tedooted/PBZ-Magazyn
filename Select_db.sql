--1.
SELECT Klienci.imie, Klienci.nazwisko, Zamowienia.data_wysylki
FROM Klienci
INNER JOIN Zamowienia ON Klienci.id_klienta = Zamowienia.id_klienta;

SELECT Klienci.imie, Klienci.nazwisko, Zamowienia.data_wysylki
FROM Klienci, Zamowienia
WHERE Klienci.id_klienta = Zamowienia.id_klienta;
--2
SELECT Rodzaj_Pomaranczy.nazwa, SUM(Magazyn.ilosc) AS calkowita_ilosc
FROM Magazyn
INNER JOIN Rodzaj_Pomaranczy ON Magazyn.id_pomaranczy = Rodzaj_Pomaranczy.id_pomaranczy
GROUP BY Rodzaj_Pomaranczy.nazwa;
--3
SELECT Klienci.imie, Klienci.nazwisko, Zamowienia.data_wysylki, Zamowienia.data_wysylki - INTERVAL '2 days' AS data_przygotowania
FROM Klienci
INNER JOIN Zamowienia ON Klienci.id_klienta = Zamowienia.id_klienta;
--4
SELECT * 
FROM Klienci
WHERE nazwisko LIKE 'Kow%';
--5
SELECT imie, nazwisko
FROM Klienci
WHERE id_klienta IN (SELECT id_klienta FROM Zamowienia WHERE data_wysylki > '2024-06-01');

SELECT imie, nazwisko
FROM Klienci k
WHERE EXISTS (SELECT 1 FROM Zamowienia z WHERE z.id_klienta = k.id_klienta AND z.data_wysylki > '2024-06-01');
--6
SELECT * 
FROM Znizki 
WHERE klient IS NULL;
--7
SELECT * 
FROM Klienci
WHERE id_klienta NOT IN (SELECT id_klienta FROM Zamowienia);


SELECT Klienci.*
FROM Klienci
LEFT JOIN Zamowienia ON Klienci.id_klienta = Zamowienia.id_klienta
WHERE Zamowienia.id_klienta IS NULL;

--8
CREATE VIEW Klienci_Z_Zamowieniami AS
SELECT Klienci.imie, Klienci.nazwisko, Zamowienia.nr_zamowienia, Zamowienia.data_wysylki
FROM Klienci
INNER JOIN Zamowienia ON Klienci.id_klienta = Zamowienia.id_klienta;

SELECT * FROM Klienci_Z_Zamowieniami;

--9
DELETE FROM Klienci
WHERE id_klienta = 3;

--10
UPDATE Magazyn
SET ilosc = ilosc + 100
WHERE id_magazynu = 1;


