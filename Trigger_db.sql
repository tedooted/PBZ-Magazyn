--1
CREATE OR REPLACE FUNCTION check_availability() RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT ilosc FROM Magazyn WHERE id_pomaranczy = NEW.id_pomaranczy) < 1 THEN
        RAISE EXCEPTION 'Brak wystarczającej ilości pomarańczy w magazynie';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_order
BEFORE INSERT ON Zamowienia
FOR EACH ROW
EXECUTE FUNCTION check_availability();

SELECT * FROM check_availability;

--2
CREATE OR REPLACE FUNCTION update_inventory() RETURNS TRIGGER AS $$
BEGIN
    UPDATE Magazyn
    SET ilosc = ilosc - 1
    WHERE id_pomaranczy = NEW.id_pomaranczy;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_insert_order
AFTER INSERT ON Zamowienia
FOR EACH ROW
EXECUTE FUNCTION update_inventory();

SELECT * FROM update_inventory;
