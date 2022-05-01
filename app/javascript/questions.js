const userNavbarColor = document.getElementById('user_navbar_color');

function func() {
    let navbar = document.querySelector('.navbar')
    navbar.style.backgroundColor = this.value;
}

userNavbarColor.addEventListener('change', func)
