create table tablo1(
id serial primary key,
networkid inet
)

INSERT INTO tablo1 (networkid) VALUES ('2001:0db8:85a3:0000:0000:8a2e:0370:7334');

select * from tablo1

SELECT '{0,1,2}' as "Dizi";

SELECT ARRAY[ARRAY[0,1],ARRAY[1,2]] as "Dizi";

SELECT TO_CHAR('2016-08-12 16:40:32'::TIMESTAMP,
'"Today is "FMDay", the "DDth" day of the month of "FMMonth" of "YYYY');


CREATE TABLE person (
person_id BIGINT NOT NULL,
last_name VARCHAR(255) NOT NULL,
first_name VARCHAR(255),
age INT NOT NULL,
PRIMARY KEY (person_id)
);

drop table person;

drop table gorev;


CREATE TABLE person (
  person_id serial NOT NULL,
  person_name VARCHAR(255),
  PRIMARY KEY (person_id)
);

CREATE TABLE gorev (
  gorev_id bigserial NOT NULL PRIMARY KEY,
  person_id bigint REFERENCES person(person_id),
  gorev_zaman timestamp
);


select* from person


INSERT INTO person (person_name) VALUES ('John Doe');

insert into person(person_name) values('Muhammed Emir Yılmaz');

insert into person(person_name) values('Mehmet Peker'),('Ebubekir Nazlı'),('Kenan İnce');

SELECT CHAR_LENGTH('ABCDE')

insert into gorev(person_id,gorev_zaman) values(3,NOW());

insert into gorev(person_id,gorev_zaman) values(1,NOW()),(2,NOW()),(4,NOW()),(1,NOW());

select* from person,gorev where person.person_id=gorev.person_id

select person.person_id as "Personel ID",person.person_name as "Personel Adı",gorev.gorev_id as "Görev ID",gorev_zaman as "Görev Zamanı" from person,gorev where person.person_id=gorev.person_id




select person.person_id,person.person_name,gorev.gorev_id,gorev_zaman from gorev left join person on person.person_id=gorev.person_id 


delete from gorev where gorev_id in (1,4)



insert into gorev(person_id,gorev_zaman) values(3,NOW());



CREATE TABLE gorev_log AS SELECT * FROM gorev;


select person.person_id,person.person_name,gorev_log.gorev_id,gorev_log.gorev_zaman from gorev_log left join person on person.person_id=gorev_log.person_id 


truncate gorev

INSERT INTO gorev (person_id, gorev_zaman) SELECT person_id, gorev_zaman FROM gorev_log;



select person.person_id,person.person_name,gorev.gorev_id,gorev_zaman from gorev left join person on person.person_id=gorev.person_id 

delete from gorev where person_id=2

delete from person where person_id=2


update gorev set gorev_id=(gorev_id-7)


create database citi


select person.person_id,person.person_name,gorev.gorev_id,gorev_zaman from gorev join person using (person_id)

SELECT
    person.person_id,
    person.person_name,
    COUNT(gorev.gorev_id) AS toplam_gorev_sayisi
FROM
    person
JOIN
    gorev ON person.person_id = gorev.person_id
GROUP BY
    person.person_id, person.person_name;


