CREATE DATABASE IF NOT EXISTS laravel_master;
USE laravel_master;

CREATE TABLE users(
id                  int(250) auto_increment not null,
role                varchar(15),
name                varchar(15),
surname             varchar(15),
nick                varchar(25),
email               varchar(25),
password            varchar(35),
image               varchar(255),
created_at          datetime,
updated_at          datetime,
remember_token      varchar(125),
CONSTRAINT pk_users PRIMARY KEY(id)
)ENGINE=InnoDb;

INSERT INTO users VALUES(Null, 'user', 'Roberto', 'Cortez', 'Robert_Crtz9', 'roberto@gmail.com', 'pass', null, CURTIME(), CURTIME(), NULL);
INSERT INTO users VALUES(Null, 'user', 'Lionel', 'Messi', 'L10NEL', 'roberto@gmail.com', 'pass', null, CURTIME(), CURTIME(), NULL);
INSERT INTO users VALUES(Null, 'user', 'Sergio', 'Ramos', 'SR4', 'roberto@gmail.com', 'pass', null, CURTIME(), CURTIME(), NULL);

CREATE TABLE IF NOT EXISTS images(
id                  int(250) auto_increment not null,
user_id             int(250),
image_path          varchar(255),
description         varchar(35),
created_at          datetime,
updated_at          datetime,
CONSTRAINT pk_images PRIMARY KEY(id),
CONSTRAINT fk_images_users FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE=InnoDb;
INSERT INTO images VALUES(Null, 1, 'test.jpg', 'Descripcion de prueba 1',CURTIME(), CURTIME());
INSERT INTO images VALUES(Null, 1, 'playa.jpg', 'Descripcion de prueba 2',CURTIME(), CURTIME());
INSERT INTO images VALUES(Null, 1, 'arena.jpg', 'Descripcion de prueba 3',CURTIME(), CURTIME());
INSERT INTO images VALUES(Null, 3, 'familia.jpg', 'Descripcion de prueba 2',CURTIME(), CURTIME());

CREATE TABLE IF NOT EXISTS comments(
id                  int(250) auto_increment not null,
user_id             int(250),
image_id            int(255),
content             text,
created_at          datetime,
updated_at          datetime,
CONSTRAINT pk_comments PRIMARY KEY(id),
CONSTRAINT fk_comments_users FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_comments_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDb;
INSERT INTO comments VALUES(NULL, 1, 4, 'Buena foto de familia!', CURTIME(), CURTIME());
INSERT INTO comments VALUES(NULL, 2, 1, 'Buena foto de playa!', CURTIME(), CURTIME());
INSERT INTO comments VALUES(NULL, 2, 4, 'Que bueno', CURTIME(), CURTIME());

CREATE TABLE IF NOT EXISTS likes(
id                  int(250) auto_increment not null,
user_id             int(250),
image_id            int(255),
created_at          datetime,
updated_at          datetime,
CONSTRAINT pk_likes PRIMARY KEY(id),
CONSTRAINT fk_likes_users FOREIGN KEY(user_id) REFERENCES users(id),
CONSTRAINT fk_likes_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDb;

INSERT INTO likes VALUES(null, 1, 4, CURTIME(), CURTIME());
INSERT INTO likes VALUES(null, 2, 4, CURTIME(), CURTIME());
INSERT INTO likes VALUES(null, 3, 2, CURTIME(), CURTIME());
INSERT INTO likes VALUES(null, 2, 4, CURTIME(), CURTIME());