<?php
include_once 'bdconnexion.php';

class BdEquipes {
    public static function getAllClubsSortedByRankingAsc()
    {
        $conn = connexionPDO();
        $query = "SELECT id, nom, logo, classement FROM club ORDER BY classement ASC";
        $stmt = $conn->prepare($query);
        $stmt->execute();
        $clubs = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $conn = null;
        return $clubs;
    }

    public static function getAllClubsSortedByRankingDesc()
    {
        $conn = connexionPDO();
        $query = "SELECT id, nom, logo, classement FROM club  ORDER BY classement DESC";
        $stmt = $conn->prepare($query);
        $stmt->execute();
        $clubs = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $conn = null;
        return $clubs;
    }

    public static function getAllClubsSortedByName()
    {
        $conn = connexionPDO();
        $query = "SELECT id, nom, logo, classement FROM club ORDER BY nom ASC";
        $stmt = $conn->prepare($query);
        $stmt->execute();
        $clubs = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $conn = null;
        return $clubs;
    }

    // Supposons que vous ayez ajouté un champ 'date_creation' à votre table club
    public static function getAllClubsSortedByCreationDate()
    {
        $conn = connexionPDO();
        $query = "SELECT id, nom, logo, classement FROM club ORDER BY date_creation ASC"; // ou DESC pour trier par date de création décroissante
        $stmt = $conn->prepare($query);
        $stmt->execute();
        $clubs = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $conn = null;
        return $clubs;
    }

    public static function getAllEquipes()
    {
        $conn = connexionPDO();
        $query = "SELECT id, nom, logo, classement FROM club";
        $stmt = $conn->prepare($query);
        $stmt->execute();
        $clubs = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $conn = null;
        return $clubs;
    }
}
?>
