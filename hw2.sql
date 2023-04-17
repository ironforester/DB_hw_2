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
	singer_id INTEGER references Genre(singer_id),
	genre_id INTEGER references Singer(genre_id)
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
