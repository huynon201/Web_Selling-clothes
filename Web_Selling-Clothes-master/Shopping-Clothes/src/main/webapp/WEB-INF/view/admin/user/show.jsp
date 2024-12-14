<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <meta content="width=device-width, initial-scale=1.0" name="viewport">
            <title>Danh sách người dùng</title>
            <meta content="" name="description">
            <meta content="" name="keywords">

            <!-- Favicons -->
            <link href="assets/img/favicon.png" rel="icon">
            <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

            <!-- Google Fonts -->
            <link href="https://fonts.gstatic.com" rel="preconnect">
            <link
                href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
                rel="stylesheet">

            <!-- Vendor CSS Files -->
            <link href="/css/bootstrap.min.css" rel="stylesheet">
            <!-- Option 1: Include in HTML -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
            <link href="/css/boxicons.min.css" rel="stylesheet">
            <link href="/css/quill.snow.css" rel="stylesheet">
            <link href="/css/quill.bubble.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css">
            <link href="/css/style-data.css" rel="stylesheet">
            <!-- Template Main CSS File -->
            <link href="/css/style.css" rel="stylesheet">
        </head>

        <body>
            <jsp:include page="../layout/header.jsp" />
            <jsp:include page="../layout/sidebar.jsp" />

            <main id="main" class="main">
                <div class="pagetitle">
                    <h1>Quản lý người dùng</h1>
                    <nav>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Trang chủ</a></li>
                            <li class="breadcrumb-item"><a href="index.html">Quản lý</a></li>
                            <li class="breadcrumb-item active">Quản lý người dùng</li>
                        </ol>
                    </nav>
                </div><!-- End Page Title -->

                <section class="section">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <h5 class="card-title">Danh sách người dùng</h5>
                                        <a class="btn btn-primary m-3 mb-2" href="/admin/user/create">Thêm người
                                            dùng</a>
                                    </div>

                                    <!-- Table with stripped rows -->
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="col-1">ID</th>
                                                <th class="col-2">Email</th>
                                                <th class="col-2">Họ tên</th>
                                                <th class="col-2">Vai trò</th>
                                                <th class="col-2">Ngày tạo</th>
                                                <th class="col-3 ps-5">Chức năng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="user" items="${users1}">
                                                <tr>
                                                    <td>${user.id}</td>
                                                    <td>${user.email}</td>
                                                    <td>${user.name}</td>
                                                    <td>${user.role.name}</td>
                                                    <td>${user.createDate}</td>
                                                    <td>
                                                        <a class="btn btn-success" href="/admin/user/${user.id}">Xem</a>
                                                        <a class="btn btn-warning"
                                                            href="/admin/user/update/${user.id}">Sửa</a>
                                                        <a class="btn btn-danger"
                                                            href="/admin/user/delete/${user.id}">Xóa</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <!-- End Table with stripped rows -->

                                    <!-- Pagination Controls -->
                                    <div class="d-flex justify-content-between align-items-center mt-3">
                                        <div>
                                            <span>Trang hiện tại: ${currentPage + 1} / ${totalPages}</span>
                                        </div>
                                        <div>
                                            <!-- Pagination Links -->
                                            <c:forEach var="i" begin="0" end="${totalPages - 1}">
                                                <a class="btn btn-sm btn-outline-primary ${i == currentPage ? 'active' : ''}"
                                                    href="/admin/user?page=${i}">
                                                    ${i + 1}
                                                </a>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main><!-- End #main -->

            <jsp:include page="../layout/footer.jsp" />

            <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
                    class="bi bi-arrow-up-short"></i></a>

            <!-- Vendor JS Files -->
            <script src="/js/apexcharts.min.js"></script>
            <script src="/js/bootstrap.bundle.min.js"></script>
            <script src="/js/chart.umd.js"></script>
            <script src="/js/echarts.min.js"></script>
            <script src="/js/quill.js"></script>
            <script src="/js/simple-datatables.js"></script>
            <script src="/js/tinymce.min.js"></script>
            <script src="/js/validate.js"></script>

            <!-- Template Main JS File -->
            <script src="/js/main.js"></script>

        </body>

        </html>