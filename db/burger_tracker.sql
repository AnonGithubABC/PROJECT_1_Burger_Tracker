DROP TABLE IF EXISTS burger_deals;
DROP TABLE IF EXISTS days;
DROP TABLE IF EXISTS burgers;
DROP TABLE IF EXISTS eateries;

CREATE TABLE eateries (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE days (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE burgers (
  id SERIAL8 primary key,
  name VARCHAR(255),
  price INT8,
  eatery_id INT8 REFERENCES eateries(id)
);

CREATE TABLE burger_deals (
  id SERIAL8 primary key,
  deal_name VARCHAR(255),
  day_id INT8 REFERENCES days(id),
  burger_id INT8 REFERENCES burgers(id)
);
