<section id="blog">
    <div class="title">Manage Blog</div>
    <div class="container-fluid">
        <div class="container list">
            <form action="#" method="" class="float-start">
                Search: <input type="text" name="name">
                <input type="submit" value="Search" class="btn btn-primary border-0">
            </form>
            <button type="button" id="create" class="btn btn-primary float-end" data-bs-toggle="modal" data-bs-target="#form-createBlog">
                <i class="fa-solid fa-plus me-3"></i>Create Blog
            </button>
            <table class="table table-striped text-center" id="blogs">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Title</th>
                        <th scope="col">Category</th>
                        <th scope="col">Author</th>
                        <th scope="col">Created Date</th>
                        <th scope="col">Status</th>
                        <th scope="col">Published Date</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</section>

<!-- Start Form Create blog -->
<div class="modal fade" id="form-createBlog" tabindex="-1" aria-labelledby="formCreateLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-3 text-uppercase fw-bold" id="formCreateLabel">Create Blog</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="createBlog" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="titleLabel" class="form-label">Title</label>
                        <input type="text" class="form-control" id="titleLabel" name="title">
                        <p class="tB text-danger"></p>
                    </div>
                    <div class="mb-3">
                        <label for="categoryLabel" class="form-label">Category</label>
                        <select class="form-select" id="categoryLabel" name="categoryID">
                            <!-- Must load all categories here -->
                          </select>
                    </div>
                    <div class="mb-3">
                        <label for="thumbnailsLabel" class="form-label">Thumbnails</label>
                        <input accept="image/jpeg" type="file" class="form-control mb-3" id="thumbnailsLabel" name="thumbnails">
                        <div class="text-center">
                            <img src="../../assets/img/blogs/default_thumbnails.jpg" alt="thumbnails" id="thumbnailsPreview" style="width: 88%; height: 50%;">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="contentLabel" class="form-label">Content</label>
                        <textarea type="text" rows="6" class="form-control" id="contentLabel" aria-describedby="contentHelp" name="content"></textarea>
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
<!-- End Form Create blog -->

<!-- Start form edit blog -->
<div class="modal fade" id="form-editBlog" tabindex="-1" aria-labelledby="formEditLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-3 text-uppercase fw-bold" id="formViewLabel">Edit Blog</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editBlog" enctype="multipart/form-data">
                    <div class="mb-3" hidden>
                        <label for="blogIDLabel" class="form-label">ID</label>
                        <input type="text" class="form-control" id="blogIDLabel" value="" name="blogID">
                    </div>
                    <div class="mb-3">
                        <label for="titleBlogLabel" class="form-label">Title</label>
                        <input type="text" class="form-control" id="titleBlogLabel" value="" name="title">
                        <p class="tB text-danger"></p>
                    </div>
                    <div class="mb-3">
                        <label for="categoryBlogLabel" class="form-label">Category</label>
                        <select class="form-select" id="categoryBlogLabel" name="categoryID">
                            <!-- Must load all categories here -->
                          </select>
                    </div>
                    <div class="mb-3">
                        <label for="thumbBlogLabel" class="form-label">Thumbnails</label>
                        <input accept="image/jpeg" type="file" class="form-control mb-3" id="thumbBlogLabel" name="thumbnails">
                        <div class="text-center">
                            <img src="#" alt="thumbnails" id="thumbPreview" style="width: 88%; height: 50%;">
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="contentBlogLabel" class="form-label">Content</label>
                        <!-- <input type="text" rows="6" class="form-control" id="contentBlogLabel" value="" name="content"></input> -->
                        <textarea rows="6" class="form-control" id="contentBlogLabel" name="content"></textarea>
                    </div>
                    <div>
                        <label for="statusLabel" class="me-3">Status:</label>
                        <div class="form-check form-check-inline mb-3 me-2" id="statusLabel">
                            <input class="form-check-input" type="radio" name="status" id="pending" value="0">
                            <label class="form-check-label" for="pending">
                                Pending
                            </label>
                        </div>
                        <div class="form-check form-check-inline mb-3 me-2">
                            <input class="form-check-input" type="radio" name="status" id="active" value="1">
                            <label class="form-check-label" for="active">
                                Active
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
<!-- End form edit blog -->
