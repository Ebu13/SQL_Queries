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
VALUES (1, 'Ahmet', 'Yýlmaz', 'ahmet@example.com');

INSERT INTO Musteriler (MusteriID, Ad, Soyad, Email)
VALUES (2, 'Ayþe', 'Kara', 'ayse@example.com');

INSERT INTO Musteriler (MusteriID, Ad, Soyad, Email)
VALUES (3, 'Mehmet', 'Demir', 'mehmet@example.com');

-- Siparisler tablosuna veri ekleme
INSERT INTO Siparisler (SiparisID, MusteriID, Urun, Tarih)
VALUES (1, 1, 'Ürün 1', '2023-09-01');

INSERT INTO Siparisler (SiparisID, MusteriID, Urun, Tarih)
VALUES (2, 1, 'Ürün 2', '2023-09-02');

INSERT INTO Siparisler (SiparisID, MusteriID, Urun, Tarih)
VALUES (3, 2, 'Ürün 3', '2023-09-03');

-- Urunler tablosuna veri ekleme
INSERT INTO Urunler (UrunID, UrunAdi, Fiyat)
VALUES (1, 'Ürün 1', 10.99);

INSERT INTO Urunler (UrunID, UrunAdi, Fiyat)
VALUES (2, 'Ürün 2', 19.99);

INSERT INTO Urunler (UrunID, UrunAdi, Fiyat)
VALUES (3, 'Ürün 3', 5.99);


   SELECT Musteriler.Ad, Musteriler.Soyad, Siparisler.Urun, Siparisler.Tarih
   FROM Musteriler
   INNER JOIN Siparisler ON Musteriler.MusteriID = Siparisler.MusteriID;


      UPDATE Musteriler
   SET Ad = 'Ali', Soyad = 'Yýldýz', Email = 'ali@example.com'
   WHERE MusteriID = 1;


   SELECT Musteriler.Ad, Musteriler.Soyad, Siparisler.Urun, Urunler.Fiyat
   FROM Musteriler
   INNER JOIN Siparisler ON Musteriler.MusteriID = Siparisler.MusteriID
   INNER JOIN Urunler ON Siparisler.Urun = Urunler.UrunAdi
   WHERE Urunler.Fiyat > 10;


      INSERT INTO Musteriler (MusteriID, Ad, Soyad, Email)
   VALUES (4, 'Fatma', 'Yýlmaz', 'fatma@example.com'),
          (5, 'Ali', 'Demir', 'ali@example.com'),
          (6, 'Ayþe', 'Kaya', 'ayse@example.com');


   INSERT INTO Siparisler (SiparisID, MusteriID, Urun, Tarih)
   VALUES (4, 2, 'Ürün 4', '2023-09-04'),
          (5, 3, 'Ürün 5', '2023-09-05'),
          (6, 1, 'Ürün 6', '2023-09-06');

   INSERT INTO Urunler (UrunID, UrunAdi, Fiyat)
   VALUES (4, 'Ürün 4', 14.99),
          (5, 'Ürün 5', 9.99),
          (6, 'Ürün 6', 24.99);
