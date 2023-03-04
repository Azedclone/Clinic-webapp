<section id="patient">
    <div class="title">Manage Patient</div>
    <div class="container-fluid">
        <div class="container list">
            <form action="#" method="" class="float-start">
                Search: <input type="text" name="name">
                <input type="submit" value="Search" class="btn btn-primary border-0">
            </form>
            <table class="table table-striped text-center" id="patients">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Username</th>
                        <th scope="col">Name</th>
                        <th scope="col">Mail</th>
                        <th scope="col">Phone</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody class="t-body">
                </tbody>
            </table>
        </div>
    </div>
</section>

<!-- Start modal view Patient -->
<div class="modal fade" id="form-viewPat" tabindex="-1" aria-labelledby="formCreateLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-3 text-uppercase fw-bold" id="formCreateLabel">View Patient</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="viewPat">
                    <div class="mb-3" hidden>
                        <label for="usernamePatLabel" class="form-label">Username</label>
                        <input type="text" class="form-control" id="usernamePatLabel" value="" name="username" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="namePatLabel" class="form-label">Name</label>
                        <input type="text" class="form-control" id="namePatLabel" value="" name="name" readonly>
                    </div>
                    <div class="mb-3" hidden>
                        <label for="avatarPatLabel" class="form-label">Avatar</label>
                        <input type="file" class="form-control" id="avatarPatLabel" name="avatar" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="emailPatLabel" class="form-label">Email</label>
                        <input type="email" class="form-control" id="emailPatLabel" value="" name="mail" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="phonePatLabel" class="form-label">Phone</label>
                        <input type="tel" class="form-control" id="phonePatLabel" value="" name="phone" readonly>
                    </div>
                    <label for="genderPatLabel" class="me-3">Gender:</label>
                    <div class="form-check form-check-inline mb-3 me-2" id="genderPatLabel">
                        <input class="form-check-input" type="radio" name="gender" id="malePat" value="0" readonly>
                        <label class="form-check-label" for="malePat">
                            Male
                        </label>
                    </div>
                    <div class="form-check form-check-inline mb-3 me-2">
                        <input class="form-check-input" type="radio" name="gender" id="femalePat" value="1" readonly>
                        <label class="form-check-label" for="femalePat">
                            Female
                        </label>
                    </div>
                    <div class="form-check form-check-inline mb-3">
                        <input class="form-check-input" type="radio" name="gender" id="otherPat" value="2" readonly>
                        <label class="form-check-label" for="otherPat">
                            Other
                        </label>
                    </div>
                    <div class="mb-3">
                        <label for="addressPatLabel" class="form-label">Address</label>
                        <input type="text" class="form-control" id="addressPatLabel" value="" name="address" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="dobPatLabel" class="form-label">DOB</label>
                        <input type="date" class="form-control" id="dobPatLabel" value="" name="dob" readonly>
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
<!-- End modal view Patient -->