-- Zwiększ ilość pomarańczy Valencia w magazynie o 500
UPDATE Magazyn SET ilosc = ilosc + 500 WHERE id_pomaranczy = 1;

-- Zaktualizuj numer telefonu klienta o numerze 2
UPDATE Klienci SET numer_telefonu = '999888777' WHERE numer_klienta = 2;

-- Zaktualizuj ilość pomarańczy w zamówieniu o numerze 4
UPDATE Zamowienia SET ilosc = 120 WHERE nr_zamowienia = 4;

-- Zaktualizuj datę dostawy dla dostawy o numerze 3
UPDATE Dostawy SET data_dostawy = '2024-05-30' WHERE id_dostawy = 3;

-- Zaktualizuj rodzaj ciężarówki dla transportu o numerze 5
UPDATE Transport SET rodzaj_ciezarowki = 'Średnia ciężarówka' WHERE id_transportu = 5;
