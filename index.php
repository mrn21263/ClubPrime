

<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ClubPrime</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&family=Open+Sans:wght@300;400;500&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="./css/style.css" />
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="./js/script.js" defer></script>
    <link rel="shortcut icon" href="./ressources/footer/logonav.png" type="image/x-icon">
</head>

<body>
    <div class="accueil">
        <video autoplay loop muted playsinline preload="auto">
            <source src="./ressources/accueil/landing.mp4" type="video/mp4">
            Votre navigateur ne prend pas en charge la balise vidéo.
        </video>

        <div class="navbarclubprime">
            <a class="acclogo" href="./index.php">
                <img class="logo" src="./ressources/accueil/logo.png" alt="Logo">
            </a>
            <nav class="nav">
                <a class="acc" href="./index.php">Accueil</a>
                <a class="acc" href="#podium">Podium</a>
                <a class="acc"href="#Classement">Classement</a>
                <a class="acc" href="./vue/equipes.php">Équipes</a>
                <a class="acc" href="./vue/contact.php">Contact</a>
            </nav>
        </div>

        <div class="corp">
            <h1>Le Top 10 de l'excellence.</h1>
            <a href="#podium">Découvrir le podium</a>
        </div>
        
    </div>


    <div class="presentationclubprime" >
        <div class="info" data-aos="fade-right">
            <h3>Les 10 <span> Clubs prime </span> </h3>

            <p>Le site présente le classement des 10 meilleures
                équipes de l'année selon l'UEFA (Union des Associations
                Européennes de Football). Ce classement est basé sur les
                performances des équipes dans des compétitions telles que
                la Ligue des Champions et la Ligue Europa, offrant aux fans
                un aperçu des clubs qui ont brillé au plus haut niveau européen.</p>

            <a href="https://www.transfermarkt.fr/statistik/klubrangliste" target="_blank">Accéder à notre source</a>
        </div>

        <div class="image" data-aos="fade-left">
            <img src="./ressources/accueil/pres.png" alt="Image de la coupe">
        </div>
    </div>


    <?php
    include('./controller/joueurcontroller.php');
    $controller = new JoueurController();
    $joueurs = $controller->getJoueurs();
    ?>

    <div id="carouselExampleIndicators" class="carousel carousel-custom slide" data-ride="false">
        <div class="carousel-inner">

            <div class="infojoueur">
                <h3 data-aos="fade-up-left">Les 4 joueurs <br> du moment</h3>
                <h6 data-aos="fade-up-left">(saison 2023-2024)</h6>
            </div>

        
            <?php foreach ($joueurs as $key => $joueur) : ?>
                <div class="carousel-item <?php if ($key === 0) echo 'active'; ?>">
                    <div class="nomjoueur" data-aos="fade-up-right">
                        <p><?= $joueur['nom'] ?></p>
                    </div>

                    <div class="infojoueur" data-aos="fade-up-left">>
                        <p> Matchs joués : <?= $joueur['nombre_match_joue'] ?><br> Buts marqués : <?= $joueur['nombre_but_marque'] ?> <br> Passes décisives : <?= $joueur['nombre_passe_decisive'] ?></p>
                    </div>
                    <div class="imagejoueur" >
                        <img src="data:image/jpeg;base64,<?= base64_encode($joueur['photo_joueur']) ?>" alt="Photo du joueur">

                    </div>
                </div>
            <?php endforeach; ?>

            <div class="wrapbtn" data-aos="zoom-in">
                <div class="sliderclick">
                    <div class="arrow-container1" onclick="changeWidth('left')" id="left" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <button onclick="prevFight()"></button>
                    </div>
                    <div class="cercle" onclick="toggleWidth(0)" style="width: 50px; border-radius: 15px; background-color: white"></div>
                    <div class="cercle" onclick="toggleWidth(1)"></div>
                    <div class="cercle" onclick="toggleWidth(2)"></div>
                    <div class="cercle" onclick="toggleWidth(3)"></div>
                    <div class="arrow-container2" onclick="changeWidth('right')" id="right" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <button onclick="nextFight()"></button>
                    </div>

                </div>
            </div>

        </div>
    </div>

<div class="white"></div>
    <div class="textdefil">
        <section>
            <div class="sliding">
                <span>Classement UEFA • Le TOP 10 de l’excellence • Classement UEFA • Le TOP 10 de l’excellence • Classement UEFA • Le TOP 10 de l’excellence • Classement UEFA • Le TOP 10 de l’excellence •</span>
                <span>Classement UEFA • Le TOP 10 de l’excellence • Classement UEFA • Le TOP 10 de l’excellence • Classement UEFA • Le TOP 10 de l’excellence • Classement UEFA • Le TOP 10 de l’excellence •</span>
            </div>
        </section>
    </div>


    <?php
    include './vue/vueclassement.php';
    include './vue/footer.php';
    ?>


    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="./js/script.js" defer></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>

    <script>
        // ---------------------------cercle--------------------

        let currentCircle = 0;

        function toggleWidth(index) {
            document.querySelectorAll('.cercle').forEach((cercle) => {
                cercle.style.width = '15px';
                cercle.style.borderRadius = '100%';
                cercle.style.backgroundColor = 'transparent';
            });

            document.querySelectorAll('.cercle')[index].style.width = '50px';
            document.querySelectorAll('.cercle')[index].style.borderRadius = '15px';
            document.querySelectorAll('.cercle')[index].style.backgroundColor = 'white';
            currentCircle = index;

            const slideDiv = document.querySelector('.slide');
            slideDiv.classList.add('hide');
        }

        function changeWidth(direction) {
            if (direction === 'left') {
                if (currentCircle === 0) {
                    toggleWidth(3);
                } else {
                    toggleWidth(currentCircle - 1);
                }
            } else if (direction === 'right') {
                if (currentCircle === 3) {
                    toggleWidth(0);
                } else {
                    toggleWidth(currentCircle + 1);
                }
            }
        }

        document.querySelectorAll('.cercle').forEach((cercle, index) => {
            cercle.addEventListener('click', () => {
                toggleWidth(index);

                const slideDiv = document.querySelector('.slide');
                slideDiv.classList.add('hide');
            });
        });
    </script>
</body>

</html>