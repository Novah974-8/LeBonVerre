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

INSERT INTO Boisson
(nom, region, pays, type_boisson, description_boisson, degre_alcool)
VALUES
('Bordeaux rouge', 'Bordeaux', 'France', 'Vin rouge',
 'Vin rouge aux arômes de fruits rouges, idéal avec les viandes.', 13.50),

('Chablis', 'Bourgogne', 'France', 'Vin blanc',
 'Vin blanc sec et minéral, adapté aux poissons et fruits de mer.', 12.50),

('Champagne brut', 'Champagne', 'France', 'Vin effervescent',
 'Vin effervescent frais et élégant, idéal pour les occasions festives.', 12.00),

('Côtes-du-Rhône', 'Vallée du Rhône', 'France', 'Vin rouge',
 'Vin rouge fruité et épicé, qui accompagne les plats en sauce.', 14.00),

('Cidre brut', 'Normandie', 'France', 'Cidre',
 'Cidre légèrement acidulé et fruité.', 5.00),

('Bière blanche', 'Alsace', 'France', 'Bière',
 'Bière légère aux notes d’agrumes et de céréales.', 5.00),

('Saké junmai', 'Japon', 'Japon', 'Saké',
 'Saké aux arômes délicats de riz, avec une texture équilibrée.', 15.00),

('Jus de pomme artisanal', 'Normandie', 'France', 'Jus',
 'Jus de pomme sans alcool, fruité et rafraîchissant.', 0.00),

('Sancerre blanc', 'Loire', 'France', 'Vin blanc',
 'Vin blanc sec aux arômes d’agrumes et aux notes minérales.', 13.00),

('Pinot noir', 'Alsace', 'France', 'Vin rouge',
 'Vin rouge léger aux arômes de cerise et de fruits rouges.', 12.50),

('Prosecco', 'Vénétie', 'Italie', 'Vin effervescent',
 'Vin pétillant frais aux notes de pomme et de poire.', 11.00),

('Riesling', 'Alsace', 'France', 'Vin blanc',
 'Vin blanc aromatique avec une belle acidité.', 12.00),

('Mojito sans alcool', 'Cuba', 'Cuba', 'Cocktail sans alcool',
 'Boisson rafraîchissante à base de menthe, de citron vert et d’eau gazeuse.', 0.00),

('Thé vert', 'Shizuoka', 'Japon', 'Thé',
 'Thé vert aux notes végétales et légèrement amères.', 0.00),

('Porto rouge', 'Douro', 'Portugal', 'Vin fortifié',
 'Vin généreux aux arômes de fruits mûrs et d’épices.', 19.50),

('Limonade artisanale', 'France', 'France', 'Limonade',
 'Boisson pétillante et citronnée, douce et rafraîchissante.', 0.00);


INSERT INTO Plat (nom, type_cuisine, description_plat)
VALUES
('Entrecôte grillée', 'Française',
 'Entrecôte de bœuf grillée, accompagnée de pommes de terre.'),

('Huîtres fraîches', 'Française',
 'Huîtres fraîches servies avec du citron.'),

('Sushi au saumon', 'Japonaise',
 'Riz vinaigré accompagné de saumon cru.'),

('Poulet rôti', 'Française',
 'Poulet rôti au four avec des herbes aromatiques.'),

('Tarte aux pommes', 'Française',
 'Tarte aux pommes caramélisées sur une pâte croustillante.'),

('Choucroute garnie', 'Alsacienne',
 'Chou fermenté accompagné de charcuteries et de pommes de terre.'),

('Risotto aux champignons', 'Italienne',
 'Riz crémeux cuisiné avec des champignons.'),

('Crêpes sucrées', 'Française',
 'Crêpes fines servies avec du sucre ou de la confiture.'),

('Saumon grillé', 'Scandinave',
 'Pavé de saumon grillé accompagné de légumes de saison.'),

('Magret de canard', 'Française',
 'Magret de canard rôti, servi avec une sauce légèrement sucrée.'),

('Risotto aux asperges', 'Italienne',
 'Risotto crémeux préparé avec des asperges fraîches.'),

('Curry de légumes', 'Indienne',
 'Mélange de légumes cuisinés dans une sauce épicée.'),

('Fromage de chèvre frais', 'Française',
 'Fromage de chèvre frais à la texture crémeuse.'),

('Fondant au chocolat', 'Française',
 'Gâteau au chocolat au cœur fondant.'),

('Pizza Margherita', 'Italienne',
 'Pizza à la tomate, à la mozzarella et au basilic.'),

('Tempura de légumes', 'Japonaise',
 'Légumes enrobés d’une pâte légère puis frits.');



INSERT INTO Accord
(id_boisson, id_plat, description_accord)
VALUES
(1, 1, 'Les tanins du Bordeaux accompagnent la richesse de la viande.'),

(2, 2, 'La fraîcheur et la minéralité du Chablis s’accordent avec les huîtres.'),

(3, 5, 'Les bulles du Champagne apportent de la fraîcheur à la tarte aux pommes.'),

(4, 4, 'Les notes fruitées et épicées du Côtes-du-Rhône accompagnent le poulet rôti.'),

(5, 5, 'Les notes fruitées et acidulées du cidre complètent les pommes.'),

(6, 6, 'La bière blanche apporte de la fraîcheur à la choucroute.'),

(7, 3, 'Le saké accompagne délicatement les saveurs du saumon.'),

(8, 8, 'Le jus de pomme offre un accord fruité avec les crêpes sucrées.'),

(1, 4, 'Le Bordeaux rouge accompagne le poulet rôti aux herbes.'),

(2, 7, 'La minéralité du Chablis équilibre le côté crémeux du risotto.'),

(4, 1, 'Les arômes épicés du Côtes-du-Rhône s’accordent avec le bœuf grillé.'),

(5, 6, 'Le cidre brut apporte une touche fruitée à la choucroute.'),

(9, 13, 'La fraîcheur du Sancerre accompagne les notes végétales des asperges.'),

(9, 12, 'L’acidité du Sancerre équilibre la texture du fromage de chèvre.'),

(10, 10, 'Le Pinot noir accompagne le magret grâce à ses arômes de fruits rouges.'),

(11, 14, 'Les bulles du Prosecco apportent de la fraîcheur à la pizza.'),

(12, 9, 'Le Riesling accompagne le saumon grâce à son acidité et ses arômes.'),

(12, 12, 'Le Riesling contraste agréablement avec la texture crémeuse du fromage.'),

(13, 14, 'Le thé vert apporte une note végétale qui contraste avec les épices du curry.'),

(14, 10, 'Le Porto rouge accompagne les saveurs riches du magret de canard.'),

(14, 14, 'Les arômes fruités du Porto peuvent accompagner certaines préparations épicées.'),

(15, 15, 'Le Mojito sans alcool apporte de la fraîcheur au fondant au chocolat.'),

(16, 16, 'La limonade apporte une touche pétillante et citronnée au repas.'),

(9, 16, 'Le Sancerre accompagne la tempura grâce à sa fraîcheur.'),

(10, 9, 'Le Pinot noir peut accompagner le saumon grillé avec ses arômes délicats.'),

(11, 15, 'Le Prosecco apporte des bulles légères en contraste avec le chocolat.');


INSERT INTO Note_Boisson
(note, commentaire, id_boisson)
VALUES
(5, 'Excellent vin rouge, riche en arômes.', 1),
(4, 'Très frais et agréable avec les fruits de mer.', 2),
(5, 'Parfait pour une occasion spéciale.', 3),
(4, 'Bon équilibre entre les fruits et les épices.', 4),
(4, 'Cidre fruité et rafraîchissant.', 5),
(3, 'Bière légère et facile à boire.', 6),
(5, 'Très bon saké, subtil et équilibré.', 7),
(5, 'Jus savoureux et idéal sans alcool.', 8),
(5, 'Vin frais et élégant, très agréable à table.', 9),
(4, 'Vin rouge souple et fruité.', 10),
(4, 'Pétillant agréable pour l’apéritif.', 11),
(5, 'Belle fraîcheur et arômes délicats.', 12),
(5, 'Cocktail sans alcool très rafraîchissant.', 13),
(4, 'Thé subtil avec une légère amertume.', 14),
(4, 'Vin généreux, idéal en petite quantité.', 15),
(4, 'Limonade agréable et désaltérante.', 16);



INSERT INTO Note_Accord
(note, commentaire, id_accord_boisson, id_accord_plat)
VALUES
(5, 'Un accord classique et très réussi.', 1, 1),
(5, 'Un excellent mariage entre le vin et les huîtres.', 2, 2),
(4, 'Une association originale et agréable.', 3, 5),
(5, 'Les saveurs se complètent très bien.', 4, 4),
(5, 'Un accord fruité particulièrement réussi.', 5, 5),
(4, 'Un accompagnement traditionnel et efficace.', 6, 6),
(5, 'Le saké respecte la finesse du poisson.', 7, 3),
(4, 'Une alternative sans alcool qui fonctionne bien.', 8, 8),
(4, 'Un accord agréable pour un repas convivial.', 1, 4),
(4, 'La fraîcheur du vin équilibre la texture du plat.', 2, 7),
(5, 'Un accord puissant et savoureux.', 4, 1),
(4, 'Une association régionale intéressante.', 5, 6),
(5, 'Un accord frais et équilibré.', 9, 13),
(5, 'Un accord classique qui fonctionne très bien.', 9, 12),
(4, 'Les arômes fruités du vin accompagnent bien le canard.', 10, 10),
(4, 'Une association fraîche et conviviale.', 11, 14),
(5, 'Très bon équilibre entre le poisson et le vin.', 12, 9),
(4, 'Un accord intéressant entre fraîcheur et crémeux.', 12, 12),
(4, 'Le thé apporte un contraste agréable aux épices.', 13, 14),
(4, 'Un accord riche et gourmand.', 14, 10),
(3, 'Une association originale, à tester selon les épices.', 14, 14),
(5, 'Le contraste entre menthe et chocolat est agréable.', 15, 15),
(4, 'Une boisson pétillante adaptée à ce plat.', 16, 16),
(5, 'La fraîcheur du vin accompagne bien la texture croustillante.', 9, 16),
(4, 'Une association délicate et fruitée.', 10, 9),
(4, 'Les bulles contrastent avec la richesse du chocolat.', 11, 15);
