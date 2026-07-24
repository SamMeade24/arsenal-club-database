# Arsenal Club Database

A relational database designed from scratch to model key aspects of Arsenal Football Club, including players, managers, matches, competitions, transfers, trophies, and awards.

This project was completed as part of the Codecademy Full-Stack Career Path and demonstrates the process of designing a normalized relational database before implementing it in PostgreSQL.

## Overview

The project follows a database-first approach:

- Identify the entities and their relationships.
- Design a normalized relational schema.
- Create an Entity Relationship Diagram (ERD).
- Implement the database using PostgreSQL.

## Project Goals

- Design a relational database from scratch.
- Apply database normalization principles.
- Model one-to-many and many-to-many relationships.
- Produce a professional ERD using DBML and dbdiagram.io.
- Implement the design in PostgreSQL.

## Entity Relationship Diagram

![ERD](docs/arsenal-club-database-erd.png)

## Database Design

The database was first modelled using DBML and dbdiagram.io before being translated into PostgreSQL.

### Project Files

- `schema.dbml` – Database design source file.
- `schema.sql` – PostgreSQL schema implementation.
- `docs/arsenal-club-database-erd.png` – ERD image.
- `docs/arsenal-club-database-erd.pdf` – Printable ERD.
- `docs/arsenal-club-database-erd.svg` – Scalable vector ERD.

## Technologies Used

- PostgreSQL
- DBML
- dbdiagram.io
- Git
- GitHub

## Database Schema

The database currently contains tables representing:

- Clubs
- Players
- Managers
- Matches
- Competitions
- Seasons
- Stadiums
- Referees
- Positions
- Transfers
- Trophies
- Awards

The design also includes junction tables to model many-to-many relationships between players and positions, and players and matches.

## Future Improvements

Potential future enhancements include:

- Match events (goals, substitutions, bookings)
- Player contracts
- Staff and coaching teams
- Injury records
- Detailed player statistics
- Fan and ticketing data