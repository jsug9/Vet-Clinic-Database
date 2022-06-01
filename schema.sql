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

-- Delete species from animals table.
ALTER TABLE animals 
    DROP COLUMN species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
    ADD species_id INT,
    ADD CONSTRAINT species_id FOREIGN KEY(species_id) REFERENCES species(id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
    ADD owner_id INT,
    ADD CONSTRAINT owner_id FOREIGN KEY(owner_id) REFERENCES owners(id);
