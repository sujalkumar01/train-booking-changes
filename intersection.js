const locations = document.querySelector('.locations');

const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
        if(entry.isIntersecting) {
            locations.classList.add('location-animation');
        } else {
            locations.classList.remove('location-animation');
        }
    },)
});

observer.observe(locations);