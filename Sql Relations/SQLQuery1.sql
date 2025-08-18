CREATE DATABASE MovieDB
USE MovieDB


CREATE TABLE Directors (
    directorId INT PRIMARY KEY IDENTITY,
    directorName VARCHAR(100)
)

CREATE TABLE Actors (
    actorId INT PRIMARY KEY IDENTITY,
    actorName VARCHAR(100)
)


CREATE TABLE Genres (
    genreId INT PRIMARY KEY IDENTITY,
    genreName VARCHAR(50)
)


CREATE TABLE Movies (
    movieId INT PRIMARY KEY IDENTITY,
    title VARCHAR(200),
    imdb FLOAT,
    duration INT,
    genreId INT,
    directorId INT,
    FOREIGN KEY (genreId) REFERENCES Genres(genreId),
    FOREIGN KEY (directorId) REFERENCES Directors(directorId)
)


CREATE TABLE MovieActors (
    movieId INT,
    actorId INT,
    PRIMARY KEY (movieId, actorId),
    FOREIGN KEY (movieId) REFERENCES Movies(movieId),
    FOREIGN KEY (actorId) REFERENCES Actors(actorId)
)


INSERT INTO Directors (directorName)
VALUES ('Christopher Nolan'),
       ('Quentin Tarantino'),
       ('James Cameron')



INSERT INTO Actors (actorName)
VALUES ('Leonardo DiCaprio'),
       ('Brad Pitt'),
       ('Christian Bale'),
       ('Kate Winslet')


INSERT INTO Genres (genreName)
VALUES ('Drama'),
       ('Action'),
       ('Romance'),
       ('Sci-Fi')


INSERT INTO Movies (title, imdb, duration, genreId, directorId)
VALUES ('Inception', 8.8, 148, 4, 1),
       ('Titanic', 7.8, 195, 3, 3),
       ('The Dark Knight', 9.0, 152, 2, 1),
       ('Once Upon a Time in Hollywood', 7.6, 161, 1, 2),
       ('Fight Club', 8.8, 139, 1, 2)



INSERT INTO MovieActors (movieId, actorId) 
VALUES (1, 1), 
       (1, 3),
       (2, 1),
       (2, 4),
       (3, 3),
       (4, 1),
       (4, 2),
       (5, 2)


SELECT m.title, m.imdb, g.genreName, d.directorName, a.actorName
FROM Movies m
JOIN Genres g 
ON 
m.genreId = g.genreId
JOIN Directors d 
ON
m.directorId = d.directorId
JOIN MovieActors ma 
ON 
m.movieId = ma.movieId
JOIN Actors a 
ON
ma.actorId = a.actorId
WHERE m.imdb > 6



SELECT m.title, m.imdb, g.genreName FROM Movies m
JOIN Genres g 
ON
m.genreId = g.genreId
WHERE g.genreName LIKE '%a%'


SELECT m.title, m.imdb, m.duration, g.genreName FROM Movies m
JOIN Genres g 
ON 
m.genreId = g.genreId
WHERE LEN(m.title) > 10 AND m.title LIKE '%t'


SELECT m.title, m.imdb, g.genreName, d.directorName, a.actorName FROM Movies m
JOIN Genres g
ON
m.genreId = g.genreId
JOIN Directors d 
ON
m.directorId = d.directorId
JOIN MovieActors ma 
ON
m.movieId = ma.movieId
JOIN Actors a 
ON
ma.actorId = a.actorId
WHERE m.imdb > (SELECT AVG(imdb) FROM Movies) ORDER BY m.imdb DESC