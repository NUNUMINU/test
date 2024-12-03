const cautionToggleBtn1 = document.querySelector('.caution_btn1');
const cautionBox1 = document.querySelector('.caution_box1');
cautionToggleBtn1.addEventListener('click', () => {
    cautionBox1.classList.toggle('active');
    if (cautionBox2.classList.contains('active')) {
        cautionBox2.classList.remove('active');
    }
})

const cautionToggleBtn2 = document.querySelector('.caution_btn2');
const cautionBox2 = document.querySelector('.caution_box2');
cautionToggleBtn2.addEventListener('click', () => {
    cautionBox2.classList.toggle('active');
    if (cautionBox1.classList.contains('active')) {
        cautionBox1.classList.remove('active');
    }
})