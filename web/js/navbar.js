const toggleBtn = document.querySelector('.navbar__toggleBtn');
const menu = document.querySelector('.navbar__menu');
const icon = document.querySelector('.navbar__icon');

toggleBtn.addEventListener('click', () => {
    menu.classList.toggle('active');
    icon.classList.toggle('active');
})