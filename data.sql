/* Populate database with sample data. */

INSERT INTO "public"."animals"("name","date_of_birth","escape_attempts","neutered","weight_kg")
VALUES
(E'Agumon',E'2020-02-03',0,TRUE,10.23),
(E'Gabumon',E'2018-11-15',2,TRUE,8),
(E'Pikachu',E'2021-01-07',1,FALSE,15.04),
(E'Devimon',E'2017-05-12',5,TRUE,11);

INSERT INTO "public"."animals"("name","date_of_birth","escape_attempts","neutered","weight_kg")
VALUES
(E'Charmander',E'2020-02-08',0,FALSE,-11),
(E'Plantmon',E'2021-11-15',2,TRUE,-5.7),
(E'Squirtle',E'1993-04-02',3,FALSE,-12.13),
(E'Angemon',E'2005-06-12',1,TRUE,-45),
(E'Boarmon',E'2005-06-07',7,TRUE,20.4),
(E'Blossom',E'1998-10-13',3,TRUE,17),
(E'Ditto',E'2022-05-14',4,TRUE,22);

BEGIN;
UPDATE "public"."animals"
SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE "public"."animals"
SET species = 'digimon'
WHERE name LIKE '%mon'; 
UPDATE "public"."animals"
SET species = 'pokemon'
WHERE species is NULL; 
COMMIT;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT delete_by_date;
UPDATE animals
SET weight_kg = weight_kg * -1
