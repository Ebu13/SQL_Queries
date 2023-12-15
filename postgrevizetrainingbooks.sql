CREATE DATABASE books_db 

CREATE TABLE books (
id SERIAL PRIMARY KEY,
client TEXT NOT NULL,
DATA JSONb NOT NULL
);

INSERT INTO books(client, DATA) VALUES (
'Joe',
'{ "title": "Siddhartha", "author": { "first_name": "Herman", "last_name": "Hesse" } }'
),(
'Jenny',
'{ "title": "Dharma Bums", "author": { "first_name": "Jack", "last_name": "Kerouac" } }'
),(
'Jenny',
'{ "title": "100 años de soledad", "author": { "first_name": "Gabo", "last_name": "Marquéz" }
}'
);


select * from books

SELECT id, client, DATA->>'title' AS Başlık, DATA->'author'->>'first_name' as YazarAdı,DATA->'author'->>'last_name' as YazarSoyadı FROM books;

truncate books

INSERT INTO books(client, DATA) VALUES 
('Joe', '{ "title": "Siddhartha", "author": { "first_name": "Herman", "last_name": "Hesse" } }'),
('Jenny', '{ "title": "Dharma Bums", "author": { "first_name": "Jack", "last_name": "Kerouac" } }'),
('Jenny', '{ "title": "100 años de soledad", "author": { "first_name": "Gabo", "last_name": "Marquéz" } }'),
('Alice', '{ "title": "To Kill a Mockingbird", "author": { "first_name": "Harper", "last_name": "Lee" } }'),
('Bob', '{ "title": "1984", "author": { "first_name": "George", "last_name": "Orwell" } }'),
('Charlie', '{ "title": "The Great Gatsby", "author": { "first_name": "F. Scott", "last_name": "Fitzgerald" } }'),
('David', '{ "title": "One Hundred Years of Solitude", "author": { "first_name": "Gabriel", "last_name": "García Márquez" } }'),
('Emma', '{ "title": "Brave New World", "author": { "first_name": "Aldous", "last_name": "Huxley" } }'),
('Frank', '{ "title": "The Catcher in the Rye", "author": { "first_name": "J.D.", "last_name": "Salinger" } }'),
('Grace', '{ "title": "The Lord of the Rings", "author": { "first_name": "J.R.R.", "last_name": "Tolkien" } }'),
('Henry', '{ "title": "The Hobbit", "author": { "first_name": "J.R.R.", "last_name": "Tolkien" } }'),
('Ivy', '{ "title": "Pride and Prejudice", "author": { "first_name": "Jane", "last_name": "Austen" } }'),
('Jack', '{ "title": "The Odyssey", "author": { "first_name": "Homer", "last_name": "" } }'),
('Kelly', '{ "title": "Crime and Punishment", "author": { "first_name": "Fyodor", "last_name": "Dostoevsky" } }'),
('Liam', '{ "title": "The Brothers Karamazov", "author": { "first_name": "Fyodor", "last_name": "Dostoevsky" } }');

alter table books drop column client;

SELECT id, DATA->>'title' AS Başlık, DATA->'author'->>'first_name' as YazarAdı,DATA->'author'->>'last_name' as YazarSoyadı FROM books;

update books set id=(id-4)

update books set id=(id+1)

