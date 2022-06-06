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

-- VETS
CREATE TABLE vets (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text,
    age integer,
    date_of_graduation date
);

CREATE UNIQUE INDEX vets_pkey ON vets(id int4_ops);

-- Join table specializations
CREATE TABLE specializations (
    vets_id integer REFERENCES vets(id) ON DELETE CASCADE,
    species_id integer REFERENCES species(id) ON DELETE CASCADE,
    CONSTRAINT specializations_pkey PRIMARY KEY (vets_id, species_id)
);

CREATE UNIQUE INDEX specializations_pkey ON specializations(vets_id int4_ops,species_id int4_ops);

-- Join table vists
CREATE TABLE visits (
    vets_id integer REFERENCES vets(id) ON DELETE CASCADE,
    animals_id integer REFERENCES animals(id) ON DELETE CASCADE,
    date_of_visit date,
    CONSTRAINT visits_pkey PRIMARY KEY (vets_id, animals_id, date_of_visit)
);

CREATE UNIQUE INDEX visits_pkey ON visits(vets_id int4_ops,animals_id int4_ops,date_of_visit date_ops);

-- Add mail column to owners
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
