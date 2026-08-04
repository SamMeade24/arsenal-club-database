-- QUERIES --

-- List every club alphabetically --
SELECT 
    name, 
    short_name, 
    city
FROM club
ORDER BY name ASC;

-- List every player, ordered alphabetically by last name --
SELECT
    first_name, 
    last_name, 
    country
FROM player
ORDER BY last_name ASC;

-- Display every stadium, ordered by capacity from largest to smallest --
SELECT
    name, 
    city,
    capacity
FROM stadium
ORDER BY capacity DESC;

-- Display managers and the club they manage --
SELECT
    manager.first_name, 
    manager.last_name, 
    club.name AS club_name
FROM manager
JOIN club
    ON manager.club_id = club.club_id
ORDER BY manager.last_name;

-- Display each club alongside their stadium --
SELECT
    club.name AS club_name, 
    stadium.name AS stadium_name, 
    stadium.capacity
FROM club
JOIN stadium
    ON club.stadium_id = stadium.stadium_id
ORDER BY club.name;

-- Display match day information, ordered by date --
SELECT
    match.match_date, 
    home_club.name AS home_club,
    match.home_score, 
    match.away_score,
    away_club.name AS away_club
FROM match
JOIN club AS home_club
    ON match.home_club_id = home_club.club_id
JOIN club as away_club
    ON match.away_club_id = away_club.club_id
ORDER BY match.match_date;

-- Display player transfers, ordered by highest transfer value --
SELECT
    player.first_name,
    player.last_name,
    selling_club.name AS selling_club,
    buying_club.name AS buying_club,
    transfer.transfer_value AS transfer_fee,
    transfer.transfer_type
FROM transfer
JOIN player
    ON transfer.player_id = player.player_id
JOIN club AS selling_club
    ON transfer.from_club_id = selling_club.club_id
JOIN club AS buying_club
    ON transfer.to_club_id = buying_club.club_id
ORDER BY transfer_fee DESC;

-- Count players at each club, ordered by highest player count --
SELECT 
    club.name AS club_name,
    COUNT(player.player_id) AS player_count
FROM club
JOIN player
    ON club.club_id = player.club_id
GROUP BY club.name
ORDER BY player_count DESC;

-- Display the average stadium capacity across all stadiums --
SELECT
    AVG(stadium.capacity) AS average_capacity
FROM stadium;

-- Display the highest transfer fee in the database --
SELECT
    MAX(transfer.transfer_value) AS highest_transfer_fee
FROM transfer;

-- Display the smallest transfer fee in the database --
SELECT
    MIN(transfer.transfer_value) AS smallest_transfer_fee
FROM transfer;

-- Display all left-footed players --
SELECT
    first_name,
    last_name,
    preferred_foot
FROM player
WHERE preferred_foot = 'Left'
ORDER BY last_name;

-- Display transfer fees in millions --
SELECT
    player.first_name,
    player.last_name,
    ROUND(transfer.transfer_value / 1000000.0, 1) AS transfer_fee_million
FROM transfer
JOIN player
    ON transfer.player_id = player.player_id
ORDER BY transfer_fee_million DESC;

-- Display all player nationalities --
SELECT DISTINCT
    country
FROM player
ORDER BY country;

-- Display clubs with more than two players --
SELECT
    club.name AS club_name,
    COUNT(player.player_id) AS player_count
FROM club
JOIN player
    ON club.club_id = player.club_id
GROUP BY club.name
HAVING COUNT(player.player_id) > 2
ORDER BY player_count DESC;

-- Display players whose surname begins with M --
SELECT
    first_name,
    last_name
FROM player
WHERE last_name LIKE 'M%'
ORDER BY last_name;

-- Display transfers between £30m and £60m --
SELECT
    player.first_name,
    player.last_name,
    transfer.transfer_value
FROM transfer
JOIN player
    ON transfer.player_id = player.player_id
WHERE transfer.transfer_value BETWEEN 30000000 AND 60000000
ORDER BY transfer.transfer_value DESC;

-- Categorise transfer fees --
SELECT
    player.first_name,
    player.last_name,
    transfer.transfer_value,
    CASE
        WHEN transfer.transfer_value >= 50000000 THEN 'High'
        WHEN transfer.transfer_value >= 35000000 THEN 'Medium'
        ELSE 'Low'
    END AS transfer_category
FROM transfer
JOIN player
    ON transfer.player_id = player.player_id
ORDER BY transfer.transfer_value DESC;