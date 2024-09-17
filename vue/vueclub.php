<?php
include('../model/bdclassement.php');
include('../controller/clubcontroller.php');
$idEquipe = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($idEquipe > 0) {
    $bdClassement = new BdClassement();

    $equipe = $bdClassement->getEquipeById($idEquipe);
    if ($equipe) {
        $nomEquipe = $equipe['nom'];
        $logo = $equipe['logo'];
        $description = $equipe['descr'];
        $descriptionstade = $equipe['descrStade'];
        $imageStade = $equipe['photoStade'];
        $nomcapitaine = $equipe['nom_capitaine'];
        $nomentraineur = $equipe['entraineur'];
        $photocapitaine = $equipe['photo_capitaine'];
        $photoentraineur = $equipe['photo_entraineur'];
        $photoequipe = $equipe['photo_equipe'];
        $date = $equipe['anneeCrea'];
        $photoLigue = getPhotoLigueEquipe($idEquipe);
    } else {
        header('Location: ./erreur.php');
        die("Équipe non trouvée");
    }
} else {
    header('Location: ./erreur.php');
    die("ID d'équipe non valide");
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><?php echo $nomEquipe; ?></title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&family=Open+Sans:wght@300;400;500&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../css/styleclub.css" />
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="shortcut icon" href="../ressources/footer/Logo.svg" type="image/x-icon">

    <script src="../js/script.js"></script>
</head>


<body>

<div class="navbarclubprime">
            <a class="acclogo" href="../index.php">
                <img class="logonav" src="../ressources/footer/logonav.png" alt="Logo">
            </a>
            <nav class="nav">
                <a class="acc" href="../index.php">Accueil</a>
                <a class="acc" href="../index.php#podium">Podium</a>
                <a class="acc"href="../index.php#Classement">Classement</a>
                <a class="acc" href="../vue/equipes.php">Équipes</a>
                <a class="acc" href="../vue/contact.php">Contact</a>
            </nav>
        </div>


    <div class="accueil">

        <div class="landing">
            <p  data-aos="fade-down" >Depuis <?php echo $date; ?> !</p>
            <h1 data-aos="zoom-in" data-aos-duration="500"><?php echo $nomEquipe; ?></h1>
            <img   data-aos="fade-up" src="data:image/jpeg;base64,<?php echo base64_encode($photoLigue); ?>" alt="Photo de la ligue de l'équipe" width="100">
        </div>

        <div class="logo" data-aos="zoom-in" data-aos-duration="500">
            <img src="data:image/jpeg;base64,<?php echo base64_encode($logo); ?>" alt="Logo de l'equipe" width="20%">
        </div>

        <div class="marowebpresentation" >
            <p><?php echo $description; ?></p>
        </div>

        <div class="stade">
            <div class="gauche">
                <img src="data:image/jpeg;base64,<?php echo base64_encode($imageStade); ?>" alt="stade de l'equipe">
            </div>

            <div class="droite">
                <h6>Le stade</h6>
                <p><?php echo $descriptionstade; ?></p>
            </div>

        </div>

        <div class="equipe">

            <img src="data:image/jpeg;base64,<?php echo base64_encode($photoequipe); ?>" alt="stade de l'equipe">

            <div class="capitaine">
                <div class="boxinfoclub">
                    <h3>Capitaine</h3>
                    <p><?php echo $nomcapitaine; ?></p>
                </div>

                <img src="data:image/jpeg;base64,<?php echo base64_encode($photocapitaine); ?>" alt="stade de l'equipe">
            </div>

            <div class="entraineur">
                <div class="boxinfoclub">
                    <h3>Entraîneur</h3>
                    <p><?php echo $nomentraineur; ?></p>
                </div>

                <img src="data:image/jpeg;base64,<?php echo base64_encode($photoentraineur); ?>" alt="stade de l'equipe">
            </div>

        </div>


    </div>

    <script src="../js/script.js" defer></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>


<?php
    include '../vue/footer2.php';
    ?>

</body>

</html>