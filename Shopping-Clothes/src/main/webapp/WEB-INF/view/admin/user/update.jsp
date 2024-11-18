<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <title>Update User - NiceAdmin Bootstrap Template</title>
                <link href="/css/bootstrap.min.css" rel="stylesheet">
                <link href="/css/boxicons.min.css" rel="stylesheet">
                <link href="/css/style.css" rel="stylesheet">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
            </head>

            <body>
                <jsp:include page="../layout/header.jsp" />
                <jsp:include page="../layout/sidebar.jsp" />

                <main id="main" class="main">
                    <div class="pagetitle">
                        <h1>Update User</h1>
                        <nav>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="breadcrumb-item"><a href="/admin/user">User Management</a></li>
                                <li class="breadcrumb-item active">Update User</li>
                            </ol>
                        </nav>
                    </div>

                    <section class="section">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-8 col-12 mx-auto">
                                            <h1>Update User Information</h1>
                                            <hr>

                                            <!-- Form Update User -->
                                            <form:form method="POST" action="/admin/user/update/${user.id}"
                                                enctype="multipart/form-data" modelAttribute="user" class="row">

                                                <!-- Email (read-only) -->
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Email address:</label>
                                                    <form:input type="email"
                                                        class="form-control ${not empty user.email ? '' : 'is-invalid'}"
                                                        path="email" readonly="true" />
                                                    <form:errors path="email" cssClass="invalid-feedback" />
                                                </div>

                                                <!-- Password -->
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Password:</label>
                                                    <!-- Hiển thị mật khẩu cũ dưới dạng dấu * -->
                                                    <form:input type="password"
                                                        class="form-control ${not empty user.password ? '' : 'is-invalid'}"
                                                        path="password" readonly="true"
                                                        value="${user.password != null ? '********' : ''}" />
                                                    <form:errors path="password" cssClass="invalid-feedback" />
                                                </div>

                                                <!-- Full Name -->
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Full Name:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty user.name ? '' : 'is-invalid'}"
                                                        path="name" />
                                                    <form:errors path="name" cssClass="invalid-feedback" />
                                                </div>

                                                <!-- Phone Number -->
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Phone Number:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty user.phone ? '' : 'is-invalid'}"
                                                        path="phone" />
                                                    <form:errors path="phone" cssClass="invalid-feedback" />
                                                </div>

                                                <!-- Address -->
                                                <div class="mb-3 col-12">
                                                    <label class="form-label">Address:</label>
                                                    <form:input type="text"
                                                        class="form-control ${not empty user.address ? '' : 'is-invalid'}"
                                                        path="address" />
                                                    <form:errors path="address" cssClass="invalid-feedback" />
                                                </div>

                                                <!-- Role -->
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Role:</label>
                                                    <form:select
                                                        class="form-select ${not empty user.role.name ? '' : 'is-invalid'}"
                                                        path="role.name">
                                                        <form:option value="ADMIN">ADMIN</form:option>
                                                        <form:option value="USER">USER</form:option>
                                                    </form:select>
                                                    <form:errors path="role.name" cssClass="invalid-feedback" />
                                                </div>

                                                <!-- Avatar -->
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label for="avatarFile" class="form-label">Avatar:</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg" name="avatarFile" />
                                                </div>

                                                <!-- Avatar Preview -->
                                                <div class="col-12 col-md-6">
                                                    <img id="avatarPreview" src="/images/avatar/${user.avatar}"
                                                        alt="Avatar Preview"
                                                        style="max-height: 150px; max-width: 150px; display: block;" />
                                                </div>

                                                <!-- Submit Button -->
                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-primary">Update</button>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                </main>

                <jsp:include page="../layout/footer.jsp" />

                <a href="#" class="back-to-top d-flex align-items-center justify-content-center">
                    <i class="bi bi-arrow-up-short"></i>
                </a>

                <script src="/js/bootstrap.bundle.min.js"></script>
                <script src="/js/main.js"></script>
            </body>

            </html>