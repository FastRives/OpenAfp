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

    btnMenu.addEventListener('click', () => {
        containerMenu.classList.toggle('active');
    });

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
    smoothScroll('#slide5', 1000);
})



// Progressbar
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