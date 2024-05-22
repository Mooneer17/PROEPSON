let currentIndex=0;

const box = document.getElementsByClassName('slider-content'); 

const handleNext = () => {
    const nextIndex = currentIndex + 1 <= box.length - 1 ? currentIndex + 1 : 0;
    const currentBox = document.querySelector(`[data-index="${currentIndex}"]`);
    const nextBox = document.querySelector(`[data-index="${nextIndex}"]`);


    currentBox.dataset.status = 'active';
    currentBox.dataset.status = 'hide';
    nextBox.dataset.status = 'next';


    currentIndex = nextIndex;   

}

const handlePrev = () => {
    const nextIndex = currentIndex - 1 >= 0 ? currentIndex - 1 : box.length - 1;
    const currentBox = document.querySelector(`[data-index="${currentIndex}"]`);
    const nextBox = document.querySelector(`[data-index="${nextIndex}"]`);


    currentBox.dataset.status = 'unknown';
    currentBox.dataset.status = 'hide';
    nextBox.dataset.status = 'next';


    currentIndex = nextIndex;   

}