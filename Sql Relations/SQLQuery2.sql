CREATE DATABASE MusicDB

USE MusicDB


CREATE TABLE Artists 
(
    artistId INT PRIMARY KEY IDENTITY,
    artistName VARCHAR(100)
)


CREATE TABLE Albums
(
    albumId INT PRIMARY KEY IDENTITY,
    albumName VARCHAR(150),
    artistId INT,
    FOREIGN KEY (artistId) REFERENCES Artists(artistId)
)


CREATE TABLE Musics 
(
    musicId INT PRIMARY KEY IDENTITY,
    musicName VARCHAR(150),
    totalSeconds INT,
    artistId INT,
    albumId INT,
    FOREIGN KEY (artistId) REFERENCES Artists(artistId),
    FOREIGN KEY (albumId) REFERENCES Albums(albumId)
)


INSERT INTO Artists (artistName) 
VALUES ('H.O.S.T. Alliance'),
       ('D?yirman'),
       ('El?ad Xose')



INSERT INTO Albums (albumName, artistId)
VALUES ('Qan Uduzur', 1),
       ('Sabah Olacaq', 2), 
       ('M?n?m', 3)



INSERT INTO Musics (musicName, totalSeconds, artistId, albumId) 
VALUES ('Qan Uduzur', 250, 1, 1),
       ('Biz Burday?q', 230, 1, 1),
       ('Sabah Olacaq', 240, 2, 2),
       ('Ya Qaraba? Ya Ölüm', 260, 2, 2),
       ('M?n?m', 245, 3, 3),
       ('Bak? ??h?ri', 225, 3, 3)



SELECT m.musicName, m.totalSeconds, a.artistName, al.albumName FROM Musics m
JOIN Artists a 
ON
m.artistId = a.artistId
JOIN Albums al 
ON 
m.albumId = al.albumId



SELECT al.albumName, COUNT(m.musicId) AS musicCount FROM Albums al
LEFT JOIN Musics m 
ON
al.albumId = m.albumId
GROUP BY al.albumId, al.albumName