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
            var aView = $('<a class="viewAppointment" data-bs-toggle="modal" data-bs-target="#form-viewAppointment" href=""><i class="fa-solid fa-eye text-primary me-3"></i></a>');

            $('#appointments > tbody').empty();

            $.each(data, function (i, val) {
                const row = $('<tr>').append($('<th scope="row">').text(i + 1))
                        .append($('<td>').text(val.bookedDate))
                        .append($('<td>').text('Slot ' + val.slotID))
                        .append($('<td>').text(val.patientName))
                        .append($('<td class="action">'));

                    row.find('td.action')
                        .append(aView.clone().attr({'href': '../../loadData?appointmentID=' + val.appointmentID}));

                $('#appointments > tbody').append(row);
            });
        } else if (type == "examinations") {
            var aEdit = $('<a class="editExamination" data-bs-toggle="modal" data-bs-target="#form-editExamination" href=""><i class="fa-solid fa-pen text-dark me-3"></i></a>');

            $('#examinations > tbody').empty();

            $.each(data, function (i, val) {
                const row = $('<tr>').append($('<th scope="row">').text(i + 1))
                        .append($('<td>').text(val.patientName))
                        .append($('<td>').text(val.serviceName))
                        .append($('<td>').text(val.createdDate))
                        .append($('<td>').html((val.status == 1 ? 'Paid<i class="fa-solid fa-circle-check text-success ms-2"></i>' : 'Not paid<i class="fa-solid fa-circle-pause text-danger ms-2"></i>')))
                        .append($('<td class="action">'));

                    row.find('td.action')
                        .append(aEdit.clone().attr({'href': '../../loadData?examinationID=' + val.examinationID}));

                $('#examinations > tbody').append(row);
            });
        } else if (type == "patients") {
            $.post('../../loadData?type=' + type, function (data) {
                $('#patients').empty();
                $('#patientsP').empty();

                $.each(data, function (i, val) {
                    $('#patients').append($('<option value="' + (val.accountID) + '">').text(val.name))
                    $('#patientsP').append($('<option value="' + (val.accountID) + '">').text(val.name))
                })
            })
        } else if (type == "services") {
            $.post('../../loadData?type=' + type, function (data) {
                $('#services').empty();

                $.each(data, function (i, val) {
                    $('#services').append($('<option value="' + (val.serviceID) + '">').text(val.name))
                })
            })
        } else if (type == "prescriptions") {
            var aEdit = $('<a class="editPrescription" data-bs-toggle="modal" data-bs-target="#form-editPrescription" href=""><i class="fa-solid fa-pen text-dark me-3"></i></a>');

            $('#prescriptions > tbody').empty();

            $.each(data, function (i, val) {
                const row = $('<tr>').append($('<th scope="row">').text(i + 1))
                        .append($('<td>').text(val.patientName))
                        .append($('<td>').text(val.medicineName))
                        .append($('<td>').text(val.createdDate))
                        .append($('<td class="action">'));

                    row.find('td.action')
                        .append(aEdit.clone().attr({'href': '../../loadData?prescriptionID=' + val.prescriptionID}));

                $('#prescriptions > tbody').append(row);
            });
        } else if (type == "medicines") {
            $.post('../../loadData?type=' + type, function (data) {
                $('#medicines').empty();

                $.each(data, function (i, val) {
                    $('#medicines').append($('<option value="' + (val.medicineID) + '">').text(val.name))
                })
            })
        }
    });
}

function fillForm() {
    $(document).on('click', 'a.viewAppointment', function (e) {
        e.preventDefault();

        $.post($(this).attr('href'), function (data) {
            $('#viewAppointment input#bookedDate').attr('value', data.bookedDate);
            $('#viewAppointment input#slot').attr('value', 'Slot ' + data.slotID);
            $('#viewAppointment input#symptonLabel').attr('value', data.sympton);
            $('#viewAppointment textarea#messageLabel').val(data.message != null ? data.message : '');
        });
    });

    $(document).on('click', 'a.editExamination', function (e) {
        e.preventDefault();

        $.post($(this).attr('href'), function (data) {
            $('#editExamination input#examinationID').attr('value', data.examinationID);
            $('#editExamination input#result').attr('value', data.result);
            $('#editExamination input[name="status"][value="' + data.status + '"]').prop('checked', true);
        });
    });
    
    $(document).on('click', 'a.editPrescription', function (e) {
        e.preventDefault();

        $.post($(this).attr('href'), function (data) {
            $('#editPrescription input#prescriptionID').attr('value', data.prescriptionID);
            $('#editPrescription input#instructionLabel').attr('value', data.instruction);
        });
    });
}

$('#form-viewAppointment').on('hidden.bs.modal', function () {
    $('#viewAppointment')[0].reset();
})

$(".modal").on("shown.bs.modal", function () {
    if ($(".modal-backdrop").length > 1) {
        $(".modal-backdrop").not(':first').remove();
    }
})


function manageAppointment() {
    fillForm();
}

//Function create examination
function createExamination() {
    $('#createExamination').submit(function (e) {
        e.preventDefault();

        Swal.fire({
            icon: 'question',
            title: 'Confirmation',
            text: 'Are you sure to create this examination?',
            showCancelButton: true,
            confirmButtonText: 'Yes'
        }).then(result => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '../../manageExamination?type=create',
                    type: 'POST',
                    data: $('#createExamination').serialize()
                }).done(function (data) {
                    if (data.trim() == 'ok') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Create examination',
                            text: 'Create examination successful',
                            timer: 1000,
                            timerProgressBar: true
                        });
                        setTimeout(function () {
                            loadData("examinations");
                            $('#createExamination')[0].reset();
                            $('#form-createExamination').modal('hide');
                            $('.modal-backdrop').remove();
                        }, 1000);
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Name already existed',
                            text: 'Please try another name!'
                        })
                    }
                });
            }
        });
    })
}

//Function edit examination
function editExamination() {
    $('#editExamination').submit(function (e) {
        e.preventDefault();

        Swal.fire({
            icon: 'question',
            title: 'Confirmation',
            text: 'Are you sure to update this Examination?',
            showCancelButton: true,
            confirmButtonText: 'Yes'
        }).then(result => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '../../manageExamination?type=edit',
                    type: 'POST',
                    data: $('#editExamination').serialize()
                }).done(function (data) {
                    if (data.trim() == 'ok') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Update Examination',
                            text: 'Update Examination successful',
                            timer: 1000,
                            timerProgressBar: true
                        });
                        setTimeout(function () {
                            loadData("examinations");
                            $('#editExamination')[0].reset();
                            $('#form-editExamination').modal('hide');
                            $('.modal-backdrop').remove();
                        }, 1000);
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Name already existed',
                            text: 'Please try another name!'
                        })
                    }
                });
            }
        });
    })
}


function manageExamination() {
    createExamination();
    fillForm();
    editExamination();
}

//Function create prescription
function createPrescription() {
    $('#createPrescription').submit(function (e) {
        e.preventDefault();

        Swal.fire({
            icon: 'question',
            title: 'Confirmation',
            text: 'Are you sure to create this prescription?',
            showCancelButton: true,
            confirmButtonText: 'Yes'
        }).then(result => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '../../managePrescription?type=create',
                    type: 'POST',
                    data: $('#createPrescription').serialize()
                }).done(function (data) {
                    if (data.trim() == 'ok') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Create prescription',
                            text: 'Create prescription successful',
                            timer: 1000,
                            timerProgressBar: true
                        });
                        setTimeout(function () {
                            loadData("prescriptions");
                            $('#createPrescription')[0].reset();
                            $('#form-createPrescription').modal('hide');
                            $('.modal-backdrop').remove();
                        }, 1000);
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Name already existed',
                            text: 'Please try another name!'
                        })
                    }
                });
            }
        });
    })
}

//Function edit examination
function editPrescription() {
    $('#editPrescription').submit(function (e) {
        e.preventDefault();

        Swal.fire({
            icon: 'question',
            title: 'Confirmation',
            text: 'Are you sure to update this prescription?',
            showCancelButton: true,
            confirmButtonText: 'Yes'
        }).then(result => {
            if (result.isConfirmed) {
                $.ajax({
                    url: '../../managePrescription?type=edit',
                    type: 'POST',
                    data: $('#editPrescription').serialize()
                }).done(function (data) {
                    if (data.trim() == 'ok') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Update prescription',
                            text: 'Update prescription successful',
                            timer: 1000,
                            timerProgressBar: true
                        });
                        setTimeout(function () {
                            loadData("prescriptions");
                            $('#editPrescription')[0].reset();
                            $('#form-editPrescription').modal('hide');
                            $('.modal-backdrop').remove();
                        }, 1000);
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Name already existed',
                            text: 'Please try another name!'
                        })
                    }
                });
            }
        });
    })
}

function managePrescription() {
    createPrescription();
    fillForm();
    editPrescription();
}
