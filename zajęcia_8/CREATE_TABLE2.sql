
CREATE TABLE Dzia³y (
	Dzia³ VARCHAR(50) PRIMARY KEY,
	Lokalizacja VARCHAR(80)
	);

CREATE TABLE Pracownicy_Stacjonarni (
	ID INT IDENTITY(101,1) PRIMARY KEY,
	Nazwisko VARCHAR(30),
	Dzia³ VARCHAR(50),
	FOREIGN KEY (Dzia³) REFERENCES Dzia³y(Dzia³)
	);

CREATE TABLE Pracownicy_Zdalni (
	ID INT IDENTITY(201,1) PRIMARY KEY,
	Nazwisko VARCHAR(30),
	Dzia³ VARCHAR(50),
	FOREIGN KEY (Dzia³) REFERENCES Dzia³y(Dzia³)
	);

INSERT INTO Pracownicy_Stacjonarni (Nazwisko, Dzia³) VALUES
('Kowalski', 'IT'),
('Nowak', 'HR'),
('Wiœniewski', 'Sprzeda¿'),
('D¹browski', 'IT');
INSERT INTO Pracownicy_Zdalni (Nazwisko, Dzia³) VALUES
('Kowalczyk', 'HR'),
('Nowak', 'HR'),
('Lewandowski', 'Marketing'),
('Kowalski', 'IT');
INSERT INTO Dzia³y (Dzia³, Lokalizacja) VALUES
('IT', 'Kraków'),
('HR', 'Warszawa'),
('Sprzeda¿', 'Gdañsk'),
('Marketing', 'Wroc³aw');

