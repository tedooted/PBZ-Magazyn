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
JOIN Zamowienia z ON p.id_pracownika = z.id_pracownika
GROUP BY p.imie, p.nazwisko;

