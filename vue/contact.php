<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&family=Open+Sans:wght@300;400;500&display=swap" rel="stylesheet" />
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="shortcut icon" href="../ressources/footer/logonav.png" type="image/x-icon">
    <link rel="stylesheet" href="../css/contact.css" />
    <link rel="stylesheet" href="../css/styleclub.css">
    <link rel="stylesheet" href="../footer2.css">
</head>

<body>



    <div class="navbarclubprime" >
        <a class="acclogo" href="../index.php">
            <img class="logonav" src="../ressources/footer/logonav.png" alt="Logo">
        </a>
        <nav class="nav">
            <a class="acc" href="../index.php">Accueil</a>
            <a class="acc" href="../index.php#podium">Podium</a>
            <a class="acc" href="../index.php#Classement">Classement</a>
            <a class="acc" href="../vue/equipes.php">Équipes</a>
            <a class="acc" href="../vue/contact.php">Contact</a>
        </nav>
    </div>

    <div class="bloc-contact reveal-2" id="bloc-contact" data-aos="fade-right"  data-aos-duration="1000">
        <div class="gauche">
            <h6>DES QUESTIONS ?</h6>
            <h3>Contactez-nous !</h3>
            <p>Nous sommes là pour répondre
                à toutes vos questions et<br> vous aider
                à trouver la meilleure solution pour
                vos besoins.</p>
            <div class="contact-mail-form">
                <img src="../ressources/contact/Email.svg" alt="email">
                <p>contact@company.com</p>
            </div>
            <div class="contact-phone-form">
                <img src="../ressources/contact/Phone.svg" alt="telephone">
                <p>04 73 69 32 01</p>
            </div>
            <div class="contact-loca-form">
                <img src="../ressources/contact/localisation.svg" alt="localisation">
                <p>9 Rue Maurice Bellonte,<br>
                    63800 Cournon-D'Auvergne</p>
            </div>
        </div>

        <div class="droite reveal-2">
            <div class="formulaire" data-aos="fade-left" data-aos-duration="1000">
                <form action="traitement_formulaire.php" method="POST">
                    <div class="np">
                        <div class="nom">
                            <label for="nom">Nom</label>
                            <input type="text" id="nom" name="nom" placeholder="John" required><br><br>
                        </div>
                        <div class="prenom">
                            <label for="prenom">Prénom</label>
                            <input type="text" id="prenom" name="prenom" placeholder="Carter" required><br><br>
                        </div>
                    </div>
                    <div class="te">
                        <div class="tel">
                            <label for="telephone">Téléphone</label>
                            <input type="tel" id="telephone" name="telephone" placeholder="04 73 ..." required><br><br>
                        </div>
                        <div class="mail">
                            <label for="email">E-mail</label>
                            <input type="email" id="email" name="email" placeholder="exemple@email.com" required><br><br>
                        </div>
                    </div>

                    <div class="messageform">
                        <label for="message"> Sujet </label><br>
                        <span><textarea id="sujet" name="sujet" rows="4" cols="50" placeholder="Sujet ..." required></textarea><br><br></span>
                        <label for="message">Message</label><br>
                        <textarea id="message" name="message" rows="4" cols="50" placeholder="Veuillez saisir votre message ici..." required></textarea><br><br>
                    </div>
                    <div class="btnenvoyer">
                        <input type="submit" value="Envoyer">
                    </div>
                </form>
            </div>
        </div>

    </div>

    <?php
    include '../vue/footer2.php';
    ?>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>

</body>