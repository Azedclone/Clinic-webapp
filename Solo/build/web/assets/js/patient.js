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
$('#appointment').show();

$('#sidebar li>a').click(function () {
    var href = $(this).attr('href').replace('#', '');

    $('section:not([id*=' + href + '])').hide();
    $('#' + href).show('fast', 'swing');
    $('#sidebar').show({});
});

// Load data by type of it
function loadData(type) {
    $.post('../../loadData?type=' + type, function (data) {
        if (type == "appointments") {
            var aEdit = $('<a class="editAppointment" data-bs-toggle="modal" data-bs-target="#form-editAppointment" href=""><i class="fa-solid fa-pen text-dark me-3"></i></a>');

            $('#appointments > tbody').empty();

            $.each(data, function (i, val) {
                const row = $('<tr>').append($('<th scope="row">').text(i + 1))
                        .append($('<td>').text(val.bookedDate))
                        .append($('<td>').text('Slot ' + val.slotID))
                        .append($('<td>').text(val.doctorName))
                        .append($('<td class="action">'));

                    row.find('td.action')
                        .append(aEdit.clone().attr({'href': '../../loadData?appointmentID=' + val.appointmentID}));

                $('#appointments > tbody').append(row);
            });
        } else if (type == "doctors") {
            $.post('../../loadData?type=' + type, function (data) {
                $('#doctors').empty();

                $.each(data, function (i, val) {
                    $('#doctors').append($('<option value="' + (val.accountID) + '">').text(val.name))
                })
            })
        }
    });
}

function fillForm() {
    $(document).on('click', 'a.editAppointment', function (e) {
        e.preventDefault();

        $.post($(this).attr('href'), function (data) {
            $('#editAppointment input#appointmentIDLabel').attr({'value': data.appointmentID});
            $('#editAppointment input#symptonLabel').attr('value', data.sympton);
            $('#editAppointment input#messageLabel').attr({'value': (data.message != null ? data.message : '')});
        });
    });
}

$('#form-createAppointment').on('hidden.bs.modal', function () {
    $('#createAppointment')[0].reset();
})
$('#form-editAppointment').on('hidden.bs.modal', function () {
    $('#editAppointment')[0].reset();
})

$(".modal").on("shown.bs.modal", function () {
    if ($(".modal-backdrop").length > 1) {
        $(".modal-backdrop").not(':first').remove();
    }
})

function showAvailableSlots() {
    //Show slots available when date change
    $('#bookDate').change(function() {
        // console.log($('#doctors :selected').val());
        $.ajax({
            url: '../../loadData?type=slots',
            type: 'POST',
            data: {'bookedDate':$(this).val(), 'doctorID':$('#doctors :selected').val()}
        }).done(function(data){
            $.each(data, function(i, val){
                $('#slots option[value="' + val + '"]').hide();
            })
        });
    });
}

function createAppointment() {
    showAvailableSlots();
    $('#createAppointment').submit(function(e){
        e.preventDefault();

        Swal.fire({
            icon: 'question',
            title: 'Confirmation',
            text: 'Are you sure to create appointment?',
            showCancelButton: true,
            confirmButtonText: 'Yes'
        }).then(result => {
            if(result.isConfirmed) {
                $.ajax({
                    url: '../../manageAppointment?type=create',
                    type: 'POST',
                    data: $('#createAppointment').serialize()
                }).done(function (data) {
                    if (data.trim() == 'ok') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Create Appointment',
                            text: 'Create Appointment successful',
                            timer: 1000,
                            timerProgressBar: true
                        });
                        setTimeout(function () {
                            loadData("appointments");
                            $('#createAppointment')[0].reset();
                            $('#form-createAppointment').modal('hide');
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
        })
    })
}

function editAppointment() {
    $('#editAppointment').submit(function(e){
        e.preventDefault();

        Swal.fire({
            icon: 'question',
            title: 'Confirmation',
            text: 'Are you sure to update appointment?',
            showCancelButton: true,
            confirmButtonText: 'Yes'
        }).then(result => {
            if(result.isConfirmed) {
                $.ajax({
                    url: '../../manageAppointment?type=edit',
                    type: 'POST',
                    data: $('#editAppointment').serialize()
                }).done(function (data) {
                    if (data.trim() == 'ok') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Update Appointment',
                            text: 'Update Appointment successful',
                            timer: 1000,
                            timerProgressBar: true
                        });
                        setTimeout(function () {
                            loadData("appointments");
                            $('#editAppointment')[0].reset();
                            $('#form-editAppointment').modal('hide');
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
        })

    })
}

function manageAppointment() {
    createAppointment();
    editAppointment();
}