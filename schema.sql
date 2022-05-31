/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric
);

CREATE UNIQUE INDEX animals_pkey ON animals(id int4_ops);
