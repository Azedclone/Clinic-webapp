<section id="prescription">
    <div class="title">Manage Prescription</div>
    <div class="container-fluid">
        <div class="container list">
            <form action="#" method="" class="float-start">
                Search: <input type="text" name="name">
                <input type="submit" value="Search" class="btn btn-primary border-0">
            </form>
            <button type="button" class="btn btn-primary float-end" data-bs-toggle="modal" data-bs-target="#form-createPrescription">
                <i class="fa-solid fa-user-plus me-3"></i>Create Prescription
            </button>
            <table class="table table-striped text-center" id="prescriptions">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Patient</th>
                        <th scope="col">Medicine</th>
                        <th scope="col">Created Date</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</section>


<!-- Start Form create Prescription -->
<div class="modal fade" id="form-createPrescription" tabindex="-1" aria-labelledby="formCreateLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-3 text-uppercase fw-bold" id="formCreateLabel">Create Prescription</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="createPrescription">
                    <div class="mb-3">
                        <label for="patients" class="form-label">Select Patient</label>
                        <select class="form-select" id="patientsP" name="patientID">
                            <!-- Must load all patient here -->
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="medicine" class="form-label">Select Medicine</label>
                        <select class="form-select" id="medicines" name="medicineID">
                            <!-- Must load all service here -->
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="instruction" class="form-label">Instruction</label>
                        <input type="text" class="form-control" id="instruction" value="" name="instruction">
                    </div>
                    <button type="submit" class="btn btn-primary">Create</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- End Form create service -->

<!-- Start form edit Prescription -->
<div class="modal fade" id="form-editPrescription" tabindex="-1" aria-labelledby="formEditLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-3 text-uppercase fw-bold" id="formEditLabel">Edit Prescription</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editPrescription">
                    <div class="mb-3" hidden>
                        <label for="prescriptionID" class="form-label">Prescription ID</label>
                        <input type="text" class="form-control" id="prescriptionID" value="" name="prescriptionID">
                    </div>
                    <div class="mb-3">
                        <label for="instructionLabel" class="form-label">Instruction</label>
                        <input type="text" class="form-control" id="instructionLabel" name="instruction">
                        <p class="iP text-danger"></p>
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
<!-- End form edit Prescription-->
