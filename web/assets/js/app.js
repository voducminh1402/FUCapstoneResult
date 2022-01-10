// Loading screen

window.addEventListener('load', () => {
    setTimeout(() => {
        offLoading();
    }, 500);
    setTimeout(() => {
        hideBackground();
    }, 800)
})

offLoading = () => {
    let loader = document.getElementById("loader");
    loader.style.opacity= 0;
    loader.style.visibility= 'none';
    loader.style.transition = 'ease-out 0.3s';
}

hideBackground = () => {
    let loader = document.getElementById("loader");
    loader.style.zIndex = -1;
}


// Header event
$(document).ready(function(){
	$('.menu-icon').click(function(){
		$(this).toggleClass('open');
        $('.menu-detail').toggleClass('active');
        $('.menu-detail')[0].style.right = '0';
        $('.overlay-page').toggleClass('block');
        setTimeout(function() {
            animationBar();
        },300);
	});
});

$(document).ready(function(){
	$('.overlay-page').click(function(){
		$('.overlay-page').toggleClass('block');
        $('.menu-detail').toggleClass('active');
        $('.menu-icon').toggleClass('open');
	});
});

animationBar = () => {
    let sidebar = document.getElementsByClassName('menu-detail')[0];
    sidebar.style.transition = 'ease-out 0.3s';
}


// Scroll navbar
window.onscroll = () => {
    const nav = document.querySelector('.header-part');
    if(this.scrollY <= 10) nav.className = 'header-part'; else nav.className = 'header-part scroll';
};

// Mod menu add
$(document).ready(function(){
	$('.add-project').click(function(){
        $('.add-project-menu').addClass('display-block');
        $('.overlay-page-mod').addClass('display-block');
        setTimeout(function() {
            animationBar();
        },300);
	});
});

$(document).ready(function(){
	$('.overlay-page-mod').click(function(){
		$('.overlay-page-mod').removeClass('display-block');
		$('.overlay-page-mod').addClass('display-none');
        $('.add-project-menu').removeClass('display-block');
		$('.add-project-menu').addClass('display-none');
	});
});

$(document).ready(function(){
	$('.cancel-add-btn').click(function(){
		$('.overlay-page-mod').removeClass('display-block');
		$('.overlay-page-mod').addClass('display-none');
        $('.add-project-menu').removeClass('display-block');
		$('.add-project-menu').addClass('display-none');
	});
});