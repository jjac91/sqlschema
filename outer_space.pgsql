-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE centers_of_orbit
(
  id SERIAL PRIMARY KEY,
  NAME TEXT NOT NULL
)

INSERT INTO centers_of_orbit
  (name)
VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  NAME TEXT NOT NULL
)

INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way');


CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER NOT NULL REFERENCES centers_of_orbit,
  galaxy INTEGER NOT NULL REFERENCES galaxies,
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy)
VALUES
  ('Earth', 1.00, 1, 1),
  ('Mars', 1.88, 1, 1),
  ('Venus', 0.62, 1, 1),
  ('Neptune', 164.8, 1, 1),
  ('Proxima Centauri b', 0.03, 2, 1),
  ('Gliese 876 b', 0.23, 3, 1);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbits INTEGER NOT NULL REFERENCES planets 
)

INSERT INTO moons
(name, orbits)
VALUES
('The Moon',1),
('Phobos',2),
('Deimos',2),
('Naiad',5),
('Thalassa',5),
('Larissa',5),
('S/2004 N 1',5),
('Triton',5),
('Halimede',5),
('Sao',5),
('Laomedeia',5),
('Psamathe',5),
('Neso',5);
