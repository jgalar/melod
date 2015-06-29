CREATE DATABASE melod_db;

/*
 * Asset locators should be extended to point other
 * endpoints than local file systems.
 */
CREATE TABLE ASSETS
(
	locator VARCHAR(1024) NOT NULL,
	/* Date asset was discovered by Melod */
	creation_date DATETIME NOT NULL,
	md5 BINARY(16),
);

CREATE TABLE ARTISTS
(
	id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
	name VARCHAR(128) NOT NULL,
	image_url VARCHAR(1024),
);

CREATE TABLE ALBUMS
(
	id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
	artist_id INT FOREIGN KEY REFERENCES ARTISTS(id),
	name VARCHAR(128) NOT NULL,
	image_url VARCHAR(1024),
	label VARCHAR(128),
	producer_name VARCHAR(128),
	year INT,
	year_edition INT, /* e.g. remaster year */
);

CREATE TABLE SONGS
(
	id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
	asset_id INT FOREIGN KEY REFERENCES ASSETS(id) NOT NULL,
	artist_id INT FOREIGN KEY REFERENCES ARTISTS(id) NOT NULL,
	title VARCHAR(256) NOT NULL,

	/* A song could not be part of an album (a single) */
	album_id INT FOREIGN KEY REFERENCES ALBUM(id),
	composer_name VARCHAR(128),
	track INT,
	disc INT,
	length INT, /* in seconds */
	genre VARCHAR(64),
);
