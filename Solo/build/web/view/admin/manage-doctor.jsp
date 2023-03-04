<section id="doctor">
    <div class="title">Manage Doctor</div>
    <div class="container-fluid">
        <div class="container list">
            <form action="#" method="" class="float-start">
                Search: <input type="text" name="name">
                <input type="submit" value="Search" class="btn btn-primary border-0">
            </form>
            <button type="button" class="btn btn-primary float-end" data-bs-toggle="modal" data-bs-target="#form-createDoc">
                <i class="fa-solid fa-user-plus me-3"></i>Create Doctor
            </button>

            <table class="table table-striped text-center" id="doctors">
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
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</section>

<!-- Start Form create Doctor -->
<div class="modal fade" id="form-createDoc" tabindex="-1" aria-labelledby="formCreateLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-3 text-uppercase fw-bold" id="formCreateLabel">Create Doctor</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="createDoc">
                    <div class="mb-3">
                        <label for="usernameLabel" class="form-label">Username</label>
                        <input type="text" class="form-control" id="usernameLabel" aria-describedby="usernameHelp" name="username" required>
                        <div id="usernameHelp" class="form-text">User name must not be duplicate.</div>
                    </div>
                    <div class="mb-3">
                        <label for="passwordLabel" class="form-label">Password</label>
                        <input type="password" class="form-control" id="passwordLabel"  aria-describedby="passwordHelp" name="password" required>
                        <div id="passwordHelp" class="form-text">Password should contains at least 8 character.</div>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- End Form create Doctor -->

<!-- Start Form edit Doctor -->
<div class="modal fade" id="form-editDoc" tabindex="-1" aria-labelledby="formCreateLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-3 text-uppercase fw-bold" id="formCreateLabel">Edit Doctor</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editDoc" enctype="multipart/form-data">
                    <div class="mb-3" hidden>
                        <label for="usernameDocLabel" class="form-label">Username</label>
                        <input type="text" class="form-control" id="usernameDocLabel" value="" name="username" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="nameDocLabel" class="form-label">Name</label>
                        <input type="text" class="form-control" id="nameDocLabel" value="" name="name">
                        <p class="nD text-danger"></p>
                    </div>
                    <div class="mb-3" hidden>
                        <label for="avatarDocLabel" class="form-label">Avatar</label>
                        <input accept="image/*" type="file" class="form-control" id="avatarDocLabel" name="avatar">
                    </div>
                    <div class="mb-3">
                        <label for="emailDocLabel" class="form-label">Email</label>
                        <input type="email" class="form-control" id="emailDocLabel" value="" name="email">
                        <p class="eD text-danger"></p>
                    </div>
                    <div class="mb-3">
                        <label for="phoneDocLabel" class="form-label">Phone</label>
                        <input type="tel" class="form-control" id="phoneDocLabel" value="" name="phone">
                        <p class="pD text-danger"></p>
                    </div>
                    <label for="genderDocLabel" class="me-3">Gender:</label>
                    <div class="form-check form-check-inline mb-3 me-2" id="genderDocLabel">
                        <input class="form-check-input" type="radio" name="gender" id="maleDoc" value="0" checked>
                        <label class="form-check-label" for="maleDoc">
                            Male
                        </label>
                    </div>
                    <div class="form-check form-check-inline mb-3 me-2">
                        <input class="form-check-input" type="radio" name="gender" id="femaleDoc" value="1">
                        <label class="form-check-label" for="femaleDoc">
                            Female
                        </label>
                    </div>
                    <div class="form-check form-check-inline mb-3">
                        <input class="form-check-input" type="radio" name="gender" id="otherDoc" value="2">
                        <label class="form-check-label" for="otherDoc">
                            Other
                        </label>
                    </div>
                    <div class="mb-3">
                        <label for="addressDocLabel" class="form-label">Address</label>
                        <input type="text" class="form-control" id="addressDocLabel" value="" name="address">
                        <p class="aD text-danger"></p>
                    </div>
                    <div class="mb-3">
                        <label for="dobDocLabel" class="form-label">DOB</label>
                        <input type="date" class="form-control" id="dobDocLabel" value="" name="dob">
                        <p class="dD text-danger"></p>
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
<!-- End Form edit Doctor -->
