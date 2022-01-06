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
