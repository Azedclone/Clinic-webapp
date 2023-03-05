<section id="examination">
    <div class="title">Manage examination</div>
    <div class="container-fluid">
        <div class="container list">
            <form action="#" method="" class="float-start">
                Search: <input type="text" name="name">
                <input type="submit" value="Search" class="btn btn-primary border-0">
            </form>
            <table class="table table-striped text-center" id="examinations">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Doctor</th>
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

<!-- Start form view examination -->
<div class="modal fade" id="form-viewExamination" tabindex="-1" aria-labelledby="formViewLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-3 text-uppercase fw-bold" id="formViewLabel">View Examination</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="viewExamination">
                    <div class="mb-3" hidden>
                        <label for="examinationID" class="form-label">Examination ID</label>
                        <input type="text" class="form-control" id="examinationID" value="" name="examinationID">
                    </div>
                    <div class="mb-3">
                        <label for="result" class="form-label">Result</label>
                        <input type="text" class="form-control" id="result" name="result" readonly>
                        <p class="rE text-danger"></p>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- End form edit examination-->
