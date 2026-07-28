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