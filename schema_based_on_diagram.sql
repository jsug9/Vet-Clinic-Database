-- Add patients table

CREATE TABLE patients (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text,
    date_of_birth date
);

CREATE UNIQUE INDEX patients_pkey ON patients(id int4_ops);

-- Add invoices table
CREATE TABLE invoices (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    total_amount numeric,
    generated_at timestamp without time zone,
    payed_at timestamp without time zone,
    "medical_history_
id" integer REFERENCES medical_histories(id)
);

CREATE UNIQUE INDEX invoices_pkey ON invoices(id int4_ops);
CREATE INDEX "medical_history_
id_index" ON invoices("medical_history_
id" int4_ops);

-- Add medical histories table


-- Add invoice items table


-- Add treatments table

