<section id="appointment">
    <div class="title">Manage appointment</div>
    <div class="container-fluid">
        <div class="container list">
            <form action="#" method="" class="float-start">
                Search: <input type="text" name="name">
                <input type="submit" value="Search" class="btn btn-primary border-0">
            </form>
            <button type="button" class="btn btn-primary float-end" data-bs-toggle="modal" data-bs-target="#form-createAppointment">
                <i class="fa-solid fa-user-plus me-3"></i>Create Appointemnt
            </button>

            <table class="table table-striped text-center" id="appointments">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Booked Date</th>
                        <th scope="col">Slot</th>
                        <th scope="col">Doctor</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</section>

<!-- Start form create appointment -->
<div class="modal fade" id="form-createAppointment" tabindex="-1" aria-labelledby="formCreateLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-3 text-uppercase fw-bold" id="formCreateLabel">Create Appointment</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="createAppointment">
                    <!-- Select doctor -->
                    <!-- Select doctor by dropdown menu -->
                    <div class="mb-3">
                        <label for="doctors" class="form-label">Select Doctor</label>
                        <div class="d-flex justify-content-between">
                            <div class="doctor-img float-start w-50">
                                <img src="../../assets/img/doctors/doctor_1.jpg" alt="doctor-img" style="width: 80%;">
                            </div>
                            <div class="doctor-name w-50">
                                <select class="form-select" id="doctors" name="doctorID">
                                    <!-- Must load all doctor here -->
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Schedule</label>
                        <div class="d-flex justify-content-between">
                            <input type="date" class="form-control" id="bookDate" value="" name="bookedDate">
                            <select class="form-select" id="slots" name="slotID">
                                <option value="1">Slot 1</option>
                                <option value="2">Slot 2</option>
                                <option value="3">Slot 3</option>
                                <option value="4">Slot 4</option>
                                <option value="5">Slot 5</option>
                                <option value="6">Slot 6</option>
                            </select>
                            <p class="sA text-danger"></p>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="sympton" class="form-label">Sympton</label>
                        <input type="text" class="form-control" id="sympton" value="" name="sympton" required>
                        <p class="sA text-danger"></p>
                    </div>
                    <div class="mb-3">
                        <label for="message" class="form-label">Message</label>
                        <input type="text" class="form-control" id="message" value="" name="message">
                        <p class="mA text-danger"></p>
                    </div>
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- End form create appointment -->

<!-- Start Form edit appointment -->
<div class="modal fade" id="form-editAppointment" tabindex="-1" aria-labelledby="formEditLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-3 text-uppercase fw-bold" id="formEditLabel">Edit Appointment</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editAppointment">
                    <div class="mb-3" hidden>
                        <label for="appointmentIDLabel" class="form-label">Appointment ID</label>
                        <input type="text" class="form-control" id="appointmentIDLabel" value="" name="appointmentID" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="symptonLabel" class="form-label">Sympton</label>
                        <input type="text" class="form-control" id="symptonLabel" value="" name="sympton">
                        <p class="sA text-danger"></p>
                    </div>
                    <div class="mb-3">
                        <label for="messageLabel" class="form-label">Message</label>
                        <input type="text" class="form-control" id="messageLabel" value="" name="message">
                        <p class="mA text-danger"></p>
                    </div>
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- End Form edit appointment -->