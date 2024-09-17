    <?php
    include('./controller/classementcontroller.php');
    ?>

    <head>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&family=Open+Sans:wght@300;400;500&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&family=Open+Sans:wght@300;400;500&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="../css/style.css">


    </head>
    <div class="podium" id="podium">
    <div class="date">
    <form method="get">
        <select id="quantity" name="quantity" onchange="this.form.submit()">
            <option value="2023/2024" <?php if ($selectedYear == '2023/2024') echo 'selected'; ?>>2023/2024</option>
            <option value="2022/2023" <?php if ($selectedYear == '2022/2023') echo 'selected'; ?>>2022/2023</option>
        </select>
    </form>
</div>
    <div class="place">
      <div class="ranked">

      <?php
    $position = 1;

    foreach ($classement as $equipe) {
        if ($position <= 3) {
            $nomEquipe = $equipe['nom'];
            $imageEquipe = $equipe['MAX(logo.photologo)'];
            $idEquipe = $equipe['id'];
    ?>
        <a href="./vue/vueclub.php?id=<?php echo $idEquipe; ?>">
          <div class="place<?php echo $position; ?>">
              <div class="boxlogoclub"><img src="<?php echo $imageEquipe; ?>" alt="Logo de <?php echo $nomEquipe; ?>" width="80px"></div>
              <p><?php echo $nomEquipe; ?></p>
              <div class="boxplaceclub">
                  <p>#<?php echo $position; ?></p>
              </div>
          </div>

    <?php
        }

        $position++;
    }
    ?>
    iy
  <a href="./vue/vueclub.php?id=<?php echo $idEquipe; ?>">
        <div class="general">
          <img src="<?php echo $imageDeuxiemeEquipe;?>" alt="logo du deuxieme" width="50%">
          <div class="deux">
            <p><?php echo $nomDeuxiemeEquipe; ?></p>
            <div class="coupe2">
              <p>2</p>
            </div>
          </div>
        </div>
  </a>

        <div class="general2">
        <img src="<?php echo $imagePremiereEquipe; ?>" alt="logo du premier" width="50%">
          <div class="un">
            <p><?php echo $nomPremiereEquipe; ?></p>
            <div class="coupe1">
              <p>1</p>
            </div>
          </div>
        </div>

        <div class="general3">
        <img src="<?php echo $imageTroisiemeEquipe; ?>" alt="logo du troisieme" width="50%">
          <div class="trois">
            <p><?php echo $nomTroisiemeEquipe; ?></p>
            <div class="coupe3">
              <p>3</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="classement" id="Classement">

<?php
    $position = 1;

    foreach ($classement as $equipe) {
        if ($position >= 4) {
            $nomEquipe = $equipe['nom'];
            $imageEquipe = $equipe['MAX(logo.photologo)'];
            $idEquipe = $equipe['id'];
    ?>
        <a href="./vue/vueclub.php?id=<?php echo $idEquipe; ?>">
          <div class="place<?php echo $position; ?>">
              <div class="boxlogoclub"><img src="<?php echo $imageEquipe; ?>" alt="Logo de <?php echo $nomEquipe; ?>" width="80px"></div>
              <p><?php echo $nomEquipe; ?></p>
              <div class="boxplaceclub">
                  <p>#<?php echo $position; ?></p>
              </div>
          </div>

    <?php
        }

        $position++;
    }
    ?>
  </div>

</div>

    </body>