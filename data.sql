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

INSERT INTO public.owners (full_name,age) VALUES
	 ('Sam Smith',34),
	 ('Jennifer Orwell ',19),
	 ('Bob',45),
	 ('Melody Pond',77),
	 ('Dean Winchester',14),
	 ('Jodie Whittaker',38);

INSERT INTO public.species (name) VALUES
	 ('Pokemon'),
	 ('Digimon');
