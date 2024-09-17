<?php
include_once '../model/bdclub.php';

function getNomClubController($idEquipe) {
    try {
        $resultat = getNomClub($idEquipe);

        if (!empty($resultat)) {
            $nomClub = $resultat[0]['nom'];
        } else {
            echo "Club non trouvé.";
        }
    } catch (PDOException $e) {

        echo "Erreur de base de données : " . $e->getMessage();
    }

    return $nomClub;
}


function getPhotoLigueEquipe($idEquipe) {
    try {
        $photoLigue = getPhotoLigueByEquipe($idEquipe);

        if (!empty($photoLigue)) {
            return $photoLigue;
        } else {
            echo "Aucune photo de ligue trouvée pour cette équipe.";
        }
    } catch (PDOException $e) {
        echo "Erreur de base de données : " . $e->getMessage();
    }
}



function getLogoEquipe($idEquipe) {
    try {
        $resultat = getLogo($idEquipe);
        if (!empty($resultat)) {
            $photologo = $resultat['photologo'];
        } else {
            echo "Aucune donnée trouvée.";
        }
    } catch (PDOException $e) {
        echo "Erreur de base de données : " . $e->getMessage();
    }

    return $photologo;
}

function getDescription($idEquipe) {
    try {
        $resultat = getDesc($idEquipe);
        if (!empty($resultat)) {
            $descr = $resultat['descr'];
        } else {
            echo "Aucune donnée trouvée.";
        }
    } catch (PDOException $e) {
        echo "Erreur de base de données : " . $e->getMessage();
    }

    return $descr;
}


function getPhotoStade($idEquipe) {
    try {
        $resultat = getImageStade($idEquipe);

        if (!empty($resultat)) {
            $PhotoStade = $resultat['photoStade'];
        } else {
            echo "Aucune donnée trouvée.";
        }
    } catch (PDOException $e) {

        echo "Erreur de base de données : " . $e->getMessage();
    }

    return $PhotoStade;
}

function getDescrStade($idEquipe) {
    try {
        $resultat = getDescriptionStade($idEquipe);
        if (!empty($resultat)) {
            $descr = $resultat['descrStade'];
        } else {
            echo "Aucune donnée trouvée.";
        }
    } catch (PDOException $e) {
        echo "Erreur de base de données : " . $e->getMessage();
    }

    return $descr;
}






