<?php
include('./model/bdclassement.php');

$bdClassement = new BdClassement();
$classementData = $bdClassement->getClassement();

class ClubController
{
    public function afficherClubsAction()
    {
        global $clubs;
        $clubs = BdClassement::getAllClubs();
    }
}

$controller = new ClubController();
$controller->afficherClubsAction();
?>
