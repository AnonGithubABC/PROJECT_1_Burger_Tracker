DROP TABLE burger_deals;
DROP TABLE burgers;
DROP TABLE eateries;

CREATE TABLE eateries (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE burgers (
  id SERIAL8 primary key,
  name VARCHAR(255),
  price VARCHAR(255),
  eatery_id REFERENCES eateries(id),
);

CREATE TABLE burger_deals (
  id SERIAL8 primary key,
  deal_name VARCHAR(255),
  savings INT8,
  deal_day VARCHAR(255)
  burger_id REFERENCES burgers(id),
  eatery_id REFERENCES eateries(id),
);
