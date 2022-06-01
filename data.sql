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

-- Add owners to the database.
INSERT INTO public.owners (full_name,age) VALUES
	 ('Sam Smith',34),
	 ('Jennifer Orwell',19),
	 ('Bob',45),
	 ('Melody Pond',77),
	 ('Dean Winchester',14),
	 ('Jodie Whittaker',38);

-- Add species to the database.
INSERT INTO public.species (name) VALUES
	 ('Pokemon'),
	 ('Digimon');

-- Modify your inserted animals so it includes the species_id value
-- Species
UPDATE animals SET species_id= '2' WHERE name LIKE '%mon';
UPDATE animals SET species_id= '1' WHERE species_id IS NULL;

-- Owners
UPDATE animals SET owner_id = owners.id FROM owners WHERE name = 'Agumon' AND owners.full_name= 'Sam Smith' ;
UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Gabumon','Pikachu') AND owners.full_name= 'Jennifer Orwell';
UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Devimon','Plantmon') AND owners.full_name= 'Bob';
UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Charmander','Squirtle', 'Blossom') AND owners.full_name= 'Melody Pond';
UPDATE animals SET owner_id = owners.id FROM owners WHERE name IN ('Angemon','Boarmon') AND owners.full_name= 'Dean Winchester';

-- Add vets
INSERT INTO public.vets ("name",age,date_of_graduation) VALUES
	 ('William Tatcher',45,'2000-04-23'),
	 ('Maisy Smith',26,'2019-01-17'),
	 ('Stephanie Mendez',64,'1981-05-04'),
	 ('Jack Harkness',38,'2008-06-08');

-- Add specializations
INSERT INTO public.specializations (vets_id,species_id) VALUES
	((SELECT id from vets where name = 'William Tatcher'), (SELECT id from species where name = 'Pokemon')),
  ((SELECT id from vets where name = 'Stephanie Mendez'), (SELECT id from species where name = 'Digimon')),
  ((SELECT id from vets where name = 'Stephanie Mendez'), (SELECT id from species where name = 'Pokemon')),
  ((SELECT id from vets where name = 'Jack Harkness'), (SELECT id from species where name = 'Digimon')),

INSERT INTO public.visits (animals_id, vets_id, date_of_visit) VALUES
  ((SELECT id from animals where name = 'Agumon'), (SELECT id from vets where name = 'William Tatcher'), '2020-05-24'),
  ((SELECT id from animals where name = 'Agumon'), (SELECT id from vets where name = 'Stephanie Mendez'), '2020-07-22'),
  ((SELECT id from animals where name = 'Gabumon'), (SELECT id from vets where name = 'Jack Harkness'), '2021-02-02'),
  ((SELECT id from animals where name = 'Pikachu'), (SELECT id from vets where name = 'Maisy Smith'), '2020-01-05'),
  ((SELECT id from animals where name = 'Pikachu'), (SELECT id from vets where name = 'Maisy Smith'), '2020-04-08'),
  ((SELECT id from animals where name = 'Pikachu'), (SELECT id from vets where name = 'Maisy Smith'), '2020-05-14'),
  ((SELECT id from animals where name = 'Devimon'), (SELECT id from vets where name = 'Stephanie Mendez'), '2021-05-04'),
  ((SELECT id from animals where name = 'Charmander'), (SELECT id from vets where name = 'Jack Harkness'), '2021-02-24'),
  ((SELECT id from animals where name = 'Plantmon'), (SELECT id from vets where name = 'Maisy Smith'), '2019-12-21'),
  ((SELECT id from animals where name = 'Plantmon'), (SELECT id from vets where name = 'William Tatcher'), '2020-08-10'),
  ((SELECT id from animals where name = 'Plantmon'), (SELECT id from vets where name = 'Maisy Smith'), '2021-Apr-07'),
  ((SELECT id from animals where name = 'Squirtle'), (SELECT id from vets where name = 'Stephanie Mendez'), '2019-09-29'),
  ((SELECT id from animals where name = 'Angemon'), (SELECT id from vets where name = 'Jack Harkness'), '2020-10-03'),
  ((SELECT id from animals where name = 'Angemon'), (SELECT id from vets where name = 'Jack Harkness'), '2020-11-04'),
  ((SELECT id from animals where name = 'Boarmon'), (SELECT id from vets where name = 'Maisy Smith'), '2019-01-24'),
  ((SELECT id from animals where name = 'Boarmon'), (SELECT id from vets where name = 'Maisy Smith'), '2019-05-15'),
  ((SELECT id from animals where name = 'Boarmon'), (SELECT id from vets where name = 'Maisy Smith'), '2020-02-27'),
  ((SELECT id from animals where name = 'Boarmon'), (SELECT id from vets where name = 'Maisy Smith'), '2020-08-03'),
  ((SELECT id from animals where name = 'Blossom'), (SELECT id from vets where name = 'Stephanie Mendez'), '2020-05-24'),
  ((SELECT id from animals where name = 'Blossom'), (SELECT id from vets where name = 'William Tatcher'), '2021-01-11');