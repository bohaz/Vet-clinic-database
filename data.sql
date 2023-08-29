INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts, species) VALUES
('Charmander', '2020-02-08', -11, FALSE, 0, NULL),
('Plantmon', '2021-11-15', -5.7, TRUE, 2, NULL),
('Squirtle', '1993-04-02', -12.13, FALSE, 3, NULL),
('Angemon', '2005-06-12', -45, TRUE, 1, NULL),
('Boarmon', '2005-06-07', 20.4, TRUE, 7, NULL),
('Blossom', '1998-10-13', 17, TRUE, 3, NULL),
('Ditto', '2022-05-14', 22, TRUE, 4, NULL);

INSERT INTO owners (full_name, age) VALUES 
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

INSERT INTO vets (name, age, date_of_graduation) VALUES 
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id) VALUES 
(1, (SELECT id FROM species WHERE name = 'Pokemon'));

INSERT INTO specializations (vet_id, species_id) VALUES 
(3, (SELECT id FROM species WHERE name = 'Pokemon')),
(3, (SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO specializations (vet_id, species_id) VALUES 
(4, (SELECT id FROM species WHERE name = 'Digimon'));

INSERT INTO visits (vet_id, animal_id, visit_date) VALUES
(1, (SELECT id FROM animals WHERE name = 'Agumon'), '2020-05-24'),
(3, (SELECT id FROM animals WHERE name = 'Agumon'), '2020-07-22'),
(4, (SELECT id FROM animals WHERE name = 'Gabumon'), '2021-02-02'),
(2, (SELECT id FROM animals WHERE name = 'Pikachu'), '2020-01-05'),
(2, (SELECT id FROM animals WHERE name = 'Pikachu'), '2020-03-08'),
(2, (SELECT id FROM animals WHERE name = 'Pikachu'), '2020-05-14'),
(3, (SELECT id FROM animals WHERE name = 'Devimon'), '2021-05-04'),
(4, (SELECT id FROM animals WHERE name = 'Charmander'), '2021-02-24'),
(2, (SELECT id FROM animals WHERE name = 'Plantmon'), '2019-12-21'),
(1, (SELECT id FROM animals WHERE name = 'Plantmon'), '2020-08-10'),
(2, (SELECT id FROM animals WHERE name = 'Plantmon'), '2021-04-07'),
(3, (SELECT id FROM animals WHERE name = 'Squirtle'), '2019-09-29'),
(4, (SELECT id FROM animals WHERE name = 'Angemon'), '2020-10-03'),
(4, (SELECT id FROM animals WHERE name = 'Angemon'), '2020-11-04'),
(2, (SELECT id FROM animals WHERE name = 'Boarmon'), '2019-01-24'),
(2, (SELECT id FROM animals WHERE name = 'Boarmon'), '2019-05-15'),
(2, (SELECT id FROM animals WHERE name = 'Boarmon'), '2020-02-27'),
(2, (SELECT id FROM animals WHERE name = 'Boarmon'), '2020-08-03'),
(3, (SELECT id FROM animals WHERE name = 'Blossom'), '2020-05-24'),
(1, (SELECT id FROM animals WHERE name = 'Blossom'), '2021-01-11');

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';