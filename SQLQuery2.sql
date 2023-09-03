-- Musteriler tablosu
CREATE TABLE Musteriler (
  MusteriID INT PRIMARY KEY,
  Ad VARCHAR(50),
  Soyad VARCHAR(50),
  Email VARCHAR(100)
);

-- Siparisler tablosu
CREATE TABLE Siparisler (
  SiparisID INT PRIMARY KEY,
  MusteriID INT,
  Urun VARCHAR(50),
  Tarih DATE,
  FOREIGN KEY (MusteriID) REFERENCES Musteriler(MusteriID)
);

-- Urunler tablosu
CREATE TABLE Urunler (
  UrunID INT PRIMARY KEY,
  UrunAdi VARCHAR(50),
  Fiyat DECIMAL(10, 2)
);

-- Musteriler tablosuna veri ekleme
INSERT INTO Musteriler (MusteriID, Ad, Soyad, Email)
VALUES (1, 'Ahmet', 'Y�lmaz', 'ahmet@example.com');

INSERT INTO Musteriler (MusteriID, Ad, Soyad, Email)
VALUES (2, 'Ay�e', 'Kara', 'ayse@example.com');

INSERT INTO Musteriler (MusteriID, Ad, Soyad, Email)
VALUES (3, 'Mehmet', 'Demir', 'mehmet@example.com');

-- Siparisler tablosuna veri ekleme
INSERT INTO Siparisler (SiparisID, MusteriID, Urun, Tarih)
VALUES (1, 1, '�r�n 1', '2023-09-01');

INSERT INTO Siparisler (SiparisID, MusteriID, Urun, Tarih)
VALUES (2, 1, '�r�n 2', '2023-09-02');

INSERT INTO Siparisler (SiparisID, MusteriID, Urun, Tarih)
VALUES (3, 2, '�r�n 3', '2023-09-03');

-- Urunler tablosuna veri ekleme
INSERT INTO Urunler (UrunID, UrunAdi, Fiyat)
VALUES (1, '�r�n 1', 10.99);

INSERT INTO Urunler (UrunID, UrunAdi, Fiyat)
VALUES (2, '�r�n 2', 19.99);

INSERT INTO Urunler (UrunID, UrunAdi, Fiyat)
VALUES (3, '�r�n 3', 5.99);


   SELECT Musteriler.Ad, Musteriler.Soyad, Siparisler.Urun, Siparisler.Tarih
   FROM Musteriler
   INNER JOIN Siparisler ON Musteriler.MusteriID = Siparisler.MusteriID;


      UPDATE Musteriler
   SET Ad = 'Ali', Soyad = 'Y�ld�z', Email = 'ali@example.com'
   WHERE MusteriID = 1;


   SELECT Musteriler.Ad, Musteriler.Soyad, Siparisler.Urun, Urunler.Fiyat
   FROM Musteriler
   INNER JOIN Siparisler ON Musteriler.MusteriID = Siparisler.MusteriID
   INNER JOIN Urunler ON Siparisler.Urun = Urunler.UrunAdi
   WHERE Urunler.Fiyat > 10;


      INSERT INTO Musteriler (MusteriID, Ad, Soyad, Email)
   VALUES (4, 'Fatma', 'Y�lmaz', 'fatma@example.com'),
          (5, 'Ali', 'Demir', 'ali@example.com'),
          (6, 'Ay�e', 'Kaya', 'ayse@example.com');


   INSERT INTO Siparisler (SiparisID, MusteriID, Urun, Tarih)
   VALUES (4, 2, '�r�n 4', '2023-09-04'),
          (5, 3, '�r�n 5', '2023-09-05'),
          (6, 1, '�r�n 6', '2023-09-06');

   INSERT INTO Urunler (UrunID, UrunAdi, Fiyat)
   VALUES (4, '�r�n 4', 14.99),
          (5, '�r�n 5', 9.99),
          (6, '�r�n 6', 24.99);
