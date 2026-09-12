-- ========================================================
-- 1. SOCCER VENUE TABLE
-- ========================================================

-- Schema
CREATE TABLE soccer_venue (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(100) NOT NULL,
    city_id INT NOT NULL,
    aud_capacity INT
);

-- Insert Data
INSERT INTO soccer_venue (venue_id, venue_name, city_id, aud_capacity) VALUES
(20001, 'Stade de Bordeaux', 10003, 42115),
(20002, 'Stade Bollaert-Delelis', 10004, 38223),
(20003, 'Stade Pierre Mauroy', 10005, 49822),
(20004, 'Stade de Lyon', 10006, 58585),
(20005, 'Stade VElodrome', 10007, 64354),
(20006, 'Stade de Nice', 10008, 35624),
(20007, 'Parac des Princes', 10001, 47294),
(20008, 'Stade de France', 10002, 80100),
(20009, 'Stade Geoffroy Guichard', 10009, 42000),
(20010, 'Stadium de Toulouse', 10010, NULL);

-- Query: Count the number of venues for EURO cup 2016
SELECT COUNT(*) AS number_of_venues
FROM soccer_venue;


-- ========================================================
-- 2. PLAYER MAST TABLE
-- ========================================================

-- Schema
CREATE TABLE player_mast (
    player_id INT PRIMARY KEY,
    team_id INT NOT NULL,
    jersey_no INT,
    player_name VARCHAR(100) NOT NULL,
    posi_to_play VARCHAR(5),
    dt_of_bir DATE,
    age INT,
    playing_club VARCHAR(100)
);

-- Insert Data
INSERT INTO player_mast (player_id, team_id, jersey_no, player_name, posi_to_play, dt_of_bir, age, playing_club) VALUES
(160001, 1201, 1, 'Etrit Berisha', 'GK', '1989-03-10', 27, 'Lazio'),
(160008, 1201, 2, 'Andi Lila', 'DF', '1986-02-12', 30, 'Giannina'),
(160016, 1201, 3, 'Ermir Lenjani', 'MF', '1989-08-05', 26, 'Nantes'),
(160007, 1201, 4, 'Elseid Hysaj', 'DF', '1994-02-20', 22, 'Napoli'),
(160013, 1201, 5, 'Lorik Cana', 'MF', '1983-07-27', 32, 'Nantes'),
(160010, 1201, 6, 'Frederic Veseli', 'DF', '1992-11-20', 23, 'Lugano'),
(160004, 1201, 7, 'Ansi Agolli', 'DF', '1982-10-11', 33, 'Qarabag'),
(160012, 1201, 8, 'Migjen Basha', 'MF', '1987-01-05', 29, 'Como'),
(160017, 1201, 9, 'Ledian Memushaj', 'MF', '1986-12-17', 29, 'Pescara'),
(160548, 1224, 23, 'Simon Church', 'FD', '1988-12-10', 27, 'MK Dons');

-- Query: Count the number of countries that participated in the 2016-EURO Cup
SELECT COUNT(DISTINCT team_id) AS count
FROM player_mast;

