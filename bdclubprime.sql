-- Supprimer la base de données si elle existe déjà
DROP DATABASE IF EXISTS bdClubPrime;

-- Créer la base de données
CREATE DATABASE bdClubPrime;

-- Utiliser la base de données
USE bdClubPrime;

-- Création de la table Club
CREATE TABLE IF NOT EXISTS Club (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL,
    stade VARCHAR(277),
    descr VARCHAR(277),
    dateCrea DATE,
    idLigue INT,
    descrStade VARCHAR(277),
    photoStade BLOB,
    entraineur VARCHAR(277),
    photoEntraineur BLOB,
    photoEquipe BLOB,
    FOREIGN KEY (idLigue) REFERENCES Ligue(id)
);

-- Création de la table Pays
CREATE TABLE IF NOT EXISTS Pays (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL
);

-- Création de la table Ligue
CREATE TABLE IF NOT EXISTS Ligue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL,
    idPays INT,
    photoLigue BLOB,
    FOREIGN KEY (idPays) REFERENCES Pays(id)
);

-- Création de la table Joueur
CREATE TABLE IF NOT EXISTS Joueur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL,
    prenom VARCHAR(277) NOT NULL,
    photo BLOB,
    poste VARCHAR(277),
    idClub INT,
    FOREIGN KEY (idClub) REFERENCES Club(id)
);

-- Création de la table Trophee
CREATE TABLE IF NOT EXISTS Trophee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL
    photoTrophee BLOB,
);

-- Création de la table Classement
CREATE TABLE IF NOT EXISTS Classement (
    annee INT,
    position INT,
    idClub INT,
    FOREIGN KEY (idClub) REFERENCES Club(id),
    PRIMARY KEY (annee, idClub)
);

-- Création de la table Tag
CREATE TABLE IF NOT EXISTS Tag (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lib VARCHAR(277) NOT NULL
);

-- Création de la table Obtenir (association entre Clubs et Trophées)
CREATE TABLE IF NOT EXISTS Obtenir (
    idClub INT,
    nombre INT,
    idTrophee INT,
    PRIMARY KEY (idClub, idTrophee),
    FOREIGN KEY (idClub) REFERENCES Club(id),
    FOREIGN KEY (idTrophee) REFERENCES Trophee(id)
);

-- Création de la table Taguer (association entre Clubs et Tags)
CREATE TABLE IF NOT EXISTS Taguer (
    idClub INT,
    idTag INT,
    PRIMARY KEY (idClub, idTag),
    FOREIGN KEY (idClub) REFERENCES Club(id),
    FOREIGN KEY (idTag) REFERENCES Tag(id)
);

-- Création de la table Logo
CREATE TABLE IF NOT EXISTS Logo (
   dateCreat DATE,
   nom VARCHAR(277) NOT NULL,
   idClub INT,
   FOREIGN KEY (idClub) REFERENCES Club(id),
   PRIMARY KEY (dateCreat, idClub)
);

-- Insertion de données dans la table Pays
INSERT INTO Pays (nom) VALUES
('Allemagne'),
('Angleterre'),
('Espagne'),
('France'),
('Italie');

-- Insertion de données dans la table Ligue
INSERT INTO Ligue (nom, idPays, photoLigue) VALUES
('Bundesliga', 1, 'C:\Users\sdasilva\Desktop\logo\bundesliga.png'),
('Premier League', 2,"C:\Users\sdasilva\Desktop\logo\premierleague.png"),
('La Liga', 3,"C:\Users\sdasilva\Desktop\logo\laliga"),
('Ligue 1', 4,"C:\Users\sdasilva\Desktop\logo\ligue1"),
('Serie A', 5),"C:\Users\sdasilva\Desktop\logo\seriaA";

-- Insertion de données dans la table Club
INSERT INTO Club (nom, stade, descr, dateCrea, idLigue, descrStade, photoStade, entraineur, photoEntraineur, photoEquipe) VALUES
('Bayern', 'Allianz Arena', 'Club de football basé à Munich, Allemagne', '1900-02-27', 1, "L'Allianz Arena ou Fußball Arena München, surnommée le « Schlauchboot » en raison de son aspect, est un stade de football situé au nord de Munich, la capitale du Land de Bavière en Allemagne. Le stade a une capacité de 75 000 spectateurs pour les matchs de Bundesliga, et 70 000 places en configuration internationale.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\Stade.jpg" ,"Thomas Tuchel", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\Entraineur.jpg","" ),
('Liverpool', 'Anfield', 'Club de football historique de la Premier League anglaise', '1892-03-17', 2, "Anfield, situé à Liverpool, est un stade de football légendaire, surnommé le « Théâtre des rêves rouges ». Construit au nord de la ville, il est le sanctuaire du Liverpool Football Club. Doté d'une atmosphère électrique, Anfield offre une capacité de 53 394 places en configuration de matchs de la Premier League. Le stade emblématique a été le témoin de moments historiques du football, de chants passionnés et de célébrations inoubliables.","E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\Stade.jpg" ,"Jürgen Klopp", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\Entraineur.jpg"),
('Man City', 'Etihad Stadium', 'Club de football de Manchester jouant en Premier League', '1880-04-16', 2, "L'Etihad Stadium, niché à Manchester, est le foyer éclatant du Manchester City FC. Surnommé le City of Manchester Stadium, il se dresse fièrement au cœur de l'action. Avec une capacité de plus de 53 000 places, ce stade moderne est le théâtre de performances époustouflantes de l'équipe des Ciel et Blanc, illuminant les rêves des supporters.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\Stade.jpg" ,"Pep Guardiola", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\Entraineur.jpg" ),
('Real Madrid', 'Santiago Bernabéu', 'Club de football espagnol de la ville de Madrid', '1902-03-06', 3; "Le Santiago Bernabéu, légende du football basé à Madrid, est le temple sacré du Real Madrid. Renommé pour son histoire glorieuse, il peut accueillir plus de 80 000 fans passionnés. Ce stade emblématique est imprégné d'une atmosphère magique lors des matchs, offrant une expérience incomparable aux aficionados madrilènes.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\Stade.webp" ,"Carlo Ancelotti", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\Entraineur.jpg"),
('Chelsea', 'Stamford Bridge', 'Club de football londonien de Premier League', '1905-03-10', 2, "Stamford Bridge, résidence du Chelsea FC, se dresse avec élégance à Londres. Avec une capacité de plus de 40 000 sièges, ce stade empreint de tradition est le lieu où les Blues de Chelsea forgent leur histoire. L'atmosphère vibrante de Stamford Bridge fait de chaque match une aventure captivante.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\Stade.jpg" ,"Mauricio Pochettino", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\Entraineur.jpg"),
('Barcelone', 'Camp Nou', 'Club de football de Barcelone un des plus reconnus au monde', '1899-11-29', 3, "Le Camp Nou, situé à Barcelone, est le géant catalan où le FC Barcelone écrit son histoire. Avec une capacité de plus de 99 000 spectateurs, il est le plus grand stade d'Europe. L'ambiance électrique, et les prouesses de génies du ballon rond font du Camp Nou un lieu mythique.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\Stade.jpg" ,"Xavi Hernández", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\Entraineur.jpg"),
('PSG', 'Parc des Princes', 'Club de football français basé à Paris', '1970-08-12', 4, "Le Parc des Princes, joyau parisien, est l'antre du Paris Saint-Germain. Avec une capacité de plus de 48 000 places, ce stade moderne vibre au rythme des exploits des stars du PSG. L'élégance et le dynamisme du Parc des Princes en font un lieu emblématique du football français.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\Stade.jpg" ,"Luis Enrique", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\Entraineur.jpg"),
('Juventus', 'Allianz Stadium', 'Club de football italien situé à Turin', '1897-11-01', 5, "L'Allianz Stadium, situé à Turin, est le repaire de la Juventus. Avec une capacité de plus de 41 000 sièges, ce stade moderne offre une expérience immersive aux fans bianconeri. L'Allianz Stadium est le théâtre des triomphes de la Vecchia Signora, avec une ambiance électrisante à chaque rencontre.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\Stade.jpg" ,"Massimiliano Allegri", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\Entraineur.jpg"),
('Atlético de Madrid', 'Wanda Metropolitano', 'Club de football basé à Madrid, Espagne', '1903-04-26', 3, "Le Wanda Metropolitano, situé à Madrid, est le nouveau sanctuaire de l'Atlético de Madrid. Avec une capacité de plus de 68 000 places, il incarne la passion et la détermination des Colchoneros. Ce stade moderne est le témoin de la lutte incessante de l'Atlético sur le terrain.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\Stade.jpg" ,"Diego Simeone", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Marid\Entraineur.jpg" ),
('Man United', 'Old Trafford', 'Club de football anglais basé à Manchester, très populaire mondialement', '1878-01-01', 2, "Old Trafford, trésor de Manchester, est l'icône du Manchester United. Avec une capacité de plus de 74 000 sièges, il résonne de l'histoire glorieuse du club. Surnommé le Théâtre des Rêves, Old Trafford est le lieu où les Red Devils forgent leur légende, avec une atmosphère incomparable.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\Stade.jpg" ,"Erik ten Hag", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\Entraineur.jpg"),
('Roma', 'Stadio Olimpico', 'Club de football basé à Rome, Italie', '1927-07-22', 5, "Le Stadio Olimpico, situé à Rome, est le temple de l'AS Roma. Avec une capacité de plus de 70 000 places, ce stade historique a été le témoin de moments inoubliables de la Roma. L'atmosphère passionnée du Stadio Olimpico rend chaque match mémorable pour les supporters giallorossi.", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\Stade.jpg" ,"José Mourinho", "E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\Entraineur.jpg");

-- Insertion de données dans la table Trophee
INSERT INTO Trophee (nom, photoTrophee) VALUES
('Ligue 1', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Ligue 1.png'),
('Coupe de France', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Coupe de France.png'),
('Trophée des Champions (France)', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Trophée des champions.png'),
('Serie A', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Serie A.png'),
('Coppa Italia', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Coppa Italia.png'),
('Supercoppa Italiana', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Supercoppa Italiana.png'),
('Premier League', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Premier League.png'),
('FA Cup', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\FA Cup.png'),
('Carabao Cup', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Carabao Cup.png'),
('Community Shield (Angleterre)', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Community Shield.png'),
('Bundesliga', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Bundesliga.jpg'),
('DFB-Pokal', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\DFB-Pokal.png'),
('DFL-Supercup', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\DFL-Supercup.png'),
('La Liga', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\La Liga.png'),
('Copa del Rey', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Copa del Rey.png'),
('Supercopa de España', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Supercopa de España.png'),
('Ligue des champions de l''UEFA', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Ligue des champions.png'),
('Ligue Europa de l''UEFA', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Ligue Europa.png'),
('Supercoupe de l''UEFA', 'Supercoupe UEFA'),
('Fifa Club World Cup', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Fifa Club World Cup.png'),
('Audi Cup', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Audi Cup.png'),
('Premier League Asia Trophy', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Premier League Asia Trophy.png'),
('International Champions Cup', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\International Campions Cup.png'),
('Trophée Joan Gamper', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\Trophée Joan Gamper.png'),
('UEFA Europa Conference League', 'E:\SIO\Developpement\AP\Club Prime\Photo Trophee\UEFA Europa Conference League.png');
-- Insertion de données dans la table Classement
INSERT INTO Classement (annee, position, idClub) VALUES
('2022', 1, 1),
('2022', 2, 2),
('2022', 3, 3),
('2022', 4, 4),
('2022', 7, 7),
('2022', 7, 7),
('2022', 7, 7),
('2022', 8, 8),
('2022', 9, 9),
('2022', 10, 10);

INSERT INTO Classement (annee, position, idClub) VALUES
('2023', 2, 1),  -- Bayern
('2023', 4, 2),  -- Liverpool
('2023', 1, 3),  -- Man City
('2023', 5, 4),  -- Real madrid
('2023', 3, 5),  -- Chelsea
('2023', 9, 6),  -- Barcelona
('2023', 6, 7),  -- Paris
('2023', 8, 8),  -- Atletico Madrid
('2023', 7, 9),  -- Man United
('2023', 10, 11); -- Roma


-- Insertion de données dans la table Obtenir (association entre Clubs et Trophées)
INSERT INTO Obtenir (idClub, nombre, idTrophee) VALUES
-- Bayern Munich
(1, 6, 17), -- Ligue des Champions
(1, 1, 18), -- UEFA Europa League
(1, 33, 11), -- Bundesliga
(1, 20, 12), -- DFB Pokal
(1, 2, 19), -- Super Coupe UEFA
(1, 11, 13), -- Super Cup Allemande
(1, 2, 20), -- FIFA Club World Cup (CM Clubs)
(1, 3, 21), -- Audi Cup

-- Liverpool
(2, 6, 17), -- Ligue des Champions
(2, 3, 18), -- UEFA Europa League
(2, 19, 7), -- Premier League
(2, 8, 8), -- FA Cup
(2, 9, 9), -- League Cup 
(2, 17, 10), -- Community Shield (Angleterre)
(2, 4, 19), -- Super Coupe UEFA
(2, 1, 20), -- Cdm club
(2, 1, 22), -- Premier League asia trophy

-- Manchester City
(3, 1, 17), -- Ligue des Champions
(3, 9, 7), -- Premier League
(3, 7, 8), -- FA Cup
(3, 8, 9), -- League Cup
(3, 6, 10), -- Community Shield (Angleterre)

-- Real Madrid 
(4, 14, 17), -- Ligue des Champions
(4, 2, 18), -- UEFA Europa League
(4, 35, 14), -- Liga
(4, 20, 17), -- Coupe du Roi
(4, 12, 17), -- Supercopa de España
(4, 5, 19), -- Super Coupe UEFA
(4, 8, 20), -- CM Clubs
(4, 1, 23), -- International Champions Cup

-- Chelsea
(5, 2, 17), -- Ligue des Champions
(5, 2, 18), -- UEFA Europa League
(5, 6, 7), -- Premier League
(5, 8, 8), -- FA Cup
(5, 5, 7), -- League Cup
(5, 4, 10), -- Community Shield (Angleterre)
(5, 2, 19), -- Super Coupe UEFA
(5, 1, 20), -- CM Clubs

-- FC Barcelone
(6, 5, 17), -- Ligue des Champions
(6, 27, 14), -- Liga
(6, 31, 17), -- Coupe du Roi
(6, 14, 17), -- Supercopa de España
(6, 5, 19), -- Super Coupe UEFA
(6, 3, 20), -- CM Clubs
(6, 1, 21), -- Audi Cup
(6, 6, 24), -- Trophée Joan Gamper

-- Paris Saint-Germain (PSG)
(7, 11, 1), -- Ligue 1
(7, 14, 2), -- Coupe de France
(7, 11, 3), -- Trophée des Champions (France)
(7, 9, 12), -- Coupe de la Ligue
(7, 1, 17), -- Ligue des Champions

-- Juventus
(8, 2, 17), -- UEFA Champions League
(8, 3, 18), -- UEFA Europa League
(8, 9, 7), -- Supercoppa Italiana
(8, 36, 4), -- Serie A
(8, 14, 7), -- Coppa Italia
(8, 1, 19), -- Super Coupe de luefa 
(8, 1, 12),

-- Atlético Madrid
(9, 3, 18), -- UEFA Europa League
(9, 11, 14), -- La Liga
(9, 10, 17), -- Copa del Rey
(9, 1, 17), -- UEFA Champions League
(9, 4, 17), -- Supercopa de España
(9, 3, 19), -- UEFA Super Cup
(9, 1, 21), -- Audi Cup

-- Manchester United
(10, 3, 17), -- UEFA Champions League
(10, 1, 18), -- UEFA Europa League
(10, 20, 7), -- Premier League
(10, 12, 8), -- FA Cup
(10, 2, 13), -- DFL-Supercup
(10, 7, 9), -- League Cup
(10, 21, 10), -- Community Shield (Angleterre)
(10, 1, 19), -- UEFA Super Cup
(10, 1, 20), -- FIFA Club World Cup
(10, 1, 23), -- International Champions Cup

-- AS Roma
(11, 1, 27), -- UEFA Europa Conference League
(11, 2, 7), -- Supercoppa Italiana
(11, 3, 4), -- Serie A
(11, 9, 7), -- Coppa Italia
(11, 1, 12); -- Serie B
     
INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Ulreich', 'Sven', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\SU.webp', 'G', 1),
  ('Davies', 'Alphonso', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\AD.webp', 'D', 1),
  ('Kim', 'Min-Jae', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\MJK.webp', 'D', 1),
  ('Upamecano', 'Dayot', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\DU.webp', 'D', 1),
  ('Mazraoui', 'Noussair', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\MN.webp', 'D', 1),
  ('Kimmich', 'Joshua', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\JK.webp', 'M', 1),
  ('Goretzka', 'Leon', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\LG.webp', 'M', 1),
  ('Coman', 'Kingsley', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\KC.webp', 'AT', 1),
  ('Musiala', 'Jamal', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\JM.webp', 'M', 1),
  ('Sané', 'Leroy', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\LS.webp', 'AT', 1),
  ('Kane', 'Harry', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Bayern\HK.webp', 'AT', 1);

INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Díaz', 'Luis', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\LD.webp', 'AT', 2),
  ('Núñez', 'Darwin', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\DN.webp', 'AT', 2),
  ('Salah', 'Mohamed', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\MS.webp', 'AT', 2),
  ('Jones', 'Curtis', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\CJ.webp', 'M', 2),
  ('Mac Allister', 'Alexis', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\AM.webp', 'M', 2),
  ('Szoboszlai', 'Dominik', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\DS.webp', 'M', 2),
  ('Robertson', 'Andrew', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\AR.webp', 'D', 2),
  ('van Dijk', 'Virgil', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\VV.webp', 'D', 2),
  ('Matip', 'Joel', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\JM.webp', 'D', 2),
  ('Alexander-Arnold', 'Trent', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\TA.webp', 'D', 2),
  ('Becker', 'Alisson', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Liverpool\AB.webp', 'G', 2);
INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES 
  ('Haaland', 'Erling', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\EH.webp', 'AT', 3),
  ('Grealish', 'Jack', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\JG1.webp', 'M', 3),
  ('Alvarez', 'Julian', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\JA.webp', 'AT', 3),
  ('Foden', 'Phil', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\PF.webp', 'M', 3),
  ('Kovačić', 'Mateo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\MK.webp', 'M', 3),
  ('Rodri', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\HR.webp', 'M', 3),
  ('Gvardiol', 'Josko', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\JG2.webp', 'D', 3),
  ('Dias', 'Rúben', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\RD.webp', 'D', 3),
  ('Akanji', 'Manuel', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\MA.webp', 'D', 3),
  ('Walker', 'Kyle', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\KW.webp', 'D', 3),
  ('Ederson', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man City\E.webp', 'G', 3);


INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Vinicius', 'Junior', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\VJ.webp', 'AT', 4),
    ('Joselu', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\J.webp', 'AT', 4),
    ('Bellingham', 'Jude', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\JB.webp', 'M', 4),
    ('Camavinga', 'Eduardo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\EC.webp', 'M', 4),
    ('Tchouameni', 'Aurélien', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\AT.webp', 'M', 4),
    ('Valverde', 'Federico', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\FV.webp', 'M', 4),
    ('Garcia', 'Fran', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\FG.webp', 'D', 4),
    ('Alaba', 'David', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\DA.webp', 'D', 4),
    ('Rudiger', 'Antonio', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\AR.webp', 'D', 4),
    ('Carvajal', 'Dani', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\DC.webp', 'D', 4),
    ('Kepa', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Real Madrid\AK.webp', 'G', 4);


INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Mudryk', 'Mykhailo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\MM.webp', 'AT', 5),
    ('Fernández', 'Enzo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\EJF.webp', 'M', 5),
    ('Sterling', 'Raheem', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\RS.webp', 'AT', 5),
    ('Jackson', 'Nicolas', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\NJ.webp', 'AT', 5),
    ('Caicedo', 'Moisés', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\MC.webp', 'M', 5),
    ('Gallagher', 'Conor', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\CG.webp', 'M', 5),
    ('Cucurella', 'Marc', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\MC.webp', 'D', 5),
    ('Colwill', 'Levi', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\LSC.webp', 'D', 5),
    ('Silva', 'Thiago', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\TS.webp', 'D', 5),
    ('Gusto', 'Malo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\MG.webp', 'D', 5),
    ('Sánchez', 'Robert', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Chelsea\RS.webp', 'G', 5);

INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Félix', 'João', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\JF.webp', 'AT', 6),
  ('Lewandowski', 'Robert', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\RL.webp', 'AT', 6),
  ('Yamal', 'Lamine', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\LY.webp', 'AT', 6),
  ('Gündoğan', 'İlkay', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\IG.webp', 'M', 6),
  ('Romeu', 'Oriol', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\OR.webp', 'M', 6),
  ('Gavi', '', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\PMPG.webp', 'M', 6),
  ('Baldé', '', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\ABM.webp', 'D', 6),
  ('Christensen', 'Andreas', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\AC.webp', 'D', 6),
  ('Koundé', 'Jules', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\JK.webp', 'D', 6),
  ('Cancelo', 'João', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\JC.webp', 'D', 6),
  ('ter Stegen', 'Marc-André', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Barcelone\MAT.webp', 'G', 6);


  
INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Mbappé', 'Kylian', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\KM.webp', 'AT', 7),
  ('Ramos', 'Goncalo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\GM.webp', 'AT', 7),
  ('Dembélé', 'Ousmane', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\OD.webp', 'AT', 7),
  ('Vitinha', '', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\VF.webp', 'M', 7),
  ('Ugarte', 'Manuel', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\MU.webp', 'M', 7),
  ('Zaire-Emery', 'Warren', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\WZ.webp', 'M', 7),
  ('Hernández', 'Lucas', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\LH.webp', 'D', 7),
  ('Skriniar', 'Milan', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\MS.webp', 'D', 7),
  ('Marquinhos', '', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\M.webp', 'D', 7),
  ('Hakimi', 'Achraf', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\AH.webp', 'D', 7),
  ('Donnarumma', 'Gianluigi', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\PSG\GD.webp', 'G', 7);
q


INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Chiesa', 'Federico', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\FC.webp', 'AT', 8),
    ('Kostić', 'Filip', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\FK.webp', 'M', 8),
    ('Rabiot', 'Adrien', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\AR.webp', 'M', 8),
    ('Locatelli', 'Manuel', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\ML.webp', 'M', 8),
    ('Miretti', 'Fabio', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\FM.webp', 'M', 8),
    ('McKennie', 'Weston', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\WM.webp', 'M', 8),
    ('Danilo', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\PD.webp', 'D', 8),
    ('Bremer', 'Gleison', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\GBSN.webp', 'D', 8),
    ('Gatti', 'Federico', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\FG.webp', 'D', 8),
    ('Vlahović', 'Dušan', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Juventus\DV.webp', 'AT', 8),


INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Morata', 'Álvaro', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\AM.webp', 'AT', 9),
    ('Ñíguez', 'Saúl', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\SN.webp', 'M', 9),
    ('Koke', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\KR.webp', 'M', 9),
    ('Griezmann', 'Antoine', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\AG.webp', 'AT', 9),
    ('Llorente', 'Marcos', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\ML.webp', 'M', 9),
    ('Riquelme', 'Rodrigo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\RRR.webp', 'M', 9),
    ('Molina', 'Nahuel', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\NML.webp', 'D', 9),
    ('Hermoso', 'Mario', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\MH.webp', 'D', 9),
    ('Witsel', 'Axel', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\AW.webp', 'M', 9),
    ('Savić', 'Stefan', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\SS.webp', 'D', 9),
    ('Oblak', 'Jan', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Atletico Madrid\JO.webp', 'G', 9);

INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Rashford', 'Marcus', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\MR.webp', 'AT', 10),
    ('Fernandes', 'Bruno', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\BF.webp', 'M', 10),
    ('Antony', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\A.webp', 'AT', 10),
    ('Eriksen', 'Christian', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\CE.webp', 'M', 10),
    ('Casemiro', NULL, 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\HC.webp', 'M', 10),
    ('Dalot', 'Diogo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\DD.webp', 'D', 10),
    ('Evans', 'Jonny', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\JE.webp', 'D', 10),
    ('Maguire', 'Harry', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\HM.webp', 'D', 10),
    ('Wan-Bissaka', 'Aaron', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\AB.webp', 'D', 10),
    ('Onana', 'André', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\AO.webp', 'G', 10),
    ('Højlund', 'Rasmus', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Man United\RH.webp', 'AT', 10);


INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Lukaku', 'Romelu', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\RL.webp', 'AT', 11),
    ('Dybala', 'Paulo', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\PD.webp', 'AT', 11),
    ('Zalewski', 'Nicola', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\NZ.webp', 'M', 11),
    ('Aouar', 'Houssem', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\HA.webp', 'M', 11),
    ('Paredes', 'Leandro', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\LP.webp', 'M', 11),
    ('Cristante', 'Bryan', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\BC.webp', 'M', 11),
    ('Kristensen', 'Rasmus', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\RK.webp', 'D', 11),
    ('Nidcka', 'Emil', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\EN.webp', 'D', 11),
    ('Llorente', 'Diego', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\DL.webp', 'D', 11),
    ('Mancini', 'Gianluca', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\GM.webp', 'D', 11),
    ('Patricio', 'Rui', 'E:\SIO\Developpement\AP\Club Prime\Photo Joueur - Formation\Roma\RP.webp', 'G', 11);

INSERT INTO Logo VALUES 
    (1900, 1, '1900-1901', 'Z:/TS2SIO SLAM/Kraria Samih/Projet SLAM/Projet ClubPrime/Logo/Bayern/1900-1901.png'),
    (1902, 1, '1902-1906', 'Z:/TS2SIO SLAM/Kraria Samih/Projet SLAM/Projet ClubPrime/Logo/Bayern/1902-1906.png'),
    (1906, 1, '1906-1908', 'Z:/TS2SIO SLAM/Kraria Samih/Projet SLAM/Projet ClubPrime/Logo/Bayern/1906-1908.png'),
    (1919, 1, '1919-1920', 'Z:/TS2SIO SLAM/Kraria Samih/Projet SLAM/Projet ClubPrime/Logo/Bayern/1919-1920.png'),
    (1931, 1, '1931-1935', 'Z:/TS2SIO SLAM/Kraria Samih/Projet SLAM/Projet ClubPrime/Logo/Bayern/1931-1935.png'),
    (1955, 1, '1955-1966', 'Z:/TS2SIO SLAM/Kraria Samih/Projet SLAM/Projet ClubPrime/Logo/Bayern/1955-1966.gif'),
    (1966, 1, '1966-1967', 'Z:/TS2SIO SLAM/Kraria Samih/Projet SLAM/Projet ClubPrime/Logo/Bayern/1966-1967.gif'),
    (1967, 1, '1967-1997', 'Z:/TS2SIO SLAM/Kraria Samih/Projet SLAM/Projet ClubPrime/Logo/Bayern/1967-1997.png'),
    (1997, 1, '1997-2002', 'Z:/TS2SIO SLAM/Kraria Samih/Projet SLAM/Projet ClubPrime/Logo/Bayern/1997-2002.png'),
    (2002, 1, '2002-2017', 'Z:/TS2SIO SLAM/Kraria Samih/Projet SLAM/Projet ClubPrime/Logo/Bayern/2002-2017.png'),
    (2017, 1, '2017-Actuel', 'Z:/TS2SIO SLAM/Kraria Samih/Projet SLAM/Projet ClubPrime/Logo/Bayern/2017.png'),

    (1981, 2, '1981-1987', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Liverpool/1981-1987.gif'),
    (1987, 2, '1987-1992', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Liverpool/1987-1992.gif'),
    (1992, 2, '1992-1993', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Liverpool/1992-1993.gif'),
    (1993, 2, '1993-2000', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Liverpool/1993-2000.png'),
    (2000, 2, '2000-Actuel', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Liverpool/2000.png'),

    (1926, 3, '1926-1970', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/ManCity/1926-1970.png'),
    (1972, 3, '1972-1976', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/ManCity/1972-1976.png'),
    (1976, 3, '1976-1981', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/ManCity/1976-1981.png'),
    (1981, 3, '1981-1997', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/ManCity/1981-1997.png'),
    (1997, 3, '1997-2016', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/ManCity/1997-2016.png'),
    (2016, 3, '2016-Actuel', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/ManCity/2016.png'),

    (1902, 4, '1902-1903', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Real/1902-1903.png'),
    (1903, 4, '1903-1908', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Real/1903-1908.png'),
    (1908, 4, '1908-1920', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Real/1908-1920.png'),
    (1920, 4, '1920-1931', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Real/1920-1931.png'),
    (1931, 4, '1931-1941', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Real/1931-1941.png'),
    (1941, 4, '1941-1997', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Real/1941-1997.png'),
    (1997, 4, '1997-Actuel', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Real/1997-Actuel.png'),

    (1905, 5, '1906-1951', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Chelsea/1905-1952.jpg'),
    (1952, 5, '1952-1953', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Chelsea/1952-1953.jpg'),
    (1953, 5, '1953-1986', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Chelsea/1953-1986.jpg'),
    (1986, 5, '1986-2002', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Chelsea/1986-2002.jpg'),
    (2002, 5, '2002-2005', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Chelsea/2002-2005.jpg'),
    (2005, 5, '2005-Actuel', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Chelsea/2005-Actuel.png'),

    (1899, 6, '1899-1906', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Barcelone/1899-1906.jpg'),
    (1906, 6, '1906-1920', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Barcelone/1906-1920.jpg'),
    (1920, 6, '1920-1936', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Barcelone/1920-1936.jpg'),
    (1936, 6, '1936-1939', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Barcelone/1936-1939.jpg'),
    (1939, 6, '1939-1946', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Barcelone/1939-1946.jpg'),
    (1946, 6, '1946-1960', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Barcelone/1946-1960.jpg'),
    (1960, 6, '1960-1974', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Barcelone/1960-1974.jpg'),
    (1974, 6, '1974-1975', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Barcelone/1974-1975.jpg'),
    (1975, 6, '1975-2002', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Barcelone/1975-2002.jpg'),
    (2002, 6, '2002-Actuel', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Barcelone/2002-Actuel.jpg'),

    (1970, 7, '1970-1972', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/PSG/1970-1972.png'),
    (1972, 7, '1972-1982', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/PSG/1972-1982.jpg'),
    (1982, 7, '1982-1992', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/PSG/1982-1992.png'),
    (1992, 7, '1992-1996', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/PSG/1992-1996.png'),
    (1996, 7, '1996-2002', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/PSG/1996-2002.png'),
    (2002, 7, '2002-2010', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/PSG/2002-2010.png'),
    (2010, 7, '2010-2012', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/PSG/2010-2012.png'),
    (2013, 7, '2013-Actuel', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/PSG/2013-Actuel.png'),

    (1905, 8, '1905-1931', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Juventus/1905-1931.png'),
    (1931, 8, '1931-1993', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Juventus/1931-1993.png'),
    (1993, 8, '1993-2004', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Juventus/1993-2004.png'),
    (2004, 8, '2004-2017', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Juventus/2004-2017.png'),
    (2017, 8, '2017-2020', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Juventus/2017-2020.png'),
    (2020, 8, '2020-Actuel', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Juventus/2020-Actuel.png'),

    (1903, 9, '1903-1911', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Atletico/1903-1911.jpg'),
    (1911, 9, '1911-1939', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Atletico/1911-1939.png'),
    (1939, 9, '1939-1942', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Atletico/1939-1942.jpg'),
    (1942, 9, '1942-1947', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Atletico/1942-1947.jpg'),
    (1947, 9, '1947-2016', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Atletico/1947-2016.png'),
    (2017, 9, '2017-Actuel', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Atletico/2017-Actuel.png'),

    (1878, 10, '1878-1902', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/ManUnited/1878-1902.jpg'),
    (1902, 10, '1902-1940', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/ManUnited/1902-1940.jpg'),
    (1940, 10, '1940-1960', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/ManUnited/1940-1960.png'),
    (1960, 10, '1960-1970', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/ManUnited/1960-1970.png'),
    (1970, 10, '1970-1973', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/ManUnited/1970-1973.jpg'),
    (1973, 10, '1973-1998', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/ManUnited/1973-1998.png'),
    (1998, 10, '1998-Actuel', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/ManUnited/1998-Actuel.png'),

    (1930, 11, '1930-1960', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Roma/1930-1960.jpg'),
    (1960, 11, '1960-1978', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Roma/1960-1978.png'),
    (1978, 11, '1978-1997', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Roma/1978-1997.png'),
    (1997, 11, '1997-2013', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Roma/1997-2013.png'),
    (2013, 11, '2013-2017', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Roma/2013-2017.png'),
    (2017, 11, '2017-Actuel', 'Z:/TS2SIO SLAM/KRARIA Samih/Projet SLAM/Projet ClubPrime/Logo/Roma/2017-Actuel.png');
-- Sélectionnez tous les enregistrements de la table Club
SELECT * FROM Club;
