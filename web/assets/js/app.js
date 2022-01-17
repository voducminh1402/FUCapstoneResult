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

// animationBar = () => {
//     let sidebar = document.getElementsByClassName('menu-detail')[0];
//     sidebar.style.transition = 'ease-out 0.3s';
// }


// Scroll navbar
window.onscroll = () => {
    const nav = document.querySelector('.header-part');
    if(this.scrollY <= 10) nav.className = 'header-part'; else nav.className = 'header-part scroll';

    const scrollPage = document.querySelector('.scroll-page');
    const back = document.querySelector('.back-top');
    if(this.scrollY >= document.body.scrollHeight * 0.82) {
        scrollPage.classList.add('display-none');
        back.classList.remove('display-none');
        back.classList.add('display-block');
    }
    else {
        scrollPage.classList.remove('display-none');
        scrollPage.classList.add('display-block');
        back.classList.add('display-none');
    }
};

// Mod menu add
$(document).ready(function(){
	$('.add-project').click(function(){
        $('.overlay-page-mod').removeClass('display-none');
        $('.overlay-page-mod').addClass('display-block');
        $('.add-project-menu').removeClass('display-none');
        $('.add-project-menu').addClass('display-block');
        $('.overlay-page-mod').addClass('display-block');
        // setTimeout(function() {
        //     animationBar();
        // },300);
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

// SCROLL PAGE

let itemScrollList = document.querySelectorAll('.scroll-items span');
let btnScroll = document.querySelectorAll('.scroll-items span a i');

itemScrollList.forEach(ele => ele.addEventListener('click', () => {
    for (let i = 0; i < itemScrollList.length; i++) {
        itemScrollList[i].children[0].children[0].classList.remove('scroll-active');
        itemScrollList[i].parentNode.children[0].classList.remove('scroll-active');
    }
    ele.parentNode.children[0].classList.add('scroll-active');
    ele.children[0].children[0].classList.add('scroll-active');
}))

btnScroll.forEach((ele, index) => ele.addEventListener('mouseenter', () => {
    for (let i = 0; i < itemScrollList.length; i++) {
        itemScrollList[index].parentNode.children[0].classList.remove('display-none');
    }
    itemScrollList[index].parentNode.children[0].classList.add('il-block');
}))

btnScroll.forEach((ele, index) => ele.addEventListener('mouseout', () => {
    itemScrollList[index].parentNode.children[0].classList.add('display-none');
}))








