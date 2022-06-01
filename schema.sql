/* Database schema to keep the structure of entire database. */

-- ANIMALS
CREATE TABLE animals (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric
);

CREATE UNIQUE INDEX animals_pkey ON animals(id int4_ops);

ALTER TABLE animals
    ADD COLUMN species TEXT;

-- OWNERS
CREATE TABLE owners (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name text,
    age integer
);

CREATE UNIQUE INDEX owners_pkey ON owners(id int4_ops);

-- SPECIES
CREATE TABLE species (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text
);

CREATE UNIQUE INDEX species_pkey ON species(id int4_ops);
