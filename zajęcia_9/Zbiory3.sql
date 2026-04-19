--1
SELECT Nazwisko
FROM Pracownicy_Stacjonarni
UNION
SELECT Nazwisko
FROM Pracownicy_Zdalni;

--2
SELECT Dzia³
FROM Pracownicy_Stacjonarni
UNION ALL
SELECT Dzia³
FROM Pracownicy_Zdalni;

--3
SELECT Nazwisko, Dzia³
FROM Pracownicy_Stacjonarni
INTERSECT
SELECT Nazwisko, Dzia³
FROM Pracownicy_Zdalni;

--4
SELECT Nazwisko, Dzia³
FROM Pracownicy_Stacjonarni
EXCEPT
SELECT Nazwisko, Dzia³
FROM Pracownicy_Zdalni;

--5
SELECT ID, Nazwisko, Dzia³y.Dzia³
FROM Pracownicy_Stacjonarni
CROSS JOIN Dzia³y;