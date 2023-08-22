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