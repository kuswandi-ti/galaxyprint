<!--=========================*
           Main Section
   *===========================-->
    <div class="vz_main_container">
        <div class="vz_main_content">
            <div class="row">
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card_title">Tambah User</h4>
                            <form id="addUser" class="needs-validation" novalidate="">
                                <div class="form-row">
                                    <div class="col-md-12 mb-3">
                                        <label for="validationCustom01">Nama Lengkap</label>
                                        <input type="text" class="form-control" id="validationCustom01" name="fullname" placeholder="First name" value="" required="required">
                                        <div class="invalid-feedback">
                                            Nama Lengkap Harus Diisi.
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <label for="validationCustom02">Email</label>
                                        <input type="text" class="form-control" id="validationCustom02" name="email" placeholder="Last name" value="" required="required">
                                        <div class="invalid-feedback">
                                            Email Harus Diisi
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <label for="validationCustomUsername">Username</label>
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text" id="inputGroupPrepend">@</span>
                                            </div>
                                            <input type="text" class="form-control" id="validationCustomUsername" name="username" placeholder="Username" aria-describedby="inputGroupPrepend" required="">
                                            <div class="invalid-feedback">
                                                Username Harus Diisi.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-md-12 mb-3">
                                        <label for="validationCustom03">Hak Akses</label>
                                        <input type="text" class="form-control" id="validationCustom03" name="role_id" placeholder="City" required="">
                                        <div class="invalid-feedback">
                                            Please provide a valid city.
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <label for="validationCustom04">Password</label>
                                        <input type="text" class="form-control" id="validationCustom04" name="password" placeholder="State" required="">
                                        <div class="invalid-feedback">
                                           Password Harus Diisi.
                                        </div>
                                    </div>
                                </div>
                                <button class="btn btn-primary" type="submit"><i class="fa fa-plus"></i> Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="header-title">Data Table Primary</h4>
                            <div class="table-responsive datatable-primary" id="table">
                                <table id="tableUser" class="text-center">
                                    <thead class="text-capitalize">
                                    <tr>
                                        <th>Name</th>
                                        <th>Position</th>
                                        <th>Office</th>
                                        <th>Age</th>
                                    </tr>
                                    </thead>
                                    <tbody id="show_data">
                                      
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--=========================*
            End Main Section
   *===========================-->