var defaultImage = "./ressources/FondEcranEquipe/ManCity.png";
var newImage = "./ressources/FondEcranEquipe/Bayern.png";
var newImage2 = "./ressources/FondEcranEquipe/Chealsea.png";

var podium = document.getElementById("podium");
var place2 = document.querySelector(".general");
var place3 = document.querySelector(".general");


document.querySelector(".general").addEventListener("mouseover", function () {
  podium.style.transition = "background-image 0.3s ease";
  podium.style.backgroundImage = "url(" + newImage + ")";
});

document.querySelector(".general3").addEventListener("mouseover", function () {
  podium.style.transition = "background-image 0.3s ease";
  podium.style.backgroundImage = "url(" + newImage2 + ")";
});

var resetBackground = function () {
  podium.style.transition = "background-image 0.3s ease";
  podium.style.backgroundImage = "url(" + defaultImage + ")";
};

document.querySelector(".general2").addEventListener("mouseout", resetBackground);
document.querySelector(".general").addEventListener("mouseout", resetBackground);
document.querySelector(".general3").addEventListener("mouseout", resetBackground);



document.getElementById('tri').addEventListener('change', function() {
  document.getElementById('triForm').submit();
});


