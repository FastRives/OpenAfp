// Constante à créer pour aller chercher l'élément cliquable sur votre HTML lors de l'appel de la fonction (plus bas).
const Exemple = document.getElementById('Exemple'); 

// Fonction responsable du scroll. [target] = ID ('#exemple') ou Class ('.exemple') de l'élement ciblé pour le scroll lors du clique sur le bouton initial.
// [duration] =  temps de l'animation du scroll.
function smoothScroll(target, duration){
    
    // Création des variables à placer dans les fonctions imbriquées de la fonction smoothScroll().
    var target = document.querySelector(target);
    var targetPosition = target.getBoundingClientRect().top;
    var startPosition = window.pageYOffset;
    var distance = targetPosition;
    var startTime = null;  

    // Fonction créant l'animation du scroll.
    function animation(currentTime){
        if(startTime === null) startTime = currentTime;
        var timeElapsed = currentTime - startTime;
        var run = ease(timeElapsed, startPosition, distance, duration);
        window.scrollTo(0, run);
        if(timeElapsed < duration) requestAnimationFrame(animation);
    }

    // Permet l'animation du scroll, peut être remplacé par les autres formules correspondantes à Ease-in-out etc...
    function ease(t,b,c,d){
        t /= d / 2;
        if (t < 1) return c / 2 * t * t +b;
        t--;
        return -c / 2 * (t *(t - 2) - 1) +b;
    }

    // Appelle une animation par défaut au cas où celle dans la fonction ne déclencherait pas pour X raisons.
    requestAnimationFrame(animation);
}

// Appel de la fonction smoothScroll() en fonction du clique sur l'élément souhaité. Paramétres à adapter selon les besoins, ID ou Class.
Exemple.addEventListener('click', function() {
    smoothScroll('#IDexemple', 1000);
})

Exemple.addEventListener('click', function() {
    smoothScroll('.Classexemple', 1000);
})