-- DODAC Wyświetlanie wyniku operacji np. operacji arytmetycznych na liczbach czy na datach.
--Warunki odwołujące się do wzorców napisów (np. opisy wszystkich układanek, LIKE 'układanka%').
---Użycie zagnieżdżenia w obu odmianach, nieskorelowane i skorelowane.
--Sprawdzanie warunku NULL.
--Zapytania negatywne, np. klienci bez złożonych zamówień. Co najmniej w dwu wersjach.
--Wersje zapytań negatywnych:
--Użycie widoku (perspektywy, VIEW).

SELECT * FROM Klienci WHERE miasto = 'Warszawa';

SELECT * FROM Zamowienia WHERE numer_klienta = 1;

SELECT * FROM Magazyn m
JOIN Rodzaj_Pomaranczy rp ON m.id_pomaranczy = rp.id_pomaranczy
WHERE rp.data_zbioru > '2024-05-20';

SELECT z.nr_zamowienia, z.data_wysylki, k.imie, k.nazwisko, k.miasto, k.ulica
FROM Zamowienia z
JOIN Klienci k ON z.numer_klienta = k.numer_klienta;

SELECT p.imie, p.nazwisko, COUNT(z.nr_zamowienia) AS liczba_zamowien
FROM Pracownicy p
INNER JOIN Zamowienia z ON p.id_pracownika = z.id_pracownika
GROUP BY p.imie, p.nazwisko;

SELECT nr_zamowienia, imie, nazwisko, nazwa AS rodzaj_pomaranczy, data_zbioru, data_wysylki, (data_wysylki - data_zbioru)
FROM Zamowienia
JOIN Klienci ON Zamowienia.id_klienta = Klienci.id_klienta
JOIN Rodzaj_Pomaranczy R ON Z.id_pomaranczy = R.id_pomaranczy;

SELECT *
FROM Klienci
WHERE nazwisko LIKE 'Ko%';

SELECT *
FROM Rodzaj_Pomaranczy
WHERE nazwa LIKE '%Val%';

SELECT *
FROM Rodzaj_Pomaranczy
WHERE data_zbioru IS NOT NULL;

SELECT
    K.id_klienta,
    K.imie,
    K.nazwisko,
    COUNT(Z.nr_zamowienia) AS liczba_zamowien
FROM
    Klienci K
LEFT JOIN
    Zamowienia Z ON K.id_klienta = Z.id_klienta
GROUP BY
    K.id_klienta,
    K.imie,
    K.nazwisko;


SELECT *
FROM Rodzaj_Pomaranczy R
LEFT JOIN Zamowienia Z ON R.id_pomaranczy = Z.id_pomaranczy
WHERE Z.id_pomaranczy IS NULL;