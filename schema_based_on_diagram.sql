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
CREATE TABLE medical_histories (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    admitted_at timestamp without time zone,
    patient_id integer REFERENCES patients(id),
    status character varying
);

CREATE UNIQUE INDEX medical_histories_pkey ON medical_histories(id int4_ops);
CREATE INDEX patient_id_index ON medical_histories(patient_id int4_ops);


-- Add invoice items table
CREATE TABLE invoice_items (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    unit_price numeric,
    quantity integer,
    total_price numeric,
    invoice_id integer REFERENCES invoices(id),
    treatment_id integer REFERENCES treatments(id)
);

CREATE UNIQUE INDEX invoice_items_pkey ON invoice_items(id int4_ops);
CREATE INDEX invoice_id_index ON invoice_items(invoice_id int4_ops);
CREATE INDEX treatment_id ON invoice_items(treatment_id int4_ops);

-- Add treatments table
CREATE TABLE treatments (
    id integer GENERATED ALWAYS AS IDENTITY REFERENCES medical_histories(id),
    type character varying,
    name character varying
);

CREATE UNIQUE INDEX treatments_id_idx ON treatments(id int4_ops);
