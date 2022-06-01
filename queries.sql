/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE '[2016-01-01, 2019-12-31]'::daterange @> date_of_birth;
SELECT name FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name in ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3; 

-- Update the animals table by setting the species column to unspecified.
BEGIN;
UPDATE "public"."animals"
SET species = 'unspecified';

-- Roll back the change.
ROLLBACK;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
BEGIN;
UPDATE "public"."animals"
SET species = 'digimon'
WHERE name LIKE '%mon'; 

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE "public"."animals"
SET species = 'pokemon'
WHERE species is NULL; 

-- Commit the transaction.
COMMIT;

-- TRANSACTIONS
-- Delete all animals born after Jan 1st, 2022.
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

-- Create a savepoint for the transaction.
SAVEPOINT delete_by_date;

-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals
SET weight_kg = weight_kg * -1

-- Rollback to the savepoint
ROLLBACK TO delete_by_date;

-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

-- Commit transaction
SELECT * from animals;
COMMIT;

-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, SUM(escape_attempts)
FROM animals
GROUP BY neutered
ORDER BY sum DESC
LIMIT 1;

-- Note: This query returns only the row with the highest sum.

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' and '2000-12-31' GROUP BY species;

-- QUERIES USING JOIN
-- What animals belong to Melody Pond?
SELECT name FROM animals WHERE owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond');

-- List of all animals that are pokemon (their type is Pokemon).
SELECT name FROM animals WHERE species_id = (SELECT id FROM species WHERE name = 'Pokemon');

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT full_name, name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT species.name, COUNT(*) from animals JOIN species ON species.id = animals.species_id GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT name FROM animals WHERE owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell');

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT name FROM animals WHERE owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') AND escape_attempts = 0;

-- Who owns the most animals?
SELECT full_name, COUNT(*) FROM owners LEFT JOIN animals ON owners.id = animals.owner_id GROUP BY full_name ORDER BY COUNT(*) DESC LIMIT 1;

-- QUERIES USING JOIN TABLES
-- Who was the last animal seen by William Tatcher?
SELECT animals.name FROM vets 
  JOIN visits ON vets.id = visits.vets_id
  JOIN animals ON animals.id = visits.animals_id
  WHERE vets.name = 'William Tatcher'
  ORDER BY visits.date_of_visit DESC
  LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(*) as num_animals_visited from vets
	JOIN visits ON vets.id = visits.vets_id
	WHERE vets.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name as specialized_in FROM vets
	LEFT JOIN specializations ON specializations.vets_id = vets.id
	LEFT JOIN species ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name as animal_name, visits.date_of_visit FROM animals
  JOIN visits ON visits.animals_id = animals.id
  JOIN vets ON vets.id = visits.vets_id
  WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(*) as count FROM animals
  JOIN visits ON visits.animals_id = animals.id
  GROUP BY animals.name
  ORDER BY count DESC
  LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT animals.name FROM visits 
  JOIN vets ON vets.id = visits.vets_id
  JOIN animals ON animals.id = visits.animals_id
  WHERE vets.name = 'Maisy Smith'
  ORDER BY visits.date_of_visit
  LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.

-- How many visits were with a vet that did not specialize in that animal's species?

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
