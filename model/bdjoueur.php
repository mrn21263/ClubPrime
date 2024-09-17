<?php
include_once 'bdconnexion.php';

class BdJoueur {

    public static function getAllJoueurs()
    {
        $conn = connexionPDO();
        $query = "SELECT nom, photo_joueur, nombre_match_joue, nombre_but_marque, nombre_passe_decisive FROM joueur ";
        $stmt = $conn->prepare($query);
        $stmt->execute();
        $clubs = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $conn = null;
        return $clubs;
    }



}

?>


