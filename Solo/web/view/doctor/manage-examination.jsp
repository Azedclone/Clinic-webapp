<section id="examination">
    <div class="title">Manage examination</div>
    <div class="container-fluid">
        <div class="container list">
            <form action="#" method="" class="float-start">
                Search: <input type="text" name="name">
                <input type="submit" value="Search" class="btn btn-primary border-0">
            </form>
            <button type="button" class="btn btn-primary float-end" data-bs-toggle="modal" data-bs-target="#form-createExamination">
                <i class="fa-solid fa-user-plus me-3"></i>Create Examination
            </button>
            <table class="table table-striped text-center" id="examinations">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Patient</th>
                        <th scope="col">Service</th>
                        <th scope="col">Created Date</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</section>


<!-- Start Form create examination -->
<div class="modal fade" id="form-createExamination" tabindex="-1" aria-labelledby="formCreateLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-3 text-uppercase fw-bold" id="formCreateLabel">Create Examination</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="createExamination">
                    <div class="mb-3">
                        <label for="patients" class="form-label">Select Patient</label>
                        <select class="form-select" id="patients" name="patientID">
                            <!-- Must load all patient here -->
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="services" class="form-label">Select Service</label>
                        <select class="form-select" id="services" name="serviceID">
                            <!-- Must load all service here -->
                        </select>
                    </div>
                    <div>
                        <label for="status" class="me-3">Status:</label>
                        <div class="form-check form-check-inline mb-3 me-2" id="status">
                            <input class="form-check-input" type="radio" name="status" id="notpaid" value="0">
                            <label class="form-check-label" for="notpaid">
                                Not paid
                            </label>
                        </div>
                        <div class="form-check form-check-inline mb-3 me-2">
                            <input class="form-check-input" type="radio" name="status" id="paid" value="1">
                            <label class="form-check-label" for="paid">
                                Paid
                            </label>
                        </div>
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

<!-- Start form edit examination -->
<div class="modal fade" id="form-editExamination" tabindex="-1" aria-labelledby="formEditLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-3 text-uppercase fw-bold" id="formViewLabel">Edit Examination</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editExamination">
                    <div class="mb-3" hidden>
                        <label for="examinationID" class="form-label">Doctor ID</label>
                        <input type="text" class="form-control" id="examinationID" value="" name="examinationID">
                    </div>
                    <div class="mb-3">
                        <label for="result" class="form-label">Result</label>
                        <input type="text" class="form-control" id="result" name="result">
                        <p class="rE text-danger"></p>
                    </div>
                    <div>
                        <label for="status" class="me-3">Status:</label>
                        <div class="form-check form-check-inline mb-3 me-2" id="status">
                            <input class="form-check-input" type="radio" name="status" id="notpaidStatus" value="0">
                            <label class="form-check-label" for="notpaidStatus">
                                Not paid
                            </label>
                        </div>
                        <div class="form-check form-check-inline mb-3 me-2">
                            <input class="form-check-input" type="radio" name="status" id="paidStatus" value="1">
                            <label class="form-check-label" for="paidStatus">
                                Paid
                            </label>
                        </div>
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
<!-- End form edit examination-->
