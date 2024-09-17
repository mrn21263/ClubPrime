<?php
include_once 'bdconnexion.php';

class BdClassement {
    public function getClassement() {
        $pdo = connexionPDO();

        $query = "SELECT id, nom, logo FROM club WHERE classement IN (1, 2, 3) ORDER BY classement";
        $result = $pdo->query($query);
        $classement = $result->fetchAll(PDO::FETCH_ASSOC);

        return $classement;
    }

    public static function getAllClubs()
    {
        $conn = connexionPDO();
        $query = "SELECT id, nom, logo, classement FROM club where classement > 3";
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

    public function getEquipeById($id) {
        $pdo = connexionPDO();

        $query = "SELECT * FROM club WHERE id = :id";
        $stmt = $pdo->prepare($query);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();

        $equipe = $stmt->fetch(PDO::FETCH_ASSOC);

        return $equipe;
    }

}


?>




