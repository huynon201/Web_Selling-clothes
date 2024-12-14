<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Quản lý chi tiết sản phẩm</title>
            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

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
                <div class="container mt-4">
                    <h1 class="mb-4">Quản lý chi tiết sản phẩm</h1>
                    <a href="/admin/productDetail/create" class="btn btn-success mb-3">Thêm mới</a>

                    <!-- Bảng danh sách chi tiết sản phẩm -->
                    <table class="table table-bordered table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Sản phẩm</th>
                                <th>Size</th>
                                <th>Màu sắc</th>
                                <th>Số lượng</th>
                                <th>Hình ảnh</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${productDetails.content}" var="detail">
                                <tr>
                                    <td>${detail.id}</td>
                                    <td>${detail.product.name}</td>
                                    <td>${detail.size.name}</td>
                                    <td>${detail.color.name}</td>
                                    <td>${detail.quantity}</td>
                                    <td><img src="${detail.imageDetail}" alt="Ảnh chi tiết" class="img-fluid"
                                            style="max-width: 100px; max-height: 100px;" /></td>
                                    <td>
                                        <a href="/admin/productDetail/edit/${detail.id}"
                                            class="btn btn-warning btn-sm">Sửa</a>
                                        <a href="/admin/productDetail/delete/${detail.id}" class="btn btn-danger btn-sm"
                                            onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Phân trang -->
                    <nav aria-label="Page navigation">
                        <ul class="pagination justify-content-center">
                            <c:if test="${currentPage > 0}">
                                <li class="page-item">
                                    <a class="page-link" href="/admin/productDetail?page=${currentPage - 1}"
                                        aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach begin="0" end="${totalPages - 1}" var="i">
                                <li class="page-item <c:if test='${i == currentPage}'>active</c:if>">
                                    <a class="page-link" href="/admin/productDetail?page=${i}">${i + 1}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${currentPage < totalPages - 1}">
                                <li class="page-item">
                                    <a class="page-link" href="/admin/productDetail?page=${currentPage + 1}"
                                        aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </main>

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

            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
        </body>

        </html>