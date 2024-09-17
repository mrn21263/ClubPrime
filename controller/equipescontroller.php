<?php
include('../model/bdequipes.php');

class EquipesController {
    public function getEquipes($tri = null)
    {
        if ($tri === 'croissant') {
            return BdEquipes::getAllClubsSortedByRankingAsc();
        } elseif ($tri === 'decroissant') {
            return BdEquipes::getAllClubsSortedByRankingDesc();
        } elseif ($tri === 'alphabétique') {
            return BdEquipes::getAllClubsSortedByName();
        } elseif ($tri === 'date') {
            return BdEquipes::getAllClubsSortedByCreationDate();
        } else {
            return BdEquipes::getAllEquipes();
        }
    }
}
?>
