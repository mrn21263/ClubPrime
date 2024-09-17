<?php
include_once '../model/bdconnexion.php';

function getNomClub($id) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("select nom from club where id =:id;");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();

        $resultat = $req->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    } finally {
        $cnx = null; 
    }
    return $resultat;
}

function getPhotoLigueByEquipe($idEquipe) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("SELECT l.photoLigue FROM club c JOIN ligue l ON c.idLigue = l.id WHERE c.id = :idEquipe;");
        $req->bindValue(':idEquipe', $idEquipe, PDO::PARAM_INT);
        $req->execute();

        $resultat = $req->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    } finally {
        $cnx = null;
    }
    return $resultat['photoLigue']; // Retourner la photo de la ligue
}






function getDesc($id) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("Select descr from club where id =:id;");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();

        $resultat = $req->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    } finally {
        $cnx = null; 
    }
    return $resultat;
}

function getLogo($id) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("select logo from club where club.id =:id;");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();

        $resultat = $req->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    } finally {
        $cnx = null; 
    }
    return $resultat;
}

function getImageStade($id) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("select photoStade from club where id =:id;");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();

        $resultat = $req->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    } finally {
        $cnx = null; 
    }
    return $resultat;
}

function getDescriptionStade($id) {
    try {
        $cnx = connexionPDO();
        $req = $cnx->prepare("select descrStade from club where id=:id;");
        $req->bindValue(':id', $id, PDO::PARAM_INT);
        $req->execute();

        $resultat = $req->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage();
        die();
    } finally {
        $cnx = null; 
    }
    return $resultat;
}


