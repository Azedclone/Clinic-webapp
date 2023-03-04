//Login function
function login() {
    $('#login').submit(function (e) {
        e.preventDefault();

        $.ajax({
            url: '../../login',
            type: 'POST',
            data: $('#login').serialize()
        }).done(function (data) {
            if (data.trim() == 'ok') {
                Swal.fire({
                    title: 'Login successful!',
                    icon: 'success',
                    text: 'Redirect you to home page',
                    showConfirmButton: false,
                    timer: 1000,
                    timerProgressBar: true
                });
                setTimeout(function () {
                    window.location.href = "../common/home.jsp";
                }, 1000);
            } else if (data.trim() == 'wrong') {
                Swal.fire({
                    title: 'Login fail!',
                    icon: 'error',
                    text: 'Wrong password!',
                    confirmButtonText: 'Try again!'
                });
            } else {
                Swal.fire({
                    title: 'Login fail!',
                    icon: 'error',
                    text: 'Account not exist!',
                    confirmButtonText: 'Try again!'
                });
            }
        })

    })
}

//function Logout
function logout() {
    $(document).on('click', 'a#logout', function (e) {
        e.preventDefault();

        $.post('../../logout')
        Swal.fire({
            title: 'Logout successful!',
            icon: 'success',
            text: 'Redirect you to home page',
            showConfirmButton: false,
            timer: 1000,
            timerProgressBar: true
        });
        setTimeout(function () {
            window.location.href = "../common/home.jsp";
        }, 1000);
    })
}

//Function register
function register() {
    $('#register').submit(function (e) {
        e.preventDefault();

        $.ajax({
            url: '../../register',
            type: 'POST',
            data: $('#register').serialize()
        }).done(function (data) {
            if (data.trim() == 'ok') {
                Swal.fire({
                    title: 'Register successful!',
                    icon: 'success',
                    text: 'Redirect you to login page',
                    showConfirmButton: false,
                    timer: 1000,
                    timerProgressBar: true
                });
                setTimeout(function () {
                    window.location.href = "login.jsp";
                }, 1000);
            } else {
                Swal.fire({
                    title: 'Register fail!',
                    icon: 'error',
                    text: 'Username is already exist!',
                    confirmButtonText: 'Try again!'
                });
            }
        })
    })
}

// Function forgot password
function forgot() {
    $('#forgot').submit(function(e){
        e.preventDefault();

        $.ajax({
            url: '../../forgot',
            type: 'POST',
            data: $('#forgot').serialize()
        }).done(function(data){
            console.log(data)
            if (data.trim() == "!exist") {
                Swal.fire({
                    icon: 'error',
                    title: 'Username not exist',
                    text: 'Please check your username you entered'
                })
            } else if (data.trim() == "!linked") {
                Swal.fire({
                    icon: 'error',
                    title: 'Account not linked to any mail',
                    text: "This mail not linked to your account"
                })
            } else {
                Swal.fire({
                    icon: 'success',
                    title: 'Reset password successful!',
                    text: 'Please check your mail to get new password!'
                })
            }
        })
    })
}