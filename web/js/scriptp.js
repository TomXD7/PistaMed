var slideIndex = 1;
showSlides(slideIndex);

function currentSlidePistachos(n){
    showSlidesPistachos(slideIndex = n);
}

function showSlidesPistachos(n){
    var i;
    const slides = document.querySelectorAll(".pis");
    const dots = document.querySelectorAll(".dotp");
    if(n > slides.length){slideIndex = 1;}
    if(n < 1){slideIndex = slides.length}
    for(i = 0; i < slides.length; i++){
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "grid";
    dots[slideIndex-1].className += " active";
}