create table if not exists Genre(
	genre_id SERIAL primary key,
	genre_name VARCHAR(40) not null
);


create table if not exists Singer(
	singer_id SERIAL primary key,
	name VARCHAR(80) not null,
	genre_id INTEGER references Genre(genre_id)
);

create table if not exists Genres_Singers (
	singer_id INTEGER references Genre(genre_id),
	genre_id INTEGER references Singer(singer_id)
);

create table if not exists Album(
	album_id SERIAL primary key,
	album_name VARCHAR(80) not null,
	year_of_release DATE not null,
	singer_id INTEGER not null references Singer(singer_id)
);

create table if not exists Albums_Singers (
	singer_id INTEGER references Singer(singer_id),
	album_id INTEGER references Album(album_id)
);

create table if not exists Track (
	track_id SERIAL primary key,
	track_name VARCHAR(80) not null,
	duration TIME not null,
	album_id INTEGER not null references Album(album_id)
);

create table if not exists Collection (
	collection_id SERIAL primary key,
	collection_name VARCHAR(80) not null,
	year_of_release DATE not null,
	track_id INTEGER not null references Track(track_id)
);

--Доп. задание Сотрудник

create table if not exists Supervisor (
	id SERIAL primary key,
	supervisor_name VARCHAR(80) not null
);

create table if not exists Employee (
	id SERIAL primary key,
	superviser INTEGER references Supervisor(id),
	name VARCHAR(80) not null,
	department VARCHAR(80) not null
);
