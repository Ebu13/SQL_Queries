-- person tablosunu oluştur
CREATE TABLE person (
    person_id SERIAL PRIMARY KEY,
    person_name VARCHAR(255),
    city VARCHAR(255),
    state_code VARCHAR(255)
);

-- cities tablosunu oluştur
CREATE TABLE cities (
    city_id SERIAL PRIMARY KEY,
    city VARCHAR(255),
    state_code VARCHAR(255)
);


-- person tablosuna veri ekle
INSERT INTO person (person_name, city, state_code)
VALUES
    ('John Doe', 'New York', NULL),
    ('Jane Smith', 'Los Angeles', NULL),
    ('Bob Johnson', 'Chicago', NULL);

-- cities tablosuna veri ekle
INSERT INTO cities (city, state_code)
VALUES
    ('New York', 'NY'),
    ('Los Angeles', 'CA'),
    ('Chicago', 'IL');


-- person tablosundaki state_code'u cities tablosundaki state_code ile güncelle
UPDATE person
SET state_code = cities.state_code
FROM cities
WHERE cities.city = person.city;

select *from person;
select * from cities

drop database citi

