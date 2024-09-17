<!-- Votre code HTML pour afficher les clubs, en utilisant $clubs -->



<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Les équipes</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&family=Open+Sans:wght@300;400;500&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="../css/equipes.css" />
    <link rel="shortcut icon" href="../ressources/footer/logonav.png" type="image/x-icon">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/styleclub.css">
</head>

<div class="navbarclubprime">
    <nav class="nav">
        <a class="acc" href="../index.php">Accueil</a>
        <a class="acc" href="../index.php#podium">Podium</a>
        <a class="acc" href="../index.php#Classement">Classement</a>
        <a class="acc" href="../vue/equipes.php">Équipes</a>
        <a class="acc" href="../vue/contact.php">Contact</a>
    </nav>
</div>

<body class="bodyequipe">
    <div class="titreequipes">
        <h1 data-aos="zoom-in" data-aos-duration="1000">Tous les clubs<span>prime</span> </h1>
    </div>


    <div class="filtre">
        <form action="" method="get" id="triForm">
            <select name="tri" id="tri" onchange="this.form.submit()">
                <option disabled selected>Trier par</option>
                <option value="croissant">Classement Croissant</option>
                <option value="decroissant">Classement Décroissant</option>
                <option value="alphabétique">Ordre Alphabétique</option>
            </select>
        </form>
    </div>





    <?php
    // Inclure le contrôleur et récupérer les données triées
    include('../controller/equipescontroller.php');
    $tri = isset($_GET['tri']) ? $_GET['tri'] : null;
    $equipesController = new EquipesController();
    $clubs = $equipesController->getEquipes($tri);
    ?>



    <div class="lesequipes">


        <?php foreach ($clubs as $club) : ?>
            <a data-aos="zoom-in" class="equipe" href="../vue/vueclub.php?id=<?php echo $club['id']; ?>">
                <div class="test place<?php echo $club['classement']; ?>" data-aos="fade-right" data-aos-delay="300">
                    <div class="boxlogoclub">
                        <img src="data:image/jpeg;base64,<?php echo base64_encode($club['logo']); ?>" alt="Logo de <?php echo $club['nom']; ?>" width="80px">
                    </div>
                    <p><?php echo $club['nom']; ?></p>
                    <div class="boxplaceclub">
                        <p>#<?php echo $club['classement']; ?></p>
                    </div>
                </div>
            </a>
        <?php endforeach; ?>
    </div>



    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>


<?php
    include '../vue/footer2.php';
    ?>

</body>

