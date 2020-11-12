// Initialisation des variables diverses 

    const containerMenu = document.querySelector('.container-menu');
    const btnMenu = document.querySelector('.btn-menu');
    const allRonds = document.querySelectorAll('.rond');
    const allBoxes = document.querySelectorAll('.boxmagic');
    const controller = new ScrollMagic.Controller();
    const Menu2 = document.getElementById('Menu2');
    const Menu3 = document.getElementById('Menu3');
    const Menu4 = document.getElementById('Menu4');
    const Menu5 = document.getElementById('Menu5');
    const Menu6 = document.getElementById('Menu6');
    const Menu7 = document.getElementById('Menu7');

// Apparition du menu au clic

    var testMenu = $('#menutest');

    btnMenu.addEventListener('click', () => {
        containerMenu.classList.toggle('active');
    });


// Ensemble permettant au menu de disparaitre automatiquement au clic d'un autre endroit de la page.

    var ContainerElement = document.getElementById('Container-Menu');

    document.addEventListener('click', function(event) {
    var isClickInside = ContainerElement.contains(event.target);

    if (!isClickInside) {
        containerMenu.classList.remove("active");
    }
    });

// ScrollMagic de la timelane

    allBoxes.forEach(box => {

        for(i = 0; i < allRonds.length; i++){

            if(allRonds[i].getAttribute('data-anim') === box.getAttribute('data-anim')){

                let tween = gsap.from(box, {y: -50, opacity: 0, duration: 0.5})

                let scene = new ScrollMagic.Scene({
                    triggerElement: allRonds[i],
                    reverse: false
                })
                .setTween(tween)
                //.addIndicators()
                .addTo(controller)
            }
        }
    })

// Création et appel de la fonction permettant le scroll sur la navbar.

    function smoothScroll(target, duration){
        var target = document.querySelector(target);
        console.log(target);
        var targetPosition = target.getBoundingClientRect().top;
        var startPosition = window.pageYOffset;
        var distance = targetPosition;
        var startTime = null;
        console.log("StartPosition : "+startPosition);
        console.log("targetPosition : "+targetPosition);
        console.log("Distance : "+distance);    

        function animation(currentTime){
            if(startTime === null) startTime = currentTime;
            var timeElapsed = currentTime - startTime;
            var run = ease(timeElapsed, startPosition, distance, duration);
            window.scrollTo(0, run);
            if(timeElapsed < duration) requestAnimationFrame(animation);
        }

        function ease(t,b,c,d){
            t /= d / 2;
            if (t < 1) return c / 2 * t * t +b;
            t--;
            return -c / 2 * (t *(t - 2) - 1) +b;
        }

        requestAnimationFrame(animation);
    }

    Menu2.addEventListener('click', function() {
        smoothScroll('#slide1', 1000);
    })
    Menu3.addEventListener('click', function() {
        smoothScroll('#slide3', 1000);
    })
    Menu4.addEventListener('click', function() {
        smoothScroll('#slide4', 1000);
    })
    Menu5.addEventListener('click', function() {
        smoothScroll('#slide5', 1000);
    })
    Menu6.addEventListener('click', function() {
        smoothScroll('#slide6', 1000);
    })
    Menu7.addEventListener('click', function() {
        smoothScroll('#slide7', 1000);
    })


// Progressbar compétences

    $(function() {
            
        $('.progressbar').each(function(){
            var t = $(this);
            var dataperc = t.attr('data-perc'),
            barperc = Math.round(dataperc*5.56);
            t.find('.label').append('<div class="perc"></div>');
            
            function perc() {
                var length = t.find('.bar').css('width'),
                labelpos = (parseInt(length)-20);
                t.find('.label').css('left', labelpos);
            }
            perc();
            setInterval(perc, 0); 
        });
    });

// Bouton flèche //

    var btn = $('#button');

    $(window).scroll(function () {
    if ($(window).scrollTop() > 300) {
        btn.addClass('show');
    } else {
        btn.removeClass('show');
    }
    });

    btn.on('click', function (e) {
    e.preventDefault();
    $('html, body').animate({ scrollTop: 0 }, '300');
    });

// Début du formulaire et de sa vérification 

    // Initialisation des constantes pour récupérer les selecteurs

        const btnSubmit = $('#btnSubmitID');
        const inputNom = $('#inputNom');
        const inputPrenom = $('#inputPrenom');
        const inputEmail = $('#inputEmail');
        const inputMessage = $('#inputMessage');


    // Déclaration des regex à vérifier 

        var VerifNom = /^([A-Za-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ]{1,15})[-\'\s]{0,1}([A-Za-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ]{1,15})[-\s]{0,1}([A-Za-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ]{1,15})$/;
        var VerifPrenom = /^([A-Za-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ]{1,15})[-\'\s]{0,1}([A-Za-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ]{0,15})[-\s]{0,1}([A-Za-záàâäãåçéèêëíìîïñóòôöõúùûüýÿæœÁÀÂÄÃÅÇÉÈÊËÍÌÎÏÑÓÒÔÖÕÚÙÛÜÝŸÆŒ]{0,15})$/;
        var VerifEmail = /^([a-zA-Z0-9-_]{1,20})+(\.[a-zA-Z0-9-_]{1,20})*\@[a-zA-Z0-9_]+(\.[a-zA-Z0-9_]{1,20})*\.[a-zA-Z]{2,4}$/;
        var VerifMessage = /^([A-Za-z0-9._%+&é"'(-è_çà)=-\s][^<>]{1,1000})$/;

    // Déclaration des flags de vérification

        var FlagNom = 0;
        var FlagPrenom = 0;
        var FlagEmail = 0;
        var FlagMessage = 0;
        var Erreur = ["", "", "", ""]; // Tableau qui permettra d'afficher d'où vient l'erreur.

    // Fonction de verification des champs

        function checkfield() {
            inputNomVal = inputNom.val();
            inputPrenomVal = inputPrenom.val();
            inputEmailVal = inputEmail.val();
            inputMessageVal = inputMessage.val();

            if(VerifNom.test(inputNomVal) == true)
            {
                FlagNom = 1;
                inputNom.css("color", "#fff");
                Erreur[0] = "";
            }
            else if (VerifNom.test(inputNomVal) == false)
            {
                FlagNom = 0;
                inputNom.css("color", "red");
                Erreur[0] = "Votre Nom est incorrectement saisi.\n";
            }

            if(VerifPrenom.test(inputPrenomVal) == true)
            {
                FlagPrenom = 1;
                inputPrenom.css("color", "#fff");
                Erreur[1] = "";
            }
            else if (VerifPrenom.test(inputPrenomVal) == false)
            {
                FlagPrenom = 0;
                inputPrenom.css("color", "red");
                Erreur[1] = "Votre prénom est incorrectement saisi.\n";
            }

            if(VerifEmail.test(inputEmailVal) == true)
            {
                FlagEmail = 1;
                inputEmail.css("color", "#fff");
                Erreur[2] = "";
            }
            else if (VerifEmail.test(inputEmailVal) == false)
            {
                FlagEmail = 0;
                inputEmail.css("color", "red");
                Erreur[2] = "Votre Email est invalide.\n";
            }

            if(VerifMessage.test(inputMessageVal) == true)
            {
                FlagMessage = 1;
                inputMessage.css("color", "#fff");
                Erreur[3] = "";
            }
            else if (VerifMessage.test(inputMessageVal) == false)
            {
                FlagMessage = 0;
                inputMessage.css("color", "red");
                Erreur[3] = "Votre message est incorrect.\n"
            }
        };

    // Execution de la vérification de tous les champs à chaque frappe des champs du formulaire

        inputNom.keyup(function(){checkfield()});
        inputPrenom.keyup(function(){checkfield()});
        inputEmail.keyup(function(){checkfield()});
        inputMessage.keyup(function(){checkfield()});

    // Test + envoie du formulaire

        btnSubmit.click(function(){
            var TestOK = FlagNom + FlagPrenom + FlagEmail + FlagMessage;
            checkfield();
            if (TestOK == 4)
            {
                alert("Votre saisie est acceptée.\nEnvoie du formulaire de contact.");
                // Ici pour éviter toute la partie en PHP qui sera faite plus tard :
                // Je laisse le type du input submit en "button", sinon, je l'aurais fait changer ici en "Submit" pour envoyer le formulaire au post seulement si tout est bon.
            }
            else {
                alert("Votre saisie comporte une erreur, veuillez vérifier les champs en erreur.\n"+Erreur[0]+Erreur[1]+Erreur[2]+Erreur[3]);
            }
        });