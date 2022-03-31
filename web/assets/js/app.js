// Loading screen

window.addEventListener("load", () => {
  setTimeout(() => {
    offLoading();
  }, 500);
  setTimeout(() => {
    hideBackground();
  }, 800);
});

offLoading = () => {
  let loader = document.getElementById("loader");
  loader.style.opacity = 0;
  loader.style.visibility = "none";
  loader.style.transition = "ease-out 0.3s";
};

hideBackground = () => {
  let loader = document.getElementById("loader");
  loader.style.zIndex = -1;
};

// Header event
$(document).ready(function () {
  $(".menu-icon").click(function () {
    $(this).toggleClass("open");
    $(".menu-detail").toggleClass("active");
    $(".menu-detail")[0].style.right = "0";
    $(".overlay-page").toggleClass("block");
    setTimeout(function () {
      animationBar();
    }, 300);
  });
});

$(document).ready(function () {
  $(".overlay-page").click(function () {
    $(".overlay-page").toggleClass("block");
    $(".menu-detail").toggleClass("active");
    $(".menu-icon").toggleClass("open");
  });
});

// animationBar = () => {
//     let sidebar = document.getElementsByClassName('menu-detail')[0];
//     sidebar.style.transition = 'ease-out 0.3s';
// }

// Scroll navbar
window.onscroll = () => {
  const nav = document.querySelector(".header-part");
  if (this.scrollY <= 10) nav.className = "header-part";
  else nav.className = "header-part scroll";

  const scrollPage = document.querySelector(".scroll-page");
  const back = document.querySelector(".back-top");
  if (this.scrollY >= document.body.scrollHeight * 0.82) {
    scrollPage.classList.add("display-none");
    back.classList.remove("display-none");
    back.classList.add("display-block");
  } else {
    scrollPage.classList.remove("display-none");
    scrollPage.classList.add("display-block");
    back.classList.add("display-none");
  }
};

// Mod menu add
$(document).ready(function () {
  $(".add-project").click(function () {
    $(".overlay-page-mod").removeClass("display-none");
    $(".overlay-page-mod").addClass("display-block");
    $(".add-project-menu").removeClass("display-none");
    $(".add-project-menu").addClass("display-block");
    $(".overlay-page-mod").addClass("display-block");
    $("#mod-post__preview-input").val("");
    $("#mod-post__preview-link").attr("href", "");
    $("#mod-post__preview-image").attr("src", "");
    // setTimeout(function() {
    //     animationBar();
    // },300);
  });
});

$(document).ready(function () {
  $(".overlay-page-mod").click(function () {
    $(".overlay-page-mod").removeClass("display-block");
    $(".overlay-page-mod").addClass("display-none");
    $(".add-project-menu").removeClass("display-block");
    $(".add-project-menu").addClass("display-none");
  });
});

$(document).ready(function () {
  $(".cancel-add-btn").click(function () {
    $(".overlay-page-mod").removeClass("display-block");
    $(".overlay-page-mod").addClass("display-none");
    $(".add-project-menu").removeClass("display-block");
    $(".add-project-menu").addClass("display-none");
  });
});

$(document).ready(function () {
  $(".edit-slide").click(function () {
    $(".overlay-page-mod").removeClass("display-none");
    $(".overlay-page-mod").addClass("display-block");
    $("#edit-slide-menu").removeClass("display-none");
    $("#edit-slide-menu").addClass("display-block");
    $(".overlay-page-mod").addClass("display-block");
    $("#edit-slide-menu #id-edit").val($(this).data('id'));
    $("#edit-slide-menu #title-edit").val($(this).data('title'));
    $("#edit-slide-menu #url-edit").val($(this).data('url'));
    $("#edit-slide-menu #image-link-edit").val($(this).data('image'));
    $("#edit-slide-menu #image-inp-edit").val($(this).data('image'));
    $("#edit-slide-menu #image-img-edit").attr("src", $(this).data('image'));
    // setTimeout(function() {
    //     animationBar();
    // },300);
  });
});

$(document).ready(function () {
  $(".overlay-page-mod").click(function () {
    $(".overlay-page-mod").removeClass("display-block");
    $(".overlay-page-mod").addClass("display-none");
    $("#edit-slide-menu").removeClass("display-block");
    $("#edit-slide-menu").addClass("display-none");
  });
});

$(document).ready(function () {
  $(".cancel-edit-btn").click(function () {
    $(".overlay-page-mod").removeClass("display-block");
    $(".overlay-page-mod").addClass("display-none");
    $("#edit-slide-menu").removeClass("display-block");
    $("#edit-slide-menu").addClass("display-none");
  });
});


// SCROLL PAGE

let itemScrollList = document.querySelectorAll(".scroll-items span");
let btnScroll = document.querySelectorAll(".scroll-items span a i");

itemScrollList.forEach((ele) =>
  ele.addEventListener("click", () => {
    for (let i = 0; i < itemScrollList.length; i++) {
      itemScrollList[i].children[0].children[0].classList.remove(
        "scroll-active"
      );
      itemScrollList[i].parentNode.children[0].classList.remove(
        "scroll-active"
      );
    }
    ele.parentNode.children[0].classList.add("scroll-active");
    ele.children[0].children[0].classList.add("scroll-active");
  })
);

btnScroll.forEach((ele, index) =>
  ele.addEventListener("mouseenter", () => {
    for (let i = 0; i < itemScrollList.length; i++) {
      itemScrollList[index].parentNode.children[0].classList.remove(
        "display-none"
      );
    }
    itemScrollList[index].parentNode.children[0].classList.add("il-block");
  })
);

btnScroll.forEach((ele, index) =>
  ele.addEventListener("mouseout", () => {
    itemScrollList[index].parentNode.children[0].classList.add("display-none");
  })
);

// More choice menu

let moreChoiceDot = document.querySelectorAll(".more-choice__dot");
let moreChoiceMenu = document.querySelectorAll(".more-choice__menu");

moreChoiceDot.forEach((ele, index) =>
  ele.addEventListener("click", () => {
    for (let i = 0; i < moreChoiceMenu.length; i++) {
      if (i !== index) {
        moreChoiceMenu[i].style.display = "none";
      }
    }
    if (moreChoiceMenu[index].style.display === "none") {
      moreChoiceMenu[index].style.display = "block";
    } else {
      moreChoiceMenu[index].style.display = "none";
    }
  })
);

document.getElementById("event-btn").addEventListener("click", () => {
  let content = document.getElementById("event-content");

  if (content.style.display === "none") {
    content.style.display = "block";
    document.getElementById("event-btn").innerHTML = "Đóng"
    content.style.transition = "ease-in 0.2s"
    
  }
  else {
    document.getElementById("event-btn").innerHTML = "Sự Kiện Nổi Bật"
    content.style.display = "none";
    content.style.transition = "ease-in 0.2s"
    localStorage.setItem("event-post-status", "true")
  }
})

window.onload = () => {
  if(localStorage.getItem('event-post-status') === 'true') {
    document.getElementById("event-content").style.display = "none"
    document.getElementById("event-btn").innerHTML = "Sự Kiện Nổi Bật"
  }
}

window.addEventListener("scroll", () => {
    console.log(window.pageYOffset)
    let datn = document.getElementById("do-an-tot-nghiep")
    
    if (datn == 843) {
        
    }
    
})