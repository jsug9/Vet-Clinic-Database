-- Add patients table

CREATE TABLE patients (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text,
    date_of_birth date
);

CREATE UNIQUE INDEX patients_pkey ON patients(id int4_ops);
