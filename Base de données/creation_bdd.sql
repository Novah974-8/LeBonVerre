-- DROP DATABASE IF EXISTS Le_bon_verre;
-- CREATE DATABASE Le_bon_verre;
-- USE Le_bon_verre;

-- Table des boissons
CREATE TABLE Boisson (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR(100) NOT NULL,
    region VARCHAR(100),
    pays VARCHAR(100),
    type_boisson VARCHAR(50) NOT NULL,
    description_boisson VARCHAR(500),
    degre_alcool DECIMAL(4,2)
);

-- Table des utilisateurs
CREATE TABLE Utilisateur (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    adresse_mail VARCHAR(255) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(255) NOT NULL
);

-- Table des plats
CREATE TABLE Plat (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR(100) NOT NULL,
    type_cuisine VARCHAR(100),
    description_plat VARCHAR(500)
);

-- Table des notes des boissons
CREATE TABLE Note_Boisson (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    note INT NOT NULL,
    commentaire VARCHAR(500),
    id_boisson INT NOT NULL,

    FOREIGN KEY (id_boisson)
        REFERENCES Boisson(id)
        ON DELETE CASCADE,

    CHECK (note BETWEEN 1 AND 5)
);

-- Table des accords entre boissons et plats
CREATE TABLE Accord (
    id_boisson INT NOT NULL,
    id_plat INT NOT NULL,
    description_accord VARCHAR(500),

    PRIMARY KEY (id_boisson, id_plat),

    FOREIGN KEY (id_boisson)
        REFERENCES Boisson(id)
        ON DELETE CASCADE,

    FOREIGN KEY (id_plat)
        REFERENCES Plat(id)
        ON DELETE CASCADE
);

-- Table des notes des accords
CREATE TABLE Note_Accord (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    note INT NOT NULL,
    commentaire VARCHAR(500),
    id_accord_boisson INT NOT NULL,
    id_accord_plat INT NOT NULL,

    FOREIGN KEY (id_accord_boisson, id_accord_plat)
        REFERENCES Accord(id_boisson, id_plat)
        ON DELETE CASCADE,

    CHECK (note BETWEEN 1 AND 5)
);
