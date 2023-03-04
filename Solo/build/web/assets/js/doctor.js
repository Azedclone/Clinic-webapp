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
    viewAppointment();
    fillForm();
}