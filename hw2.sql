-Исправил ошибки согласно Вашим рекомендациям, заменил тип данных в поле Альбом и Коллекция из date в integer, чтобы удобнее было заполнять таблицу данными, тк
при использовании date нужно ещё вводить день и месяц. Может ещё какие то ограничения посоветуте внести...



CREATE TABLE IF NOT EXISTS Genre(
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(40) NOT NULL UNIQUE 
);


CREATE TABLE IF NOT EXISTS Singer(
	singer_id SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL
);


CREATE TABLE IF NOT EXISTS Genres_Singers (
singer_id INTEGER REFERENCES Singer(singer_id),
genre_id INTEGER REFERENCES Genre(genre_id),
CONSTRAINT pk PRIMARY KEY(singer_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Album(
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(80) NOT NULL,
	year_of_release INTEGER NOT NULL CHECK(1990<=year_of_release AND year_of_release <=2023)
);

CREATE TABLE IF NOT EXISTS Albums_Singers (
	singer_id INTEGER REFERENCES Singer(singer_id),
	album_id INTEGER REFERENCES Album(album_id),
	CONSTRAINT ak PRIMARY KEY(singer_id, album_id)
);

CREATE TABLE IF NOT EXISTS Track (
	track_id SERIAL PRIMARY KEY,
	track_name VARCHAR(80) NOT NULL,
	duration INTEGER NOT NULL CHECK(duration>=30 AND duration <=600),
	album_id INTEGER NOT NULL REFERENCES Album(album_id)
);


CREATE TABLE IF NOT EXISTS Collection (
	collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(80) NOT NULL,
	year_of_release INTEGER NOT NULL CHECK(2000<=year_of_release AND year_of_release <=2023)
);

--Доп. задание Сотрудник


CREATE TABLE IF NOT EXISTS Employee (
	id SERIAL PRIMARY KEY,
	name VARCHAR(80) not null,
	department VARCHAR(80) not null,
	superviser INTEGER REFERENCES Employee (id)
);
