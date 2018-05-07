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
  countries_id references countries(id)
);

CREATE TABLE visits
(
  id SERIAL8 primary key,
  city_id INT8 references cities(id),
  country_id INT8 references countries(id)
);
