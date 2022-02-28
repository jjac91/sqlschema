-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic
CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
)

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL,
)

INSERT INTO airlines
  (airline_name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL,
)

INSERT INTO countries
  (country_name)
VALUES
  ('United States'),
  ('Japan'),
  ('France'),
  ('UAE'),
  ('Brazil'),
  ('United Kingdom'),
  ('Mexico'),
  ('Morocco'),
  ('China'),
  ('Chile');

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL,
  country INTEGER REFERENCES countries,
)

INSERT INTO cities
  (city_name, countries)
VALUES
  ('Washington DC', 1),
  ('Seattle', 1),
  ('Los Angeles', 1),
  ('Las Vegas', 1),
  ('New York', 1),
  ('Charlotte', 1),
  ('Cedar Rapids', 1),
  ('Chicago', 1),
  ('New Orleans', 1),
  ('Tokyo', 2),
  ('London', 6),
  ('Mexico City', 7),
  ('Paris', 3),
  ('Casablanca', 8),
  ('Dubai', 4),
  ('Beijing', 9),
  ('Paris', 3),
  ('Sao Paolo', 5),
  ('Santiago', 10);


CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  owned_by INTEGER REFERENCES passengers,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INTEGER REFERENCES airlines,
  from_city INTEGER REFERENCES cities,
  from_country INTEGER REFERENCES countries,
  to_city INTEGER REFERENCES cities,
  to_country INTEGER REFERENCES countries
);



INSERT INTO tickets
  (owned_by, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 2, 1),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 11, 2, 12, 6),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 1, 4, 1),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 1, 13, 7),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 14, 3, 15, 8),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 16, 4, 17, 9),
  (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 5, 1, 6, 1),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 7, 1, 8, 1),
  (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 6, 1, 9, 1),
  (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 18, 5, 19, 10);