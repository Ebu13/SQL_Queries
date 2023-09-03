CREATE TABLE Musteriler (
MusteriID INT PRIMARY KEY,
Ad VARCHAR(50),
Soyad VARCHAR(50),
Email VARCHAR(100)
);

INSERT INTO Musteriler (MusteriID, Ad, Soyad, Email)
VALUES (1, 'Ahmet', 'Y�lmaz', 'ahmet@example.com');

INSERT INTO Musteriler (MusteriID, Ad, Soyad, Email)
VALUES (2, 'Ay�e', 'Kara', 'ayse@example.com');

INSERT INTO Musteriler (MusteriID, Ad, Soyad, Email)
VALUES (3, 'Mehmet', 'Demir', 'mehmet@example.com');

SELECT * FROM Musteriler;


UPDATE Musteriler
SET Ad = 'Ali', Soyad = 'Y�ld�z'
WHERE MusteriID = 2;


DROP TABLE Musteriler;