DROP TABLE visits;
DROP TABLE cities;
DROP TABLE countries;

CREATE TABLE countries
(
 id SERIAL8 primary key,
 name VARCHAR(255) not null
 );

CREATE TABLE cities
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  country_id INT8 REFERENCES countries(id)
 );

CREATE TABLE visits
(
  id SERIAL8 primary key,
  start_date VARCHAR(255),
  end_date VARCHAR(255),
  review TEXT,
  city_name VARCHAR(255),
  country_name VARCHAR(255),
  visited BOOLEAN
);
