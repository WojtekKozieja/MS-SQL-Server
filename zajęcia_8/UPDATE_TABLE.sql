UPDATE Studenci
SET Rok_Studiow-=1
WHERE StudentID=1

UPDATE Kursy
SET ECTS-=1
WHERE KursID=11

SELECT *
FROM Zapisy

CREATE INDEX idx_Stundent
ON Studenci(Nazwisko)

ALTER TABLE Studenci
ADD email VARCHAR(100)

UPDATE Studenci
SET email = 'akowalska@student.edu.pl'
WHERE Nazwisko = 'Kowalska'

UPDATE Studenci
SET email = 'jnowak@student.edu.pl'
WHERE Nazwisko = 'Nowak'

UPDATE Studenci
SET email = 'pzielinski@student.edu.pl'
WHERE Nazwisko = 'Zieliñski'

SELECT *
FROM Studenci
WHERE email IS NULL

DELETE
FROM Studenci
WHERE StudentID=5

ALTER TABLE Studenci
ALTER COLUMN email VARCHAR(50)





