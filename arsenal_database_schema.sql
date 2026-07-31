-- CREATE TABLES --

CREATE TABLE stadium (
    stadium_id INTEGER PRIMARY KEY, 
    name VARCHAR(100) NOT NULL, 
    city VARCHAR(50) NOT NULL, 
    country VARCHAR(50) NOT NULL, 
    capacity INTEGER NOT NULL, 
    opened_year INTEGER
);

CREATE TABLE season (
    season_id INTEGER PRIMARY KEY, 
    name VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE competition (
    competition_id INTEGER PRIMARY KEY, 
    name VARCHAR(100) NOT NULL, 
    country VARCHAR(50) NOT NULL,
    competition_type VARCHAR(25) NOT NULL 
);

CREATE TABLE referee (
    referee_id INTEGER PRIMARY KEY, 
    first_name VARCHAR(50) NOT NULL, 
    last_name VARCHAR(50) NOT NULL, 
    date_of_birth DATE, 
    country VARCHAR(50) NOT NULL
);

CREATE TABLE position (
    position_id INTEGER PRIMARY KEY, 
    name VARCHAR(25) NOT NULL UNIQUE, 
    position_group VARCHAR(25) NOT NULL
);

CREATE TABLE club (
    club_id INTEGER PRIMARY KEY, 
    name VARCHAR(50) NOT NULL UNIQUE, 
    short_name VARCHAR(3) NOT NULL, 
    city VARCHAR(50) NOT NULL, 
    country VARCHAR(50) NOT NULL, 
    founded INTEGER, 
    stadium_id INTEGER REFERENCES stadium(stadium_id)
);

CREATE TABLE player (
    player_id INTEGER PRIMARY KEY, 
    first_name VARCHAR(50) NOT NULL, 
    last_name VARCHAR(50) NOT NULL, 
    date_of_birth DATE,
    country VARCHAR(50) NOT NULL,
    preferred_foot VARCHAR(5) NOT NULL, 
    club_id INTEGER REFERENCES club(club_id) 
);

CREATE TABLE manager (
    manager_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL, 
    last_name VARCHAR(50) NOT NULL, 
    date_of_birth DATE,
    country VARCHAR(50) NOT NULL,
    club_id INTEGER REFERENCES club(club_id) 
);

CREATE TABLE match (
    match_id INTEGER PRIMARY KEY, 
    match_date DATE NOT NULL,
    home_score INTEGER NOT NULL, 
    away_score INTEGER NOT NULL, 
    season_id INTEGER REFERENCES season(season_id), 
    competition_id INTEGER REFERENCES competition(competition_id), 
    stadium_id INTEGER REFERENCES stadium(stadium_id), 
    referee_id INTEGER REFERENCES referee(referee_id), 
    home_club_id INTEGER REFERENCES club(club_id), 
    away_club_id INTEGER REFERENCES club(club_id) 
);

CREATE TABLE transfer (
    transfer_id INTEGER PRIMARY KEY, 
    date_of_transfer DATE NOT NULL, 
    transfer_value INTEGER NOT NULL, 
    transfer_type VARCHAR(20) NOT NULL, 
    player_id INTEGER NOT NULL REFERENCES player(player_id), 
    season_id INTEGER NOT NULL REFERENCES season(season_id), 
    from_club_id INTEGER NOT NULL REFERENCES club(club_id), 
    to_club_id INTEGER NOT NULL REFERENCES club(club_id)
);

CREATE TABLE trophy (
    trophy_id INTEGER PRIMARY KEY, 
    competition_id INTEGER NOT NULL REFERENCES competition(competition_id), 
    season_id INTEGER NOT NULL REFERENCES season(season_id)
);

CREATE TABLE award (
    award_id INTEGER PRIMARY KEY, 
    name VARCHAR(50) NOT NULL, 
    player_id INTEGER REFERENCES player(player_id), 
    manager_id INTEGER REFERENCES manager(manager_id), 
    season_id INTEGER NOT NULL REFERENCES season(season_id)
);

CREATE TABLE player_match (
    player_id INTEGER NOT NULL REFERENCES player(player_id), 
    match_id INTEGER NOT NULL REFERENCES match(match_id), 
    goals INTEGER,
    assists INTEGER,  
    yellow_cards INTEGER, 
    red_cards INTEGER, 
    minutes INTEGER NOT NULL, 
    PRIMARY KEY (player_id, match_id)
);

CREATE TABLE player_position (
    player_id INTEGER NOT NULL REFERENCES player(player_id), 
    position_id INTEGER NOT NULL REFERENCES position(position_id), 
    PRIMARY KEY (player_id, position_id)
);

-- SEED DATA --

-- Stadiums -- 
INSERT INTO stadium (
    stadium_id, 
    name, 
    city,
    country, 
    capacity, 
    opened_year
)
VALUES
    (1, 'Emirates Stadium', 'London', 'England', 60704, 2006), 
    (2, 'Villa Park', 'Birmingham', 'England', 43205, 1897), 
    (3, 'Vitality Stadium', 'Bournemouth', 'England', 11307, 1910), 
    (4, 'Amex Stadium', 'Brighton', 'England', 31876, 2011),
    (5, 'Brentford Community Stadium', 'London', 'England', 17250, 2020),
    (6, 'Stamford Bridge', 'London', 'England', 40341, 1877),
    (7, 'Selhurst Park', 'London', 'England', 25486, 1924),
    (8, 'Hill Dickinson Stadium', 'Liverpool', 'England', 52769, 2025),
    (9, 'Craven Cottage', 'London', 'England', 29589, 1896),
    (10, 'Elland Road', 'Leeds', 'England', 37890, 1897),
    (11, 'Anfield', 'Liverpool', 'England', 61276, 1884),
    (12, 'Etihad Stadium', 'Manchester', 'England', 53400, 2003),
    (13, 'Old Trafford', 'Manchester', 'England', 74310, 1910),
    (14, 'St James'' Park', 'Newcastle upon Tyne', 'England', 52305, 1892),
    (15, 'City Ground', 'Nottingham', 'England', 30445, 1898),
    (16, 'Stadium of Light', 'Sunderland', 'England', 48707, 1997),
    (17, 'Tottenham Hotspur Stadium', 'London', 'England', 62850, 2019),
    (18, 'London Stadium', 'London', 'England', 62500, 2012),
    (19, 'Molineux Stadium', 'Wolverhampton', 'England', 31750, 1889), 
    (20, 'Turf Moor', 'Burnley', 'England', 21994, 1883), 
    (21, 'Wembley Stadium', 'London', 'England', 90000, 2007);

-- Seasons -- 
INSERT INTO season (
    season_id, 
    name
)
VALUES
  (1, '1992/93'),
  (2, '1993/94'),
  (3, '1994/95'),
  (4, '1995/96'),
  (5, '1996/97'),
  (6, '1997/98'),
  (7, '1998/99'),
  (8, '1999/00'),
  (9, '2000/01'),
  (10, '2001/02'),
  (11, '2002/03'),
  (12, '2003/04'),
  (13, '2004/05'),
  (14, '2005/06'),
  (15, '2006/07'),
  (16, '2007/08'),
  (17, '2008/09'),
  (18, '2009/10'),
  (19, '2010/11'),
  (20, '2011/12'),
  (21, '2012/13'),
  (22, '2013/14'),
  (23, '2014/15'),
  (24, '2015/16'),
  (25, '2016/17'),
  (26, '2017/18'),
  (27, '2018/19'),
  (28, '2019/20'),
  (29, '2020/21'),
  (30, '2021/22'),
  (31, '2022/23'),
  (32, '2023/24'),
  (33, '2024/25'),
  (34, '2025/26'),
  (35, '2026/27');

-- Competitions -- 
INSERT INTO competition (
    competition_id, 
    name, 
    country, 
    competition_type
)
VALUES
    (1, 'Premier League', 'England', 'League'), 
    (2, 'FA Cup', 'England', 'Cup'), 
    (3, 'League Cup', 'England', 'Cup');

-- Referees -- 
INSERT INTO referee (
    referee_id, 
    first_name, 
    last_name, 
    date_of_birth, 
    country
)
VALUES 
    (1, 'Stuart', 'Attwell', '1982-10-06', 'England'), 
    (2, 'Peter', 'Bankes', '1982-05-18', 'England'), 
    (3, 'Samuel', 'Barrott', NULL , 'England'), 
    (4, 'Darren', 'Bond', '1986-01-01', 'England'),
    (5, 'Tom', 'Bramall', '1989-11-09', 'England'),
    (6, 'John', 'Brooks', '1990-04-01', 'England'),
    (7, 'Darren', 'England', '1985-12-23', 'England'),
    (8, 'Jarred', 'Gillett', '1986-11-01', 'Australia'),
    (9, 'Tony', 'Harrington', '1979-09-07', 'England'),
    (10, 'Simon', 'Hooper', '1982-07-20', 'England'),
    (11, 'Andy', 'Madley', '1983-09-05', 'England'),
    (12, 'Chris', 'Kavanagh', '1985-10-24', 'England'),
    (13, 'Rob', 'Jones', '1987-04-04', 'England'),
    (14, 'Craig', 'Pawson', '1979-03-02', 'England'),
    (15, 'Michael', 'Oliver', '1985-02-20', 'England'),
    (16, 'Tim', 'Robinson', NULL, 'England'),
    (17, 'Michael', 'Salisbury', NULL, 'England'),
    (18, 'Anthony', 'Taylor', '1978-10-20', 'England'),
    (19, 'Paul', 'Tierney', '1980-12-25', 'England'),
    (20, 'Lewis', 'Smith', NULL, 'England'),
    (21, 'Farai', 'Hallam', NULL, 'England'),
    (22, 'Adam', 'Herczeg', NULL, 'England'),
    (23, 'Tom', 'Kirk', NULL, 'England'),
    (24, 'Ruebyn', 'Ricardo', NULL, 'England'),
    (25, 'Ben', 'Toner', NULL, 'England');

-- Positions -- 
INSERT INTO position (
    position_id, 
    name, 
    position_group
)
VALUES 
    (1, 'Goalkeeper', 'Goalkeeper'), 
    (2, 'Centre-Back', 'Defender'), 
    (3, 'Full-Back', 'Defender'), 
    (4, 'Defensive Midfielder', 'Midfielder'), 
    (5, 'Central Midfielder', 'Midfielder'), 
    (6, 'Attacking Midfielder', 'Midfielder'), 
    (7, 'Winger', 'Forward'), 
    (8, 'Striker', 'Forward');

-- Clubs -- 
INSERT INTO club (
    club_id, 
    name, 
    short_name, 
    city, 
    country, 
    founded, 
    stadium_id
)
VALUES
    (1, 'Arsenal', 'ARS', 'London', 'England', 1886, 1), 
    (2, 'Aston Villa', 'AVL', 'Birmingham', 'England', 1874, 2), 
    (3, 'AFC Bournemouth', 'BOU', 'Bournemouth', 'England', 1899, 3), 
    (4, 'Brighton & Hove Albion', 'BHA', 'Brighton', 'England', 1901, 4),
    (5, 'Brentford', 'BRE', 'London', 'England', 1889, 5),
    (6, 'Chelsea', 'CHE', 'London', 'England', 1905, 6),
    (7, 'Crystal Palace', 'CRY', 'London', 'England', 1905, 7),
    (8, 'Everton', 'EVE', 'Liverpool', 'England', 1878, 8),
    (9, 'Fulham', 'FUL', 'London', 'England', 1879, 9),
    (10, 'Leeds United', 'LEE', 'Leeds', 'England', 1919, 10),
    (11, 'Liverpool', 'LIV', 'Liverpool', 'England', 1892, 11),
    (12, 'Manchester City', 'MCI', 'Manchester', 'England', 1880, 12),
    (13, 'Manchester United', 'MUN', 'Manchester', 'England', 1878, 13),
    (14, 'Newcastle United', 'NEW', 'Newcastle upon Tyne', 'England', 1892, 14),
    (15, 'Nottingham Forest', 'NFO', 'Nottingham', 'England', 1865, 15),
    (16, 'Sunderland', 'SUN', 'Sunderland', 'England', 1879, 16),
    (17, 'Tottenham Hotspur', 'TOT', 'London', 'England', 1882, 17),
    (18, 'West Ham United', 'WHU', 'London', 'England', 1895, 18),
    (19, 'Wolverhampton Wanderers', 'WOL', 'Wolverhampton', 'England', 1877, 19),
    (20, 'Burnley', 'BUR', 'Burnley', 'England', 1882, 20);

-- Players --
INSERT INTO player (
    player_id, 
    first_name, 
    last_name, 
    date_of_birth, 
    country, 
    preferred_foot,
    club_id 
)
VALUES 
    (1, 'David', 'Raya', '1995-09-15', 'Spain', 'Right', 1),
    (2, 'Gabriel', 'dos Santos Magalhães', '1997-12-19', 'Brazil', 'Left', 1),
    (3, 'Bukayo', 'Saka', '2001-09-05', 'England', 'Left', 1),
    (4, 'John', 'McGinn', '1994-10-18', 'Scotland', 'Left', 2),
    (5, 'Eli Junior', 'Éric Anatole Rainha Kroupi', '2006-06-23', 'France', 'Right', 3), 
    (6, 'Morgan', 'Rogers', '2002-07-26', 'England', 'Right', 2),
    (7, 'Ezri', 'Konsa', '1997-10-23', 'England', 'Right', 2),
    (8, 'Justin', 'Kluivert', '1999-05-05', 'Netherlands', 'Right', 3),
    (9, 'Dean', 'Huijsen', '2005-04-14', 'Spain', 'Right', 3),
    (10, 'Bart', 'Verbruggen', '2002-08-18', 'Netherlands', 'Right', 4),
    (11, 'João', 'Pedro', '2001-09-26', 'Brazil', 'Right', 4),
    (12, 'Kaoru', 'Mitoma', '1997-05-20', 'Japan', 'Right', 4),
    (13, 'Bryan', 'Mbeumo', '1999-08-07', 'Cameroon', 'Left', 5),
    (14, 'Nathan', 'Collins', '2001-04-30', 'Republic of Ireland', 'Right', 5),
    (15, 'Mikkel', 'Damsgaard', '2000-07-03', 'Denmark', 'Right', 5),
    (16, 'Cole', 'Palmer', '2002-05-06', 'England', 'Left', 6),
    (17, 'Moisés', 'Caicedo', '2001-11-02', 'Ecuador', 'Right', 6),
    (18, 'Levi', 'Colwill', '2003-02-26', 'England', 'Left', 6), 
    (19, 'Eberechi', 'Eze', '1998-06-29', 'England', 'Right', 7),
    (20, 'Marc', 'Guéhi', '2000-07-13', 'England', 'Right', 7),
    (21, 'Adam', 'Wharton', '2004-02-06', 'England', 'Left', 7),
    (22, 'Jordan', 'Pickford', '1994-03-07', 'England', 'Left', 8),
    (23, 'Jarrad', 'Branthwaite', '2002-06-27', 'England', 'Left', 8),
    (24, 'Iliman', 'Ndiaye', '2000-03-06', 'Senegal', 'Right', 8),
    (25, 'Bernd', 'Leno', '1992-03-04', 'Germany', 'Right', 9),
    (26, 'Antonee', 'Robinson', '1997-08-08', 'United States', 'Left', 9),
    (27, 'Emile', 'Smith Rowe', '2000-07-28', 'England', 'Right', 9),
    (28, 'Ethan', 'Ampadu', '2000-09-14', 'Wales', 'Right', 10),
    (29, 'Daniel', 'James', '1997-11-10', 'Wales', 'Right', 10),
    (30, 'Joël', 'Piroe', '1999-08-02', 'Netherlands', 'Right', 10),
    (31, 'Virgil', 'van Dijk', '1991-07-08', 'Netherlands', 'Right', 11),
    (32, 'Mohamed', 'Salah', '1992-06-15', 'Egypt', 'Left', 11),
    (33, 'Florian', 'Wirtz', '2003-05-03', 'Germany', 'Right', 11), 
    (34, 'Erling', 'Haaland', '2000-07-21', 'Norway', 'Left', 12),
    (35, 'Phil', 'Foden', '2000-05-28', 'England', 'Left', 12),
    (36, 'Rodri', 'Hernández', '1996-06-22', 'Spain', 'Right', 12),
    (37, 'Bruno', 'Fernandes', '1994-09-08', 'Portugal', 'Right', 13),
    (38, 'Kobbie', 'Mainoo', '2005-04-19', 'England', 'Right', 13),
    (39, 'Matthijs', 'de Ligt', '1999-08-12', 'Netherlands', 'Right', 13),
    (40, 'Alexander', 'Isak', '1999-09-21', 'Sweden', 'Right', 14),
    (41, 'Anthony', 'Gordon', '2001-02-24', 'England', 'Right', 14),
    (42, 'Sandro', 'Tonali', '2000-05-08', 'Italy', 'Right', 14),
    (43, 'Morgan', 'Gibbs-White', '2000-01-27', 'England', 'Right', 15),
    (44, 'Murillo', 'Santiago Costa dos Santos', '2002-07-04', 'Brazil', 'Left', 15),
    (45, 'Elliot', 'Anderson', '2002-11-06', 'Scotland', 'Right', 15),
    (46, 'Jobe', 'Bellingham', '2005-09-23', 'England', 'Right', 16),
    (47, 'Enzo', 'Le Fée', '2000-02-03', 'France', 'Left', 16),
    (48, 'Wilson', 'Isidor', '2000-08-27', 'France', 'Right', 16), 
    (49, 'Son', 'Heung-min', '1992-07-08', 'South Korea', 'Right', 17),
    (50, 'James', 'Maddison', '1996-11-23', 'England', 'Right', 17),
    (51, 'Micky', 'van de Ven', '2001-04-19', 'Netherlands', 'Left', 17),
    (52, 'Jarrod', 'Bowen', '1996-12-20', 'England', 'Left', 18),
    (53, 'Mohammed', 'Kudus', '2000-08-02', 'Ghana', 'Left', 18),
    (54, 'Max', 'Kilman', '1997-05-23', 'England', 'Left', 18),
    (55, 'Matheus', 'Cunha', '1999-05-27', 'Brazil', 'Right', 19),
    (56, 'Rayan', 'Aït-Nouri', '2001-06-06', 'Algeria', 'Left', 19),
    (57, 'João', 'Gomes', '2001-02-12', 'Brazil', 'Right', 19),
    (58, 'James', 'Trafford', '2002-10-10', 'England', 'Right', 20),
    (59, 'Josh', 'Brownhill', '1995-12-19', 'England', 'Right', 20),
    (60, 'Zian', 'Flemming', '1998-08-01', 'Netherlands', 'Right', 20);

-- Managers --
INSERT INTO manager (
    manager_id,
    first_name, 
    last_name, 
    date_of_birth, 
    country, 
    club_id
)
VALUES
    (1, 'Mikel', 'Arteta', '1982-03-26', 'Spain', 1),
    (2, 'Unai', 'Emery', '1971-11-03', 'Spain', 2),
    (3, 'Marco', 'Rose', '1976-09-11', 'Germany', 3), 
    (4, 'Fabian', 'Hürzeler', '1993-02-26', 'Germany', 4),
    (5, 'Keith', 'Andrews', '1980-09-13', 'Republic of Ireland', 5),
    (6, 'Xabi', 'Alonso', '1981-11-25', 'Spain', 6),
    (7, 'Pierre', 'Sage', '1979-05-05', 'France', 7),
    (8, 'David', 'Moyes', '1963-04-25', 'Scotland', 8),
    (9, 'Álvaro', 'Arbeloa', '1983-01-17', 'Spain', 9),
    (10, 'Daniel', 'Farke', '1976-10-30', 'Germany', 10),
    (11, 'Andoni', 'Iraola', '1982-06-22', 'Spain', 11),
    (12, 'Enzo', 'Maresca', '1980-02-10', 'Italy', 12),
    (13, 'Michael', 'Carrick', '1981-07-28', 'England', 13),
    (14, 'Eddie', 'Howe', '1977-11-29', 'England', 14),
    (15, 'Oliver', 'Glasner', '1974-08-28', 'Austria', 15),
    (16, 'Régis', 'Le Bris', '1975-12-02', 'France', 16),
    (17, 'Roberto', 'De Zerbi', '1979-06-06', 'Italy', 17),
    (18, 'Nuno', 'Espírito Santo', '1974-01-25', 'Portugal', 18),
    (19, 'Cesar', 'Peixoto', '1980-05-18', 'Portugal', 19),
    (20, 'Scott', 'Parker', '1980-10-13', 'England', 20);

-- Matches --
INSERT INTO match (
    match_id, 
    match_date, 
    home_score, 
    away_score,
    season_id, 
    competition_id, 
    stadium_id, 
    referee_id, 
    home_club_id, 
    away_club_id
)
VALUES
    (1, '2025-08-15', 4, 2, 34, 1, 11, 18, 11, 3),   -- Liverpool v Bournemouth (Anthony Taylor)
    (2, '2025-08-16', 0, 0, 34, 1, 2, 14, 2, 14),    -- Aston Villa v Newcastle (Craig Pawson)
    (3, '2025-08-16', 1, 1, 34, 1, 4, 3, 4, 9),      -- Brighton v Fulham (Sam Barrott)
    (4, '2025-08-17', 3, 1, 34, 1, 15, 13, 15, 5),   -- Nottingham Forest v Brentford (Rob Jones)
    (5, '2025-08-16', 3, 0, 34, 1, 16, 15, 16, 18),  -- Sunderland v West Ham (Michael Oliver)
    (6, '2025-08-16', 3, 0, 34, 1, 17, 8, 17, 20),   -- Tottenham v Burnley (Jarred Gillett)
    (7, '2025-08-16', 0, 4, 34, 1, 19, 2, 19, 12),   -- Wolves v Manchester City (Peter Bankes)
    (8, '2025-08-17', 0, 0, 34, 1, 6, 7, 6, 7),      -- Chelsea v Crystal Palace (Darren England)
    (9, '2025-08-17', 0, 1, 34, 1, 13, 10, 13, 1),   -- Manchester United v Arsenal (Simon Hooper)
    (10, '2025-08-18', 1, 0, 34, 1, 10, 12, 10, 8),  -- Leeds United v Everton (Chris Kavanagh)
    (11, '2025-08-22', 1, 5, 34, 1, 18, 15, 18, 6),  -- West Ham v Chelsea (Michael Oliver)
    (12, '2025-08-23', 1, 1, 34, 1, 2, 18, 2, 10),   -- Aston Villa v Leeds (Anthony Taylor)
    (13, '2025-08-23', 2, 2, 34, 1, 3, 13, 3, 19),   -- Bournemouth v Wolves (Rob Jones)
    (14, '2025-08-23', 2, 2, 34, 1, 5, 2, 5, 16),    -- Brentford v Sunderland (Peter Bankes)
    (15, '2025-08-23', 2, 1, 34, 1, 20, 12, 20, 17), -- Burnley v Tottenham (Chris Kavanagh)
    (16, '2025-08-23', 2, 1, 34, 1, 7, 10, 7, 14),   -- Crystal Palace v Newcastle (Simon Hooper)
    (17, '2025-08-23', 1, 2, 34, 1, 8, 3, 8, 9),     -- Everton v Fulham (Sam Barrott)
    (18, '2025-08-24', 0, 2, 34, 1, 13, 7, 13, 11),  -- Manchester United v Liverpool (Darren England)
    (19, '2025-08-24', 2, 0, 34, 1, 15, 14, 15, 4),  -- Nottingham Forest v Brighton (Craig Pawson)
    (20, '2025-08-24', 3, 2, 34, 1, 1, 8, 1, 12),    -- Arsenal v Manchester City (Jarred Gillett)
    (21, '2026-05-16', 0, 1, 34, 2, 21, 7, 6, 12),   -- Chelsea v Manchester City (Darren England) - FA Cup Final
    (22, '2026-03-22', 0, 2, 34, 3, 21, 2, 1, 12);   -- Arsenal v Manchester City (Peter Bankes) - League Cup Final

-- Transfers --
INSERT INTO transfer (
    transfer_id, 
    date_of_transfer, 
    transfer_value, 
    transfer_type, 
    player_id, 
    season_id, 
    from_club_id, 
    to_club_id
)
VALUES
    (1, '2025-06-10', 62000000, 'Permanent', 55, 34, 19, 13), -- Matheus Cunha: Wolves -> Man United
    (2, '2025-06-09', 36000000, 'Permanent', 56, 34, 19, 12), -- Rayan Aït-Nouri: Wolves -> Man City
    (3, '2025-06-11', 31000000, 'Permanent', 58, 34, 12, 20), -- James Trafford: Man City -> Burnley
    (4, '2025-07-02', 60000000, 'Permanent', 11, 34, 4, 6),   -- João Pedro: Brighton -> Chelsea
    (5, '2025-07-10', 55000000, 'Permanent', 53, 34, 18, 17); -- Mohammed Kudus: West Ham -> Tottenham

-- Trophies --
INSERT INTO trophy (
    trophy_id,
    competition_id,
    season_id
)
VALUES
    (1, 1, 34), -- Premier League 2025/26
    (2, 2, 34), -- FA Cup 2025/26
    (3, 3, 34); -- League Cup 2025/26

-- Awards --
INSERT INTO award (
    award_id,
    name,
    player_id,
    manager_id,
    season_id
)
VALUES
    (1, 'Player of the Season', 34, NULL, 34),      -- Erling Haaland
    (2, 'Young Player of the Season', 3, NULL, 34), -- Bukayo Saka
    (3, 'Golden Boot', 34, NULL, 34),               -- Erling Haaland
    (4, 'Golden Glove', 1, NULL, 34),               -- David Raya
    (5, 'Manager of the Season', NULL, 1, 34);      -- Mikel Arteta

-- Player/Match Stats --
INSERT INTO player_match (
    player_id,
    match_id,
    goals,
    assists,
    yellow_cards,
    red_cards,
    minutes
)
VALUES
    (32, 1, 2, 1, 0, 0, 90), -- Mohamed Salah
    (33, 1, 1, 1, 0, 0, 90), -- Florian Wirtz
    (34, 7, 3, 0, 0, 0, 90), -- Erling Haaland
    (35, 7, 1, 2, 1, 0, 90), -- Phil Foden
    (3, 9, 1, 0, 0, 0, 90),  -- Bukayo Saka
    (1, 9, 0, 0, 1, 0, 90),  -- David Raya
    (16, 11, 2, 1, 0, 0, 90), -- Cole Palmer
    (11, 11, 1, 1, 0, 0, 82), -- João Pedro
    (52, 11, 0, 1, 1, 0, 90), -- Jarrod Bowen
    (34, 20, 2, 0, 0, 0, 90), -- Erling Haaland
    (35, 20, 0, 2, 0, 0, 90), -- Phil Foden
    (3, 20, 1, 0, 1, 0, 90),  -- Bukayo Saka
    (50, 15, 1, 0, 1, 0, 88), -- James Maddison
    (19, 16, 1, 0, 0, 0, 90), -- Eberechi Eze
    (40, 16, 1, 1, 0, 0, 90); -- Alexander Isak

-- Player Positions --
INSERT INTO player_position (
    player_id,
    position_id
)
VALUES
    (1, 1),   -- David Raya - Goalkeeper
    (2, 2),   -- Gabriel - Centre-Back
    (3, 7),   -- Bukayo Saka - Winger
    (4, 5),   -- John McGinn - Central Midfielder
    (5, 8),   -- Eli Junior Kroupi - Striker
    (6, 6),   -- Morgan Rogers - Attacking Midfielder
    (7, 2),   -- Ezri Konsa - Centre-Back
    (8, 7),   -- Justin Kluivert - Winger
    (9, 2),   -- Dean Huijsen - Centre-Back
    (10, 1),  -- Bart Verbruggen - Goalkeeper
    (11, 8),  -- João Pedro - Striker
    (12, 7),  -- Kaoru Mitoma - Winger
    (13, 7),  -- Bryan Mbeumo - Winger
    (14, 2),  -- Nathan Collins - Centre-Back
    (15, 6),  -- Mikkel Damsgaard - Attacking Midfielder
    (16, 6),  -- Cole Palmer - Attacking Midfielder
    (17, 4),  -- Moisés Caicedo - Defensive Midfielder
    (18, 2),  -- Levi Colwill - Centre-Back
    (19, 6),  -- Eberechi Eze - Attacking Midfielder
    (20, 2),  -- Marc Guéhi - Centre-Back
    (21, 5),  -- Adam Wharton - Central Midfielder
    (22, 1),  -- Jordan Pickford - Goalkeeper
    (23, 2),  -- Jarrad Branthwaite - Centre-Back
    (24, 8),  -- Iliman Ndiaye - Striker
    (25, 1),  -- Bernd Leno - Goalkeeper
    (26, 3),  -- Antonee Robinson - Full-Back
    (27, 6),  -- Emile Smith Rowe - Attacking Midfielder
    (28, 4),  -- Ethan Ampadu - Defensive Midfielder
    (29, 7),  -- Daniel James - Winger
    (30, 8),  -- Joël Piroe - Striker
    (31, 2),  -- Virgil van Dijk - Centre-Back
    (32, 7),  -- Mohamed Salah - Winger
    (33, 6),  -- Florian Wirtz - Attacking Midfielder
    (34, 8),  -- Erling Haaland - Striker
    (35, 6),  -- Phil Foden - Attacking Midfielder
    (36, 4),  -- Rodri - Defensive Midfielder
    (37, 6),  -- Bruno Fernandes - Attacking Midfielder
    (38, 5),  -- Kobbie Mainoo - Central Midfielder
    (39, 2),  -- Matthijs de Ligt - Centre-Back
    (40, 8),  -- Alexander Isak - Striker
    (41, 7),  -- Anthony Gordon - Winger
    (42, 5),  -- Sandro Tonali - Central Midfielder
    (43, 6),  -- Morgan Gibbs-White - Attacking Midfielder
    (44, 2),  -- Murillo - Centre-Back
    (45, 5),  -- Elliot Anderson - Central Midfielder
    (46, 5),  -- Jobe Bellingham - Central Midfielder
    (47, 5),  -- Enzo Le Fée - Central Midfielder
    (48, 8),  -- Wilson Isidor - Striker
    (49, 7),  -- Son Heung-min - Winger
    (50, 6),  -- James Maddison - Attacking Midfielder
    (51, 2),  -- Micky van de Ven - Centre-Back
    (52, 7),  -- Jarrod Bowen - Winger
    (53, 7),  -- Mohammed Kudus - Winger
    (54, 2),  -- Max Kilman - Centre-Back
    (55, 8),  -- Matheus Cunha - Striker
    (56, 3),  -- Rayan Aït-Nouri - Full-Back
    (57, 5),  -- João Gomes - Central Midfielder
    (58, 1),  -- James Trafford - Goalkeeper
    (59, 5),  -- Josh Brownhill - Central Midfielder
    (60, 8);  -- Zian Flemming - Striker
