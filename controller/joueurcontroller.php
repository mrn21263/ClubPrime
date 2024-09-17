<?php
include('./model/bdjoueur.php');

class JoueurController {

    public function getJoueurs()
    {
        // Appel à la méthode statique de la classe BdClassement pour obtenir la liste des joueurs
        return BdJoueur::getAllJoueurs();
    }
}
?>
