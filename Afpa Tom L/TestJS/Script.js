/* -------------------- UN 

var prenom = window.prompt("Quel est votre prénom ?");
var Sexe = confirm("Etes vous un Homme ?");

if (Sexe == true)
{
    var SexeResp = "Monsieur";
}
else 
{
    var SexeResp = "Madame";
}

window.alert("Bonjour " + SexeResp + " " + prenom + "\n Bienvenue sur notre site !");
 */

/* ------------------- DEUX - Saisie des prénoms + calcul du nombre saisie

 var prenom = window.prompt("Saisissez un prénom :");
i = 0;

while (prenom != "")
{
    prenom = window.prompt("Saisissez un prénom");
    i++;
}

alert("Vous avez saisie " + i + " prénoms."); */

/* ------------- TROIS
var nombre = window.prompt("Saisissez un nombre :");
i = 0;

while(i < nombre)
{
    document.write(i + "</br>");
    i++;
}
 */

/* -------- TROIS

var nombre = window.prompt("Saisissez un nombre");
var i = 0;
var total = 0;

while(i<nombre)
{
    total = total + i;
    i++;
}

alert("Somme des entiers inférieurs à votre saisie : " + total); */

/* ------------ QUATRE

var n1 = parseInt(window.prompt("Saisissez n1 : "));
var n2 = parseInt(window.prompt("Saisissez n2 : "));
var i = n1 + 1;
var total = 0;

while(i<n2)
{
    console.log(n1);
    console.log(i);
    total = total + i;
    i++;
}

window.alert("La somme des nombres entre ces deux intervalles est de : " + total); */

/* ---------- LONG

var n = window.prompt("Saisissez le nombre de ligne de la table : ");
var x = window.prompt("Saisissez la table que vous souhaitez afficher : ");

for (i=1; i<=n; i++)
{
    document.write(i + " x " + x + " = " + i*x + "</br>");
} */

