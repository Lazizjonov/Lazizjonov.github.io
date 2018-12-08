
/*---------------------------------------------preloader-------------------------------------------------*/
var preloader = document.getElementById("preloader");
var hello = document.getElementById("hello");
var helloCount = 0;
var words = [document.getElementById("korhello").innerHTML, "HELLO", "BONJOUR", "CIAO", document.getElementById("arabhello").innerHTML, document.getElementById("ruhello").innerHTML,"SALOM"];
var printer = setInterval(function(){
	hello.innerHTML = words[helloCount++];
	if(helloCount === 7){
		helloCount = 0;
	}
}, 500);
setTimeout(function(){preloader.style.display = "none"; clearInterval(printer);}, 4000);

/*---------------------------------------------end-preloader-------------------------------------------------*/
/*----------------------------------------------stickynav-------------------------------------------------*/
// When the user scrolls the page, execute myFunction 
window.onscroll = function() {myFunction()};

// Get the navbar
var navbar = document.getElementById("navbar");

// Get the offset position of the navbar
var sticky = navbar.offsetTop;

// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}
/*---------------------------------------------end-stickynav-------------------------------------------------*/

/*----------------------------------------------animation-------------------------------------------------*/

function isScrolledIntoView(elem)
{
    var docViewTop = $(window).scrollTop();
    var docViewBottom = docViewTop + $(window).height();

    var elemTop = $(elem).offset().top;
    var elemBottom = elemTop + $(elem).height();

    return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
}

// Check if it's time to start the animation.
function checkAnimation() {
    var $elem1 = $('#front-side-1');
    if (isScrolledIntoView($elem1)) {
        // Start the animation
        $elem1.addClass('go-bulbul-right');
    } else {
        $elem1.removeClass('go-bulbul-right');
    }
    var $elem2 = $('#front-side-2');
    if (isScrolledIntoView($elem2)) {
        // Start the animation
        $elem2.addClass('go-bulbul-left');
    } else {
        $elem2.removeClass('go-bulbul-left');
    }
    var $elem3 = $('#front-side-3');
    if (isScrolledIntoView($elem3)) {
        // Start the animation
        $elem3.addClass('go-bulbul-right');
    } else {
        $elem3.removeClass('go-bulbul-right');
    }
    var $elem3 = $('#front-side-4');
    if (isScrolledIntoView($elem3)) {
        // Start the animation
        $elem3.addClass('go-bulbul-right');
    } else {
        $elem3.removeClass('go-bulbul-right');
    }
    var $elem3 = $('#front-side-5');
    if (isScrolledIntoView($elem3)) {
        // Start the animation
        $elem3.addClass('go-bulbul-left');
    } else {
        $elem3.removeClass('go-bulbul-left');
    }
    var $elem3 = $('#front-side-6');
    if (isScrolledIntoView($elem3)) {
        // Start the animation
        $elem3.addClass('go-bulbul-right');
    } else {
        $elem3.removeClass('go-bulbul-right');
    }
}


// Capture scroll events
$(window).scroll(function(){
    checkAnimation();
});
/*---------------------------------------------end-animation-------------------------------------------------*/

// _____________________________________________gallary-area___________________________________________________________

var j12 = 0;
var inter = window.setInterval(jasur, 5000);
var timeo = 0;
$('.gallery-elem').on('click',function(){
	while(!($(this).hasClass('block-1'))){
		jasur();
	}
	clearInterval(inter);
	clearTimeout(timeo);
	timeo = setTimeout(function(){inter = window.setInterval(jasur, 5000);}, 10000);
});
function jasur(){
  $('#ge1').removeClass('block-'+j12%7);
  $('#ge1').addClass('block-'+(j12+1)%7);
  $('#ge2').removeClass('block-'+(j12+1)%7);
  $('#ge2').addClass('block-'+(j12+2)%7);
  $('#ge3').removeClass('block-'+(j12+2)%7);
  $('#ge3').addClass('block-'+(j12+3)%7);
  $('#ge4').removeClass('block-'+(j12+3)%7);
  $('#ge4').addClass('block-'+(j12+4)%7);
  $('#ge5').removeClass('block-'+(j12+4)%7);
  $('#ge5').addClass('block-'+(j12+5)%7);
  $('#ge6').removeClass('block-'+(j12+5)%7);
  $('#ge6').addClass('block-'+(j12+6)%7);
  $('#ge7').removeClass('block-'+(j12+6)%7);
  $('#ge7').addClass('block-'+j12%7);
  j12++;
  if (j12 === 8){
  	j12 = 1;
  }
}