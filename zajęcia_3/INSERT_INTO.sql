INSERT INTO Kursy
(Nazwa_Kursu, ECTS)
VALUES
('Bazy Danych', 6),
('Algorytmy', 6),
('Sieci Komputerowe', 4),
('Programowanie obiektowe',6)

INSERT INTO Studenci
(Imie, Nazwisko, Rok_Studiow)
VALUES
('Anna','Kowalska',1),
('Jan', 'Nowak', 2),
('Marta', 'Lewandowska', 3),
('Piotr', 'Zieliñski', 1),
('Kamil', 'Zawadzki', 2)


INSERT INTO Zapisy
(StudentID, KursID, Data_Zapisu)
VALUES
(1,10, '1-10-2025'),
(1,11, '1-10-2025'),
(2,10, '3-10-2025'),
(3,12, '4-10-2025'),
(4,13, '4-10-2025')


