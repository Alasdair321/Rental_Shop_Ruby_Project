DROP TABLE IF EXISTS leases_log;
DROP TABLE IF EXISTS leases;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS customers;


CREATE TABLE equipment (
  id SERIAL PRIMARY KEY,
  type VARCHAR(255),
  size VARCHAR(255),
  total_quantity INT4,
  cost INT4
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  surname VARCHAR(255),
  contact_number VARCHAR(255),
  contact_email VARCHAR(255)
);

CREATE TABLE leases (
  id SERIAL PRIMARY KEY,
  equipment_id INT4 REFERENCES equipment(id) ON DELETE CASCADE,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  start_date DATE,
  end_date DATE,
  number_leased INT4
);

CREATE TABLE leases_Log (
  id SERIAL PRIMARY KEY,
  lease_id INT4,
  equipment_type VARCHAR(255),
  equipment_size VARCHAR(255),
  equipment_cost INT4,
  customer_first_name VARCHAR(255),
  customer_surname VARCHAR(255),
  customer_contact_number VARCHAR(255),
  customer_contact_email VARCHAR(255),
  start_date DATE,
  end_date DATE,
  number_leased INT4
);
