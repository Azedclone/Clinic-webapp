<section id="appointment">
    <div class="title">Manage appointment</div>
    <div class="container-fluid">
        <div class="container list">
            <form action="#" method="" class="float-start">
                Search: <input type="text" name="name">
                <input type="submit" value="Search" class="btn btn-primary border-0">
            </form>
            <table class="table table-striped text-center" id="appointments">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Booked Date</th>
                        <th scope="col">Slot</th>
                        <th scope="col">Patient</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</section>

<!-- Start Form view appointment -->
<div class="modal fade" id="form-viewAppointment" tabindex="-1" aria-labelledby="formEditLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-3 text-uppercase fw-bold" id="formEditLabel">Edit Appointment</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="viewAppointment">
                    <div class="mb-3">
                        <label for="bookedDate" class="form-label">Booked Date</label>
                        <input type="date" class="form-control" id="bookedDate" value="" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="slot" class="form-label">Slot</label>
                        <input type="text" class="form-control" id="slot" value="" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="symptonLabel" class="form-label">Sympton</label>
                        <input type="text" class="form-control" id="symptonLabel" value="" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="messageLabel" class="form-label">Message</label>
                        <textarea rows="6" class="form-control" id="messageLabel" value="" readonly>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- End Form edit appointment -->