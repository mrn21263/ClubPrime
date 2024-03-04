-- Supprimer la base de données si elle existe déjà
DROP DATABASE IF EXISTS bdClubPrime;

-- Créer la base de données
CREATE DATABASE bdClubPrime;

use bdClubPrime;
-- Création de la table Club
CREATE TABLE IF NOT EXISTS Club (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL,
	logo VARCHAR(277),
    stade VARCHAR(277),
    descr VARCHAR(277),
    anneeCrea INT(4),
    idLigue INT,
    descrStade VARCHAR(2757),
    photoStade VARCHAR(277),
    entraineur VARCHAR(277),
    photoEntraineur VARCHAR(277),
    FOREIGN KEY (idLigue) REFERENCES Ligue(id)
);

-- Création de la table Ligue
CREATE TABLE IF NOT EXISTS Ligue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL,
    idPays INT,
    photoLigue VARCHAR(277),
    FOREIGN KEY (idPays) REFERENCES Pays(id)
);

-- Création de la table Joueur
CREATE TABLE IF NOT EXISTS Joueur (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(277) NOT NULL,
    prenom VARCHAR(277) NOT NULL,
    photo VARCHAR(277),
    poste VARCHAR(277),
    idClub INT,
    FOREIGN KEY (idClub) REFERENCES Club(id)
);

-- Création de la table Classement
CREATE TABLE IF NOT EXISTS Classement (
    annee INT,
    position INT,
    idClub INT,
    FOREIGN KEY (idClub) REFERENCES Club(id),
    PRIMARY KEY (annee, idClub)
);



CREATE TABLE IF NOT EXISTS admin (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username varchar(255), 
  password varchar(255)
);


-- Insertion de données dans la table Ligue
INSERT INTO Ligue (nom, idPays, photoLigue) VALUES
('Bundesliga', 1, 'ressources/LogoLigue/Bundesliga.png'),
('Premier League', 2,"ressources/LogoLigue/PremierLeague.png"),
('La Liga', 3,"ressources/LogoLigue/LaLiga.png"),
('Ligue 1', 4,"ressources/LogoLigue/Ligue1.png"),
('Serie A', 5,"ressources/LogoLigue/SeriaA.png");


-- Insertion de données dans la table Club
INSERT INTO Club (nom, logo, stade, descr, anneeCrea, idLigue, descrStade, photoStade, entraineur)
VALUES ('Chelsea',null, 'Stamford Bridge', 'Club de football londonien de Premier League', '1905', 2, "Stamford Bridge, résidence du Chelsea FC, se dresse avec élégance à Londres. Avec une capacité de plus de 40 000 sièges, ce stade empreint de tradition est le lieu où les Blues de Chelsea forgent leur histoire. L'atmosphère vibrante de Stamford Bridge fait de chaque match une aventure captivante.", "ressources/PhotoJoueur/Chelsea/Stade.jpg", "Mauricio Pochettino"),
('Liverpool',null, 'Anfield', 'Club de football historique de la Premier League anglaise', '1892', 2, "Anfield, situé à Liverpool, est un stade de football légendaire, surnommé le « Théâtre des rêves rouges ». Construit au nord de la ville, il est le sanctuaire du Liverpool Football Club. Doté d'une atmosphère électrique, Anfield offre une capacité de 53 394 places en configuration de matchs de la Premier League. Le stade emblématique a été le témoin de moments historiques du football, de chants passionnés et de célébrations inoubliables.","ressources/PhotoJoueur/Liverpool/Stade.jpg" ,"Jürgen Klopp"),
('Man City',null, 'Etihad Stadium', 'Club de football de Manchester jouant en Premier League', '1880', 2, "L'Etihad Stadium, niché à Manchester, est le foyer éclatant du Manchester City FC. Surnommé le City of Manchester Stadium, il se dresse fièrement au cœur de l'action. Avec une capacité de plus de 53 000 places, ce stade moderne est le théâtre de performances époustouflantes de l'équipe des Ciel et Blanc, illuminant les rêves des supporters.", "ressources/PhotoJoueur/ManCity/Stade.jpg" ,"Pep Guardiola"),
('Real Madrid',null, 'Santiago Bernabéu', 'Club de football espagnol de la ville de Madrid', '1902', 3, "Le Santiago Bernabéu, légende du football basé à Madrid, est le temple sacré du Real Madrid. Renommé pour son histoire glorieuse, il peut accueillir plus de 80 000 fans passionnés. Ce stade emblématique est imprégné d'une atmosphère magique lors des matchs, offrant une expérience incomparable aux aficionados madrilènes.", "ressources/PhotoJoueur/RealMadrid/Stade.webp" ,"Carlo Ancelotti"),
('Chelsea',null, 'Stamford Bridge', 'Club de football londonien de Premier League', '1905', 2, "Stamford Bridge, résidence du Chelsea FC, se dresse avec élégance à Londres. Avec une capacité de plus de 40 000 sièges, ce stade empreint de tradition est le lieu où les Blues de Chelsea forgent leur histoire. L'atmosphère vibrante de Stamford Bridge fait de chaque match une aventure captivante.", "ressources/PhotoJoueur/Chelsea/Stade.jpg" ,"Mauricio Pochettino"),
('Barcelone',null, 'Camp Nou', 'Club de football de Barcelone un des plus reconnus au monde', '1899', 3, "Le Camp Nou, situé à Barcelone, est le géant catalan où le FC Barcelone écrit son histoire. Avec une capacité de plus de 99 000 spectateurs, il est le plus grand stade d'Europe. L'ambiance électrique, et les prouesses de génies du ballon rond font du Camp Nou un lieu mythique.", "ressources/PhotoJoueur/Barcelone/Stade.jpg" ,"Xavi Hernández"),
('PSG',null, 'Parc des Princes', 'Club de football français basé à Paris', '1970', 4, "Le Parc des Princes, joyau parisien, est l'antre du Paris Saint-Germain. Avec une capacité de plus de 48 000 places, ce stade moderne vibre au rythme des exploits des stars du PSG. L'élégance et le dynamisme du Parc des Princes en font un lieu emblématique du football français.", "ressources/PhotoJoueur/PSG/Stade.jpg" ,"Luis Enrique"),
('Juventus',null, 'Allianz Stadium', 'Club de football italien situé à Turin', '1897', 5, "L'Allianz Stadium, situé à Turin, est le repaire de la Juventus. Avec une capacité de plus de 41 000 sièges, ce stade moderne offre une expérience immersive aux fans bianconeri. L'Allianz Stadium est le théâtre des triomphes de la Vecchia Signora, avec une ambiance électrisante à chaque rencontre.", "ressources/PhotoJoueur/Juventus/Stade.jpg" ,"Massimiliano Allegri"),
('Atlético de Madrid',null, 'Wanda Metropolitano', 'Club de football basé à Madrid, Espagne', '1903', 3, "Le Wanda Metropolitano, situé à Madrid, est le nouveau sanctuaire de l'Atlético de Madrid. Avec une capacité de plus de 68 000 places, il incarne la passion et la détermination des Colchoneros. Ce stade moderne est le témoin de la lutte incessante de l'Atlético sur le terrain.", "ressources/PhotoJoueur/AtleticoMadrid/Stade.jpg" ,"Diego Simeone"),
('Man United',null, 'Old Trafford', 'Club de football anglais basé à Manchester, très populaire mondialement', '1878', 2, "Old Trafford, trésor de Manchester, est l'icône du Manchester United. Avec une capacité de plus de 74 000 sièges, il résonne de l'histoire glorieuse du club. Surnommé le Théâtre des Rêves, Old Trafford est le lieu où les Red Devils forgent leur légende, avec une atmosphère incomparable.", "ressources/PhotoJoueur/ManUnited/Stade.jpg" ,"Erik ten Hag"),
('Roma',null, 'Stadio Olimpico', 'Club de football basé à Rome, Italie', '1927', 5, "Le Stadio Olimpico, situé à Rome, est le temple de l'AS Roma. Avec une capacité de plus de 70 000 places, ce stade historique a été le témoin de moments inoubliables de la Roma. L'atmosphère passionnée du Stadio Olimpico rend chaque match mémorable pour les supporters giallorossi.", "ressources/PhotoJoueur/Roma/Stade.jpg" ,"José Mourinho");

-- Insertion de données dans la table Classement
INSERT INTO Classement (annee, position, idClub) VALUES
('2022', 1, 1),
('2022', 2, 2),
('2022', 3, 3),
('2022', 4, 4),
('2022', 5, 5),
('2022', 6, 6),
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

Insert into admin (username,password) Values ("root","root");


INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Ulreich', 'Sven', 'ressources/PhotoJoueur/Bayern/SU.webp', 'G', 1),
  ('Davies', 'Alphonso', 'ressources/PhotoJoueur/Bayern/AD.webp', 'D', 1),
  ('Kim', 'Min-Jae', 'ressources/PhotoJoueur/Bayern/MJK.webp', 'D', 1),
  ('Upamecano', 'Dayot', 'ressources/PhotoJoueur/Bayern/DU.webp', 'D', 1),
  ('Mazraoui', 'Noussair', 'ressources/PhotoJoueur/Bayern/MN.webp', 'D', 1),
  ('Kimmich', 'Joshua', 'ressources/PhotoJoueur/Bayern/JK.webp', 'M', 1),
  ('Goretzka', 'Leon', 'ressources/PhotoJoueur/Bayern/LG.webp', 'M', 1),
  ('Coman', 'Kingsley', 'ressources/PhotoJoueur/Bayern/KC.webp', 'AT', 1),
  ('Musiala', 'Jamal', 'ressources/PhotoJoueur/Bayern/JM.webp', 'M', 1),
  ('Sané', 'Leroy', 'ressources/PhotoJoueur/Bayern/LS.webp', 'AT', 1),
  ('Kane', 'Harry', 'ressources/PhotoJoueur/Bayern/HK.webp', 'AT', 1);


INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Díaz', 'Luis', 'ressources/PhotoJoueur/Liverpool/LD.webp', 'AT', 2),
  ('Núñez', 'Darwin', 'ressources/PhotoJoueur/Liverpool/DN.webp', 'AT', 2),
  ('Salah', 'Mohamed', 'ressources/PhotoJoueur/Liverpool/MS.webp', 'AT', 2),
  ('Jones', 'Curtis', 'ressources/PhotoJoueur/Liverpool/CJ.webp', 'M', 2),
  ('Mac Allister', 'Alexis', 'ressources/PhotoJoueur/Liverpool/AM.webp', 'M', 2),
  ('Szoboszlai', 'Dominik', 'ressources/PhotoJoueur/Liverpool/DS.webp', 'M', 2),
  ('Robertson', 'Andrew', 'ressources/PhotoJoueur/Liverpool/AR.webp', 'D', 2),
  ('van Dijk', 'Virgil', 'ressources/PhotoJoueur/Liverpool/VV.webp', 'D', 2),
  ('Matip', 'Joel', 'ressources/PhotoJoueur/Liverpool/JM.webp', 'D', 2),
  ('Alexander-Arnold', 'Trent', 'ressources/PhotoJoueur/Liverpool/TA.webp', 'D', 2),
  ('Becker', 'Alisson', 'ressources/PhotoJoueur/Liverpool/AB.webp', 'G', 2);

INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES 
  ('Haaland', 'Erling', 'ressources/PhotoJoueur/ManCity/EH.webp', 'AT', 3),
  ('Grealish', 'Jack', 'ressources/PhotoJoueur/ManCity/JG1.webp', 'M', 3),
  ('Alvarez', 'Julian', 'ressources/PhotoJoueur/ManCity/JA.webp', 'AT', 3),
  ('Foden', 'Phil', 'ressources/PhotoJoueur/ManCity/PF.webp', 'M', 3),
  ('Kovačić', 'Mateo', 'ressources/PhotoJoueur/ManCity/MK.webp', 'M', 3),
  ('Rodri', '', 'ressources/PhotoJoueur/ManCity/HR.webp', 'M', 3),
  ('Gvardiol', 'Josko', 'ressources/PhotoJoueur/ManCity/JG2.webp', 'D', 3),
  ('Dias', 'Rúben', 'ressources/PhotoJoueur/ManCity/RD.webp', 'D', 3),
  ('Akanji', 'Manuel', 'ressources/PhotoJoueur/ManCity/MA.webp', 'D', 3),
  ('Walker', 'Kyle', 'ressources/PhotoJoueur/ManCity/KW.webp', 'D', 3),
  ('Ederson', '', 'ressources/PhotoJoueur/ManCity/E.webp', 'G', 3);

-- Real Madrid
INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Vinicius', 'Junior', 'ressources/PhotoJoueur/RealMadrid/VJ.webp', 'AT', 4),
  ('Joselu', '', 'ressources/PhotoJoueur/RealMadrid/J.webp', 'AT', 4),
  ('Bellingham', 'Jude', 'ressources/PhotoJoueur/RealMadrid/JB.webp', 'M', 4),
  ('Camavinga', 'Eduardo', 'ressources/PhotoJoueur/RealMadrid/EC.webp', 'M', 4),
  ('Tchouameni', 'Aurélien', 'ressources/PhotoJoueur/RealMadrid/AT.webp', 'M', 4),
  ('Valverde', 'Federico', 'ressources/PhotoJoueur/RealMadrid/FV.webp', 'M', 4),
  ('Garcia', 'Fran', 'ressources/PhotoJoueur/RealMadrid/FG.webp', 'D', 4),
  ('Alaba', 'David', 'ressources/PhotoJoueur/RealMadrid/DA.webp', 'D', 4),
  ('Rudiger', 'Antonio', 'ressources/PhotoJoueur/RealMadrid/AR.webp', 'D', 4),
  ('Carvajal', 'Dani', 'ressources/PhotoJoueur/RealMadrid/DC.webp', 'D', 4),
  ('Kepa', '', 'ressources/PhotoJoueur/RealMadrid/AK.webp', 'G', 4);

-- Chelsea
INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Mudryk', 'Mykhailo', 'ressources/PhotoJoueur/Chelsea/MM.webp', 'AT', 5),
  ('Fernández', 'Enzo', 'ressources/PhotoJoueur/Chelsea/EJF.webp', 'M', 5),
  ('Sterling', 'Raheem', 'ressources/PhotoJoueur/Chelsea/RS.webp', 'AT', 5),
  ('Jackson', 'Nicolas', 'ressources/PhotoJoueur/Chelsea/NJ.webp', 'AT', 5),
  ('Caicedo', 'Moisés', 'ressources/PhotoJoueur/Chelsea/MC.webp', 'M', 5),
  ('Gallagher', 'Conor', 'ressources/PhotoJoueur/Chelsea/CG.webp', 'M', 5),
  ('Cucurella', 'Marc', 'ressources/PhotoJoueur/Chelsea/MC.webp', 'D', 5),
  ('Colwill', 'Levi', 'ressources/PhotoJoueur/Chelsea/LSC.webp', 'D', 5),
  ('Silva', 'Thiago', 'ressources/PhotoJoueur/Chelsea/TS.webp', 'D', 5),
  ('Gusto', 'Malo', 'ressources/PhotoJoueur/Chelsea/MG.webp', 'D', 5),
  ('Sánchez', 'Robert', 'ressources/PhotoJoueur/Chelsea/RS.webp', 'G', 5);

-- Barcelone
INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Félix', 'João', 'ressources/PhotoJoueur/Barcelone/JF.webp', 'AT', 6),
  ('Lewandowski', 'Robert', 'ressources/PhotoJoueur/Barcelone/RL.webp', 'AT', 6),
  ('Yamal', 'Lamine', 'ressources/PhotoJoueur/Barcelone/LY.webp', 'AT', 6),
  ('Gündoğan', 'İlkay', 'ressources/PhotoJoueur/Barcelone/IG.webp', 'M', 6),
  ('Romeu', 'Oriol', 'ressources/PhotoJoueur/Barcelone/OR.webp', 'M', 6),
  ('Gavi', '', 'ressources/PhotoJoueur/Barcelone/PMPG.webp', 'M', 6),
  ('Baldé', '', 'ressources/PhotoJoueur/Barcelone/ABM.webp', 'D', 6),
  ('Christensen', 'Andreas', 'ressources/PhotoJoueur/Barcelone/AC.webp', 'D', 6),
  ('Koundé', 'Jules', 'ressources/PhotoJoueur/Barcelone/JK.webp', 'D', 6),
  ('Cancelo', 'João', 'ressources/PhotoJoueur/Barcelone/JC.webp', 'D', 6),
  ('ter Stegen', 'Marc-André', 'ressources/PhotoJoueur/Barcelone/MAT.webp', 'G', 6);

-- PSG
INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Mbappé', 'Kylian', 'ressources/PhotoJoueur/PSG/KM.webp', 'AT', 7),
  ('Ramos', 'Goncalo', 'ressources/PhotoJoueur/PSG/GM.webp', 'AT', 7),
  ('Dembélé', 'Ousmane', 'ressources/PhotoJoueur/PSG/OD.webp', 'AT', 7),
  ('Vitinha', '', 'ressources/PhotoJoueur/PSG/VF.webp', 'M', 7),
  ('Ugarte', 'Manuel', 'ressources/PhotoJoueur/PSG/MU.webp', 'M', 7),
  ('Zaire-Emery', 'Warren', 'ressources/PhotoJoueur/PSG/WZ.webp', 'M', 7),
  ('Hernández', 'Lucas', 'ressources/PhotoJoueur/PSG/LH.webp', 'D', 7),
  ('Skriniar', 'Milan', 'ressources/PhotoJoueur/PSG/MS.webp', 'D', 7),
  ('Marquinhos', '', 'ressources/PhotoJoueur/PSG/M.webp', 'D', 7),
  ('Hakimi', 'Achraf', 'ressources/PhotoJoueur/PSG/AH.webp', 'D', 7),
  ('Donnarumma', 'Gianluigi', 'ressources/PhotoJoueur/PSG/GD.webp', 'G', 7);

-- Juventus
INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
  ('Chiesa', 'Federico', 'ressources/PhotoJoueur/Juventus/FC.webp', 'AT', 8),
  ('Kostić', 'Filip', 'ressources/PhotoJoueur/Juventus/FK.webp', 'M', 8),
  ('Rabiot', 'Adrien', 'ressources/PhotoJoueur/Juventus/AR.webp', 'M', 8),
  ('Locatelli', 'Manuel', 'ressources/PhotoJoueur/Juventus/ML.webp', 'M', 8),
  ('Miretti', 'Fabio', 'ressources/PhotoJoueur/Juventus/FM.webp', 'M', 8),
  ('McKennie', 'Weston', 'ressources/PhotoJoueur/Juventus/WM.webp', 'M', 8),
  ('Danilo', '', 'ressources/PhotoJoueur/Juventus/PD.webp', 'D', 8),
  ('Bremer', 'Gleison', 'ressources/PhotoJoueur/Juventus/GBSN.webp', 'D', 8),
  ('Gatti', 'Federico', 'ressources/PhotoJoueur/Juventus/FG.webp', 'D', 8),
  ('Vlahović', 'Dušan', 'ressources/PhotoJoueur/Juventus/DV.webp', 'AT', 8);

INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Morata', 'Álvaro', 'ressources/PhotoJoueur/AtleticoMadrid/AM.webp', 'AT', 9),
    ('Ñíguez', 'Saúl', 'ressources/PhotoJoueur/AtleticoMadrid/SN.webp', 'M', 9),
    ('Koke', '', 'ressources/PhotoJoueur/AtleticoMadrid/KR.webp', 'M', 9),
    ('Griezmann', 'Antoine', 'ressources/PhotoJoueur/AtleticoMadrid/AG.webp', 'AT', 9),
    ('Llorente', 'Marcos', 'ressources/PhotoJoueur/AtleticoMadrid/ML.webp', 'M', 9),
    ('Riquelme', 'Rodrigo', 'ressources/PhotoJoueur/AtleticoMadrid/RRR.webp', 'M', 9),
    ('Molina', 'Nahuel', 'ressources/PhotoJoueur/AtleticoMadrid/NML.webp', 'D', 9),
    ('Hermoso', 'Mario', 'ressources/PhotoJoueur/AtleticoMadrid/MH.webp', 'D', 9),
    ('Witsel', 'Axel', 'ressources/PhotoJoueur/AtleticoMadrid/AW.webp', 'M', 9),
    ('Savić', 'Stefan', 'ressources/PhotoJoueur/AtleticoMadrid/SS.webp', 'D', 9),
    ('Oblak', 'Jan', 'ressources/PhotoJoueur/AtleticoMadrid/JO.webp', 'G', 9);

INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Rashford', 'Marcus', 'ressources/PhotoJoueur/Man United/MR.webp', 'AT', 10),
    ('Fernandes', 'Bruno', 'ressources/PhotoJoueur/Man United/BF.webp', 'M', 10),
    ('Antony', '', 'ressources/PhotoJoueur/Man United/A.webp', 'AT', 10),
    ('Eriksen', 'Christian', 'ressources/PhotoJoueur/Man United/CE.webp', 'M', 10),
    ('Casemiro', '', 'ressources/PhotoJoueur/Man United/HC.webp', 'M', 10),
    ('Dalot', 'Diogo', 'ressources/PhotoJoueur/Man United/DD.webp', 'D', 10),
    ('Evans', 'Jonny', 'ressources/PhotoJoueur/Man United/JE.webp', 'D', 10),
    ('Maguire', 'Harry', 'ressources/PhotoJoueur/Man United/HM.webp', 'D', 10),
    ('Wan-Bissaka', 'Aaron', 'ressources/PhotoJoueur/Man United/AB.webp', 'D', 10),
    ('Onana', 'André', 'ressources/PhotoJoueur/Man United/AO.webp', 'G', 10),
    ('Højlund', 'Rasmus', 'ressources/PhotoJoueur/Man United/RH.webp', 'AT', 10);

INSERT INTO Joueur (nom, prenom, photo, poste, idClub)
VALUES
    ('Lukaku', 'Romelu', 'ressources/PhotoJoueur/Roma/RL.webp', 'AT', 11),
    ('Dybala', 'Paulo', 'ressources/PhotoJoueur/Roma/PD.webp', 'AT', 11),
    ('Zalewski', 'Nicola', 'ressources/PhotoJoueur/Roma/NZ.webp', 'M', 11),
    ('Aouar', 'Houssem', 'ressources/PhotoJoueur/Roma/HA.webp', 'M', 11),
    ('Paredes', 'Leandro', 'ressources/PhotoJoueur/Roma/LP.webp', 'M', 11),
    ('Cristante', 'Bryan', 'ressources/PhotoJoueur/Roma/BC.webp', 'M', 11),
    ('Kristensen', 'Rasmus', 'ressources/PhotoJoueur/Roma/RK.webp', 'D', 11),
    ('Nidcka', 'Emil', 'ressources/PhotoJoueur/Roma/EN.webp', 'D', 11),
    ('Llorente', 'Diego', 'ressources/PhotoJoueur/Roma/DL.webp', 'D', 11),
    ('Mancini', 'Gianluca', 'ressources/PhotoJoueur/Roma/GM.webp', 'D', 11),
    ('Patricio', 'Rui', 'ressources/PhotoJoueur/Roma/RP.webp', 'G', 11);


