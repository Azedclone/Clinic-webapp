<section id="medicine">
    <div class="title">Manage Medicine</div>
    <div class="container-fluid">
        <div class="container list">
            <form action="#" method="" class="float-start">
                Search: <input type="text" name="name">
                <input type="submit" value="Search" class="btn btn-primary border-0">
            </form>
            <button type="button" id="create" class="btn btn-primary float-end" data-bs-toggle="modal" data-bs-target="#form-createMedicine">
                <i class="fa-solid fa-plus me-3"></i>Create Medicine
            </button>
            <table class="table table-striped text-center" id="medicines">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Brand</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</section>

<!-- Start Form create medicine -->
<div class="modal fade" id="form-createMedicine" tabindex="-1" aria-labelledby="formCreateLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-3 text-uppercase fw-bold" id="formCreateLabel">Create Medicine</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="createMedicine">
                    <div class="mb-3">
                        <label for="nameMedicine" class="form-label">Name</label>
                        <input type="text" class="form-control" id="nameMedicine" name="name">
                        <p class="nM text-danger"></p>
                    </div>
                    <div class="mb-3">
                        <label for="brandMedicine" class="form-label">Brand</label>
                        <input type="text" class="form-control" id="brandMedicine" name="brand">
                        <p class="bM text-danger"></p>
                    </div>
                    <div class="mb-3">
                        <label for="description" class="form-label">Description</label>
                        <input type="text" class="form-control" id="description" name="description">
                        <p class="nS text-danger"></p>
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

<!-- Start form edit blog -->
<div class="modal fade" id="form-editMedicine" tabindex="-1" aria-labelledby="formEditLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-3 text-uppercase fw-bold" id="formEditLabel">Edit Medicine</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editMedicine">
                    <div class="mb-3" hidden>
                        <label for="medicineID" class="form-label">ID</label>
                        <input type="text" class="form-control" id="medicineID" value="" name="medicineID">
                    </div>
                    <div class="mb-3">
                        <label for="nameMedicineLabel" class="form-label">Name</label>
                        <input type="text" class="form-control" id="nameMedicineLabel" name="name">
                        <p class="nM text-danger"></p>
                    </div>
                    <div class="mb-3">
                        <label for="brandMedicineLabel" class="form-label">Brand</label>
                        <input type="text" class="form-control" id="brandMedicineLabel" name="brand">
                        <p class="bM text-danger"></p>
                    </div>
                    <div class="mb-3">
                        <label for="descriptionLabel" class="form-label">Description</label>
                        <input type="text" class="form-control" id="descriptionLabel" name="description">
                        <p class="nS text-danger"></p>
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
<!-- End form edit blog -->
