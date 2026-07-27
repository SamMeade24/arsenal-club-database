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
    competition_type VARCHAR(100) NOT NULL 
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