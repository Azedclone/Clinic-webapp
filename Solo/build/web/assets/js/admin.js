window.onload = function () {
    const sidebar = document.querySelector('#sidebar');
    const closeBtn = document.querySelector('.btn-menu');

    closeBtn.addEventListener("click", function () {
        sidebar.classList.toggle("open");
        menuBtnChange();
    });

    function menuBtnChange() {
        if (sidebar.classList.contains("open")) {
            closeBtn.classList.replace("fa-bars", "fa-caret-left");
        } else {
            closeBtn.classList.replace("fa-caret-left", "fa-bars");
        }
    }
};

function logout(e) {
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
}


$('section:not([id*="sidebar"])').hide();
$('#dashboard').show();

$('#sidebar li>a').click(function () {
    var href = $(this).attr('href').replace('#', '');

    $('section:not([id*=' + href + '])').hide();
    $('#' + href).show('fast', 'swing');
    $('#sidebar').show({});
});

// Load data by type of it
function loadData(type) {
    $.post('../../loadData?type=' + type, function (data) {
        if (type == "accounts") {
            $('#accounts > tbody').empty();
            $('h2.data-number.data-account').html(data.length);

            $.each(data, function (i, val) {
                const row = $('<tr>').append($('<th scope="row">').text(i + 1))
                        .append($('<td>').text(val.accountID))
                        .append($('<td>').text(val.username))
                        .append($('<td>').text(val.name))
                        .append($('<td>').text(val.email))
                        .append($('<td>').text(val.phone))
                        .append($('<td>').text((val.role == 1) ? 'Doctor' : 'Patient'));

                $('#accounts > tbody').append(row);
            });
        } else if (type == "doctors") {
            $.post('../../loadData?type=' + type, function (data) {
                var aEdit = $('<a class="editDoc" data-bs-toggle="modal" data-bs-target="#form-editDoc" href=""><i class="fa-solid fa-pen text-dark me-3"></i></a>');
                var aDeleteDoc = $('<a class="deleteDoc" href=""><i class="fa-solid fa-trash-can text-danger"></i></a>');
                $('#doctors > tbody').empty();
                $('h2.data-number.data-doctor').html(data.length);

                $.each(data, function (i, val) {
                    const row = $('<tr>').append($('<th scope="row">').text(i + 1))
                            .append($('<td>').text(val.username))
                            .append($('<td>').text(val.name))
                            .append($('<td>').text(val.email))
                            .append($('<td>').text(val.phone))
                            .append($('<td class="action">'));

                    row.find('td.action')
                            .append(aEdit.clone().attr({'href': '../../loadData?username=' + val.username}))
                            .append(aDeleteDoc.clone().attr({'href': '../../manageDoctor?username=' + val.username + '&type=delete'}));

                    $('#doctors > tbody').append(row);
                });
            });
        } else if (type == "patients") {
            $.post('../../loadData?type=' + type, function (data) {
                var aView = $('<a class="viewPat" data-bs-toggle="modal" data-bs-target="#form-viewPat" href=""><i class="fa-solid fa-eye text-primary me-3"></i></a>');
                var aDeletePat = $('<a class="deletePat" href=""><i class="fa-solid fa-trash-can text-danger"></i></a>');

                $('#patients > tbody').empty();
                $('h2.data-number.data-patient').html(data.length);

                $.each(data, function (i, val) {
                    const row = $('<tr>').append($('<th scope="row">').text(i + 1))
                            .append($('<td>').text(val.username))
                            .append($('<td>').text(val.name))
                            .append($('<td>').text(val.email))
                            .append($('<td>').text(val.phone))
                            .append($('<td class="action">'));

                    row.find('td.action')
                            .append(aView.clone().attr({'href': '../../loadData?username=' + val.username}))
                            .append(aDeletePat.clone().attr({'href': '../../managePatient?username=' + val.username + '&type=delete'}));

                    $('#patients > tbody').append(row);
                })
            })
        } else if (type == "blogs") {
            $.post('../../loadData?type=' + type, function (data) {
                var aEdit = $('<a class="editBlog" data-bs-toggle="modal" data-bs-target="#form-editBlog" href=""><i class="fa-solid fa-pen text-dark me-3"></i></a>');
                var aDeleteBlog = $('<a class="deleteBlog" href=""><i class="fa-solid fa-trash-can text-danger"></i></a>');

                $('#blogs > tbody').empty();
                $('h2.data-number.data-blog').html(data.length);

                $.each(data, function (i, val) {
                    const row = $('<tr>')
                            .append($('<th scope="row">').text(i + 1))
                            .append($('<td>').text(val.title))
                            .append($('<td>').text(val.categoryName))
                            .append($('<td>').text(val.authorName))
                            .append($('<td>').text(val.createdDate))
                            .append($('<td>').html((val.status == 1 ? 'Approved<i class="fa-solid fa-circle-check text-success ms-2"></i>' : 'Pending<i class="fa-solid fa-circle-pause text-danger ms-2"></i>')))
                            .append($('<td>').text(val.publishedDate))
                            .append($('<td class="action">'));

                    row.find('td.action')
                            .append(aEdit.clone().attr({'href': '../../loadData?blogID=' + val.blogID}))
                            .append(aDeleteBlog.clone().attr({'href': '../../manageBlog?blogID=' + val.blogID + '&type=delete'}))

                    $('#blogs > tbody').append(row);
                })
            })
        } else if (type == "categories") {
            $.post('../../loadData?type=' + type, function (data) {
                $('#categoryLabel').empty();
                $('#categoryBlogLabel').empty();

                $.each(data, function (i, val) {
                    $('#categoryLabel').append($('<option value="' + (i + 1) + '">').text(val.categoryName))
                    $('#categoryBlogLabel').append($('<option value="' + (i + 1) + '">').text(val.categoryName))
                })
            })
        }
    });
}

function fillForm() {
    $(document).on('click', 'a.editDoc', function (e) {
        e.preventDefault();

        $.post($(this).attr('href'), function (data) {
            $('#editDoc input#usernameDocLabel').attr({'value': data.username});
            $('#editDoc input#nameDocLabel').attr({'value': (data.name != null ? data.name : '')});
            $('#editDoc input#emailDocLabel').attr({'value': (data.email != null ? data.email : '')});
            $('#editDoc input#phoneDocLabel').attr({'value': (data.phone != null ? data.phone : '')});
            (data.gender == 0) ? ($('#maleDoc').prop('checked', true)) : ((data.gender == 1) ? ($('#femaleDoc').prop('checked', true)) : ($('#otherDoc').prop('checked', true)));
            $('#editDoc input#addressDocLabel').attr({'value': (data.address != null ? data.address : '')});
            $('#editDoc input#dobDocLabel').attr({'value': (data.dob != null ? data.dob : '')});
        });
    });

    $(document).on('click', 'a.viewPat', function (e) {
        $.post($(this).attr('href'), function (data) {
            $('#viewPat input#usernamePatLabel').attr({'value': data.username});
            $('#viewPat input#namePatLabel').attr({'value': (data.name != null ? data.name : '')});
            $('#viewPat input#emailPatLabel').attr({'value': (data.email != null ? data.email : '')});
            $('#viewPat input#phonePatLabel').attr({'value': (data.phone != null ? data.phone : '')});
            (data.gender == 0) ? ($('#malePat').prop('checked', true)) : ((data.gender == 1) ? ($('#femalePat').prop('checked', true)) : ($('#otherPat').prop('checked', true)));
            $('#viewPat input#addressPatLabel').attr({'value': (data.address != null ? data.address : '')});
            $('#viewPat input#dobPatLabel').attr({'value': (data.dob != null ? data.dob : '')});
        });
    });

    $(document).on('click', 'a.editBlog', function (e) {
        $.post($(this).attr('href'), function (data) {
            $('#editBlog input#blogIDLabel').attr('value', data.blogID);
            $('#editBlog input#titleBlogLabel').attr('value', data.title);
            $('#editBlog select#categoryBlogLabel option[value="' + data.categoryID + '"]').prop("selected", true);
            $('#editBlog img#thumbPreview').attr('src', '../../assets/img/blogs/' + data.thumbnails)
            $('#editBlog textarea#contentBlogLabel').val(data.content);
            $('#editBlog input[name="status"][value="' + data.status + '"]').prop('checked', true);
        })
    });
}

// Function Create Doctor
function createDoctor() {
    $("#createDoc").on('shown', function () {
        $('.modal-backdrop').show();
    });

    $('input#usernameLabel').blur(function () {
        var value = $(this).val();
        if (/^(?=[a-zA-Z]+)\w{2,20}$/.test(value)) {
            $('#usernameHelp').html("User name must not be duplicate.");
        } else {
            $('#usernameHelp').html('<p class="text-danger"><i class="fa-sharp fa-solid fa-triangle-exclamation me-2"></i>Username must have 2-20 characters<br>Only accept alphanumeric and underscore (must start by at least 1 letter)</p>');
        }
    });
    $('input#passwordLabel').blur(function () {
        var value = $(this).val();
        // Validate input
        if (/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,50}$/.test(value)) {
            $('#passwordHelp').html("");
        } else {
            $('#passwordHelp').html('<p class="text-danger"><i class="fa-sharp fa-solid fa-triangle-exclamation me-2"></i>Password must have 8-50 characters and contains at least 1 letter and 1 number</p>');
        }
    });
    $('#createDoc').submit(function (e) {
        e.preventDefault();

        Swal.fire({
            icon: 'question',
            title: 'Confirmation',
            text: 'Are you sure to create this account?',
            showCancelButton: true,
            confirmButtonText: 'Yes'
        }).then(result => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '../../manageDoctor',
                    type: 'POST',
                    datatype: 'JSON',
                    data: {data: JSON.stringify($('#createDoc').serialize()), type: 'create'}
                }).done(function (data) {
                    if (data.trim() == 'ok') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Create Doctor',
                            text: 'Create Doctor successful',
                            timer: 1000,
                            timerProgressBar: true
                        });
                        setTimeout(function () {
                            loadData("accounts");
                            loadData("doctors");
                            $('#createDoc')[0].reset();
                            $('#form-createDoc').modal('hide');
                            $('.modal-backdrop').remove();
                        }, 1000);
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Username already existed',
                            text: 'Please try another username!'
                        })
                    }
                    ;
                });
            }
            ;
        });
    })
}


// Function Edit Doctor
function editDoctor() {
    // Validate data input
    $('input#nameDocLabel').blur(function () {
        if (/^[a-zA-Z\s]{2,50}$/.test($(this).val())) {
            $('p.nD').html("");
        } else {
            $('p.nD').html('<i class="fa-sharp fa-solid fa-triangle-exclamation me-2"></i>Name must contains only letters and from 2-50 characters');
        }
    });
    $('input#emailDocLabel').blur(function () {
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test($(this).val())) {
            $('p.eD').html("");
        } else {

            $('p.eD').html('<i class="fa-sharp fa-solid fa-triangle-exclamation me-2"></i>Email is not valid');
        }
    })
    $('input#phoneDocLabel').blur(function () {
        if (/^((?=[0]+)\d{9,10})$/.test($(this).val())) {
            $('p.pD').html("");
        } else {
            $('p.pD').html('<i class="fa-sharp fa-solid fa-triangle-exclamation me-2"></i>Phone must start with 0 and have 10-11 digits');
        }
    })
    $('input#addressDocLabel').blur(function () {
        if (/^((?=[A-Za-z]+)[a-zA-Z\-\s]{5,})$/.test($(this).val())) {
            $('p.aD').html("");
        } else {
            $('p.aD').html('<i class="fa-sharp fa-solid fa-triangle-exclamation me-2"></i>Address must contains ony letter, space and -');
        }
    })

    $('#editDoc').submit(function (e) {
        e.preventDefault();
        var formData = new FormData($('form#editDoc')[0]);

        Swal.fire({
            icon: 'question',
            title: 'Confirmation',
            text: 'Are you sure to update?',
            showCancelButton: true,
            confirmButtonText: 'Yes'
        }).then(result => {
            if (result.isConfirmed) {
                formData.append('type', 'edit');
                $.ajax({
                    url: '../../manageDoctor',
                    type: 'POST',
                    processData: false,
                    contentType: false,
                    data: formData
                }).done(function (data) {
                    if (data.trim() == 'ok') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Edit Doctor',
                            text: 'Update Doctor successful',
                            timer: 1000,
                            timerProgressBar: true
                        });
                        setTimeout(function () {
                            $('#form-editDoc').modal('hide');
                            loadData("doctors");
                            $('.modal-backdrop').remove();
                        }, 1000);
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Fail edit Doctor',
                            text: 'Please check sever side!'
                        })
                    }
                })
            }
        })
    })
}


//Function Delete Doctor
function deleteDoctor() {
    $(document).on('click', 'a.deleteDoc', function (e) {
        e.preventDefault();

        Swal.fire({
            icon: 'warning',
            title: 'Delete doctor',
            text: 'Are you sure to delete this doctor',
            showCancelButton: true,
            confirmButtonText: 'Yes'
        }).then(result => {
            if (result.isConfirmed) {
                $.post($(this).attr('href'), function (data) {
                    console.log(data)
                    if (data.trim() == "ok") {
                        Swal.fire({
                            icon: 'success',
                            title: 'Delete successful',
                            text: 'Delete doctor successfully!',
                            timer: 1000,
                            timerProgressBar: true
                        });
                        setTimeout(function () {
                            loadData("doctors");
                            loadData("accounts");
                        }, 1000);
                    }
                })
            }
        })
    })
}

//Function Delete Patient
function deletePatient() {
    $(document).on('click', 'a.deletePat', function (e) {
        e.preventDefault();

        Swal.fire({
            icon: 'warning',
            title: 'Delete patient',
            text: 'Are you sure to delete this patient',
            showCancelButton: true,
            confirmButtonText: 'Yes'
        }).then(result => {
            if (result.isConfirmed) {
                $.post($(this).attr('href'), function (data) {
                    console.log(data)
                    if (data.trim() == "ok") {
                        Swal.fire({
                            icon: 'success',
                            title: 'Delete successful',
                            text: 'Delete patient successfully!',
                            timer: 1000,
                            timerProgressBar: true
                        });
                        setTimeout(function () {
                            loadData("patients");
                            loadData("accounts");
                        }, 1000);
                    }
                })
            }
        })
    })
}

$('#form-editDoc').on('hidden.bs.modal', function () {
    $('#editDoc')[0].reset();
});
$('#form-createDoc').on('hidden.bs.modal', function () {
    $('#createDoc')[0].reset();
})
$('#form-createBlog').on('hidden.bs.modal', function () {
    $('#createBlog')[0].reset();
})
$('#form-editBlog').on('hidden.bs.modal', function () {
    $('#editBlog')[0].reset();
})


// Function create blog
function createBlog() {
    // $("#createBlog").on('shown', function () {
    //     $('.modal-backdrop').show();
    // });

    $('input#titleLabel').blur(function () {
        var value = $(this).val();
        if (/^(?=[a-zA-Z]+)[a-zA-Z0-9\s]{3,30}$/.test(value)) {
            $('p.tB').html("");
        } else {
            $('p.tB').html('<i class="fa-sharp fa-solid fa-triangle-exclamation me-2"></i>Title must is a capitalize word');
        }
    });

    $('#createBlog').submit(function (e) {
        e.preventDefault();
        var formData = new FormData($('form#createBlog')[0]);

        Swal.fire({
            icon: 'question',
            title: 'Confirmation',
            text: 'Are you sure to create this blog?',
            showCancelButton: true,
            confirmButtonText: 'Yes'
        }).then(result => {
            if (result.isConfirmed) {
                formData.append('type', 'create');
                $.ajax({
                    url: '../../manageBlog',
                    type: 'POST',
                    processData: false,
                    contentType: false,
                    data: formData
                }).done(function (data) {
                    if (data.trim() == 'ok') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Create Blog',
                            text: 'Create Blog successful',
                            timer: 1000,
                            timerProgressBar: true
                        });
                        setTimeout(function () {
                            loadData("blogs");
                            $('#createBlog')[0].reset();
                            $('#form-createBlog').modal('hide');
                            $('.modal-backdrop').remove();
                        }, 1000);
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Title already existed',
                            text: 'Please try another title!'
                        })
                    }
                    ;
                });
            }
            ;
        });
    })
}

// Preview image before upload


// Function edit blog
function editBlog() {
    /*
     Validate data here
     */
    $('.modal-backdrop').remove();

    $('#editBlog').submit(function (e) {
        e.preventDefault();
        
        var formData = new FormData($('form#editBlog')[0]);

        Swal.fire({
            icon: 'question',
            title: 'Confirmation',
            text: 'Are you sure to update?',
            showCancelButton: true,
            confirmButtonText: 'Yes'
        }).then(result => {
            if (result.isConfirmed) {
                formData.append('type', 'edit');
                $.ajax({
                    url: '../../manageBlog',
                    type: 'POST',
                    processData: false,
                    contentType: false,
                    data: formData
                }).done(function (data) {
                    if (data.trim() == 'ok') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Update blog',
                            text: 'Update blog successful',
                            timer: 1000,
                            timerProgressBar: true
                        });
                        setTimeout(function () {
                            $('#form-editBlog').modal('hide');
                            loadData("blogs");
                            $('.modal-backdrop').remove();
                        }, 1000);
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Fail to update blog',
                            text: 'Please check sever side!'
                        })
                    }
                })
            }
        })
    })
}

//Function delete blog
function deleteBlog() {
    $(document).on('click', 'a.deleteBlog', function (e) {
        e.preventDefault();

        Swal.fire({
            icon: 'warning',
            title: 'Delete blog',
            text: 'Are you sure to delete this blog',
            showCancelButton: true,
            confirmButtonText: 'Yes'
        }).then(result => {
            if (result.isConfirmed) {
                $.post($(this).attr('href'), function (data) {
                    if (data.trim() == "ok") {
                        Swal.fire({
                            icon: 'success',
                            title: 'Delete successful',
                            text: 'Delete blog successfully!',
                            timer: 1000,
                            timerProgressBar: true
                        });
                        setTimeout(function () {
                            loadData("blogs");
                        }, 1000);
                    }
                })
            }
        })
    })
}

$(".modal").on("shown.bs.modal", function () {
    if ($(".modal-backdrop").length > 1) {
        $(".modal-backdrop").not(':first').remove();
    }
})

function manageDoctor() {
    createDoctor();
    fillForm();
    editDoctor();
    deleteDoctor();
}

function managePatient() {
    fillForm();
    deletePatient();
}

function manageBlog() {
    //Preview img before upload
    $('#thumbnailsLabel').change(function(){
        const file = this.files[0];
        
        if (file) {
            let reader = new FileReader();
            reader.onload = function(event) {
                $('#thumbnailsPreview').attr('src', event.target.result);
                $('#thumbnailsPreview').css({"width" : "88%", "height" : "50%"});
                $('#thumbnailsPreview').show();
            }
            reader.readAsDataURL(file);
        }    
    });

    $('#thumbBlogLabel').change(function(){
        const file = this.files[0];
        
        if (file) {
            let reader = new FileReader();
            reader.onload = function(event) {
                $('#thumbPreview').attr('src', event.target.result);
                $('#thumbPreview').css({"width" : "88%", "height" : "50%"});
                $('#thumbPreview').show();
            }
            reader.readAsDataURL(file);
        }    
    });

    createBlog();
    fillForm();
    editBlog();
    deleteBlog();
}


