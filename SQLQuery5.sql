CREATE TABLE Ogrenciler (
    OgrenciID INT PRIMARY KEY,
    Ad VARCHAR(50),
    Soyad VARCHAR(50),
    Sinif VARCHAR(10)
);

CREATE TABLE Dersler (
    DersID INT PRIMARY KEY,
    DersAdi VARCHAR(50),
    Kredi INT
);

CREATE TABLE Notlar (
    NotID INT PRIMARY KEY,
    OgrenciID INT,
    DersID INT,
    Note FLOAT,
    FOREIGN KEY (OgrenciID) REFERENCES Ogrenciler(OgrenciID),
    FOREIGN KEY (DersID) REFERENCES Dersler(DersID)
);

INSERT INTO Ogrenciler (OgrenciID, Ad, Soyad, Sinif)
VALUES (1, 'Ali', 'Yýlmaz', '9A'),
(2, 'Ayþe', 'Demir', '10B'),
(3, 'Mehmet', 'Kaya', '11C'),
(4, 'Fatma', 'Öztürk', '9B'),
(5, 'Ahmet', 'Çelik', '12A'),
(6, 'Zeynep', 'Aydýn', '10A'),
(7, 'Mustafa', 'Arslan', '11B'),
(8, 'Elif', 'Kara', '9C'),
(9, 'Hakan', 'Þahin', '12B'),
(10, 'Selin', 'Koç', '10C');
INSERT INTO Dersler (DersID, DersAdi, Kredi)
VALUES (1, 'Matematik', 4),
(2, 'Fizik', 3),
(3, 'Kimya', 2),
(4, 'Türkçe', 5),
(5, 'Ýngilizce', 3),
(6, 'Biyoloji', 2),
(7, 'Coðrafya', 2),
(8, 'Tarih', 3),
(9, 'Müzik', 1),
(10, 'Bedensel Eðitim', 1);
INSERT INTO Notlar (NotID, OgrenciID, DersID, Note)
VALUES (1, 1, 1, 85),
(2, 1, 2, 75),
(3, 1, 3, 90),
(4, 2, 1, 95),
(5, 2, 2, 80),
(6, 2, 3, 70),
(7, 3, 1, 90),
(8, 3, 2, 85),
(9, 3, 3, 95),
(10, 4, 1, 80);

SELECT Ogrenciler.Ad, Ogrenciler.Soyad, Dersler.DersAdi, Notlar.Note
FROM Ogrenciler
JOIN Notlar ON Ogrenciler.OgrenciID = Notlar.OgrenciID
JOIN Dersler ON Notlar.DersID = Dersler.DersID;

INSERT INTO Notlar (NotID, OgrenciID, DersID, Note)
VALUES
(11, 1, 4, 85),
(12, 2, 2, 90),
(13, 3, 1, 75),
(14, 4, 3, 95),
(15, 5, 5, 80),
(16, 6, 1, 70),
(17, 7, 3, 90),
(18, 8, 2, 85),
(19, 9, 4, 95),
(20, 10, 5, 80);

DELETE FROM Notlar
WHERE OgrenciID IN (
SELECT n.OgrenciID
FROM Notlar n
JOIN Ogrenciler o ON n.OgrenciID = o.OgrenciID
JOIN Dersler d ON n.DersID = d.DersID
WHERE o.Ad = d.DersAdi
);


--1. Tüm öðrencilerin ad ve soyadlarýný listele:
   SELECT Ad, Soyad FROM Ogrenciler;

--2. Tüm derslerin adlarýný ve kredilerini listele:
   SELECT DersAdi, Kredi FROM Dersler;

--3. Her öðrencinin aldýðý derslerin adlarýný ve notlarýný listele:
   SELECT o.Ad, o.Soyad, d.DersAdi, n.Note
   FROM Ogrenciler o
   JOIN Notlar n ON o.OgrenciID = n.OgrenciID
   JOIN Dersler d ON n.DersID = d.DersID;

--4. Bir öðrencinin aldýðý derslerin adlarýný ve notlarýný listele (Öðrenci ID: 1):
   SELECT o.Ad, o.Soyad, d.DersAdi, n.Note
   FROM Ogrenciler o
   JOIN Notlar n ON o.OgrenciID = n.OgrenciID
   JOIN Dersler d ON n.DersID = d.DersID
   WHERE o.OgrenciID = 1;

--5. Bir dersin alan öðrencilerin adlarýný ve notlarýný listele (Ders ID: 2):
   SELECT o.Ad, o.Soyad, d.DersAdi, n.Note
   FROM Ogrenciler o
   JOIN Notlar n ON o.OgrenciID = n.OgrenciID
   JOIN Dersler d ON n.DersID = d.DersID
   WHERE d.DersID = 2;

--6. Notu 70'in üzerinde olan öðrencilerin adlarýný ve notlarýný listele:
   SELECT o.Ad, o.Soyad, n.Note
   FROM Ogrenciler o
   JOIN Notlar n ON o.OgrenciID = n.OgrenciID
   WHERE n.Note > 70;

--7. Notu 80'in altýnda olan öðrencilerin adlarýný ve notlarýný listele:
   SELECT o.Ad, o.Soyad, n.Note
   FROM Ogrenciler o
   JOIN Notlar n ON o.OgrenciID = n.OgrenciID
   WHERE n.Note < 80;

--8. Her öðrencinin aldýðý ders sayýsýný ve not ortalamasýný listele:
   SELECT o.Ad, o.Soyad, COUNT(n.DersID) AS AldigiDersSayisi, AVG(n.Note) AS NotOrtalamasi
   FROM Ogrenciler o
   JOIN Notlar n ON o.OgrenciID = n.OgrenciID
   GROUP BY o.Ad, o.Soyad;

--9. En yüksek notu alan öðrencinin adýný, soyadýný ve notunu listele:
   SELECT o.Ad, o.Soyad, MAX(n.Note) AS EnYuksekNot
   FROM Ogrenciler o
   JOIN Notlar n ON o.OgrenciID = n.OgrenciID
   GROUP BY o.Ad, o.Soyad
   ORDER BY EnYuksekNot DESC
   LIMIT 1;

--10. En düþük notu alan öðrencinin adýný, soyadýný ve notunu listele:
    SELECT o.Ad, o.Soyad, MIN(n.Note) AS EnDusukNot
    FROM Ogrenciler o
    JOIN Notlar n ON o.OgrenciID = n.OgrenciID
    GROUP BY o.Ad, o.Soyad
    ORDER BY EnDusukNot ASC
    LIMIT 1;

--Bu sorgularý tek seferde vermek için aþaðýdaki SQL sorgusunu kullanabilirsiniz:

SELECT Ad, Soyad FROM Ogrenciler;
SELECT DersAdi, Kredi FROM Dersler;
SELECT o.Ad, o.Soyad, d.DersAdi, n.Note
FROM Ogrenciler o
JOIN Notlar n ON o.OgrenciID = n.OgrenciID
JOIN Dersler d ON n.DersID = d.DersID;
SELECT o.Ad, o.Soyad, d.DersAdi, n.Note
FROM Ogrenciler o
JOIN Notlar n ON o.OgrenciID = n.OgrenciID
JOIN Dersler d ON n.DersID = d.DersID
WHERE o.OgrenciID = 1;
SELECT o.Ad, o.Soyad, d.DersAdi, n.Note
FROM Ogrenciler o
JOIN Notlar n ON o.OgrenciID = n.OgrenciID
JOIN Dersler d ON n.DersID = d.DersID
WHERE d.DersID = 2;
SELECT o.Ad, o.Soyad, n.Note
FROM Ogrenciler o
JOIN Notlar n ON o.OgrenciID = n.OgrenciID
WHERE n.Note > 70;
SELECT o.Ad, o.Soyad, n.Note
FROM Ogrenciler o
JOIN Notlar n ON o.OgrenciID = n.OgrenciID
WHERE n.Note < 80;
SELECT o.Ad, o.Soyad, COUNT(n.DersID) AS AldigiDersSayisi, AVG(n.Note) AS NotOrtalamasi
FROM Ogrenciler o
JOIN Notlar n ON o.OgrenciID = n.OgrenciID
GROUP BY o.Ad, o.Soyad;
SELECT o.Ad, o.Soyad, MAX(n.Note) AS EnYuksekNot
FROM Ogrenciler o
JOIN Notlar n ON o.OgrenciID = n.OgrenciID
GROUP BY o.Ad, o.Soyad
ORDER BY EnYuksekNot DESC;
SELECT o.Ad, o.Soyad, MIN(n.Note) AS EnDusukNot
FROM Ogrenciler o
JOIN Notlar n ON o.OgrenciID = n.OgrenciID
GROUP BY o.Ad, o.Soyad
ORDER BY EnDusukNot ASC;