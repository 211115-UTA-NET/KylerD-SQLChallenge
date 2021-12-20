--#1
CREATE TABLE Pokemon
(
    PokemonId INT IDENTITY (1,1) PRIMARY KEY,
    "Name" VARCHAR(50) NOT NULL,
    Height VARCHAR(10) NOT NULL,
    "Weight" VARCHAR (10) NOT NULL
)

--#2
CREATE TABLE "Type"
(
    TypeId INT IDENTITY (1,1) PRIMARY KEY,
    "Name" VARCHAR(50) NOT NULL UNIQUE
)

--#3
CREATE TABLE PokemonType
(
    Id INT IDENTITY (1,1) PRIMARY KEY,
    PokemonId INT NOT NULL,
    TypeId INT NOT NULL
)

ALTER TABLE PokemonType ADD FOREIGN KEY (PokemonId) REFERENCES Pokemon(PokemonId);
ALTER TABLE PokemonType ADD FOREIGN KEY (TypeId) REFERENCES "Type"(TypeId);

--#4
INSERT Pokemon ("Name", Height, "Weight")
VALUES ('Bulbasaur', 7, 70), ('Ditto', 3, 40);

--#5
INSERT "Type" ("Name")
VALUES ('Normal'), ('Grass');

--#6
INSERT PokemonType (PokemonId, TypeId)
VALUES (1, 2), (2, 1);

--#7
SELECT PokemonType.PokemonId, Pokemon."Name", "Type".TypeId, "Type"."Name"
FROM Pokemon JOIN PokemonType
ON Pokemon.PokemonId = PokemonType.PokemonId
JOIN "Type" ON "Type".TypeId = PokemonType.TypeId;