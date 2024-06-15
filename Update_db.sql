UPDATE Magazyn SET ilosc = ilosc + 500 WHERE id_pomaranczy = 1;

UPDATE Klienci SET numer_telefonu = '999888777' WHERE numer_klienta = 2;

UPDATE Zamowienia SET ilosc = 120 WHERE nr_zamowienia = 4;

UPDATE Dostawy SET data_dostawy = '2024-05-30' WHERE id_dostawy = 3;

UPDATE Transport SET rodzaj_ciezarowki = 'Średnia ciężarówka' WHERE id_transportu = 5;
