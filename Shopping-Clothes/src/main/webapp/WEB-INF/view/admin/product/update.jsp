<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Sửa Sản Phẩm</title>
            <link rel="stylesheet" href="/css/bootstrap.min.css">
            <style>
                /* CSS cho hình ảnh xem trước */
                .image-preview {
                    max-width: 300px;
                    max-height: 300px;
                    margin-top: 15px;
                    border: 1px solid #ddd;
                    padding: 10px;
                    display: none;
                }

                /* Căn giữa các nút */
                .form-actions {
                    display: flex;
                    justify-content: center;
                    gap: 20px;
                    margin-top: 20px;
                }

                /* CSS cho phần form */
                .form-group label {
                    font-weight: bold;
                }
            </style>
        </head>

        <body>
            <div class="container mt-5">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white text-center">
                        <h3>Sửa Sản Phẩm</h3>
                    </div>
                    <div class="card-body">
                        <form action="/admin/product/update/${product.id}" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="name">Tên sản phẩm</label>
                                <input type="text" name="name" id="name" class="form-control" value="${product.name}"
                                    required>
                            </div>

                            <div class="form-group mt-3">
                                <label for="price">Giá sản phẩm</label>
                                <input type="number" name="price" id="price" class="form-control"
                                    value="${product.price}" required>
                            </div>

                            <div class="form-group mt-3">
                                <label for="quantity">Số lượng</label>
                                <input type="number" name="quantity" id="quantity" class="form-control"
                                    value="${product.quantity}" required>
                            </div>

                            <div class="form-group mt-3">
                                <label for="imageFile">Hình ảnh sản phẩm</label>
                                <input type="file" name="imageFile" id="imageFile" class="form-control"
                                    onchange="previewImage(event)">
                                <!-- Hiển thị ảnh đã chọn -->
                                <img id="imagePreview" class="image-preview" alt="Xem trước hình ảnh">
                            </div>

                            <div class="form-group mt-3">
                                <label for="shortDesc">Mô tả ngắn</label>
                                <textarea name="shortDesc" id="shortDesc" class="form-control" rows="3"
                                    required>${product.shortDesc}</textarea>
                            </div>

                            <div class="form-group mt-3">
                                <label for="detailDesc">Mô tả chi tiết</label>
                                <textarea name="detailDesc" id="detailDesc" class="form-control" rows="5"
                                    required>${product.detailDesc}</textarea>
                            </div>

                            <div class="form-group mt-3">
                                <label for="category">Danh mục</label>
                                <select name="category.id" id="category" class="form-control">
                                    <c:forEach var="category" items="${categories}">
                                        <option value="${category.id}" ${category.id==product.category.id ? 'selected'
                                            : '' }>${category.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <!-- Các nút hành động: Cập nhật và Trở về -->
                            <div class="form-actions">
                                <a href="/admin/product" class="btn btn-secondary">Trở về</a>
                                <button type="submit" class="btn btn-success">Cập nhật sản phẩm</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Bootstrap JS -->
            <script src="/js/bootstrap.bundle.min.js"></script>

            <!-- JavaScript xem trước hình ảnh -->
            <script>
                function previewImage(event) {
                    const input = event.target;
                    const preview = document.getElementById("imagePreview");

                    if (input.files && input.files[0]) {
                        const reader = new FileReader();

                        reader.onload = function (e) {
                            preview.src = e.target.result;
                            preview.style.display = "block"; // Hiển thị ảnh khi đã chọn
                        };

                        reader.readAsDataURL(input.files[0]);
                    } else {
                        preview.style.display = "none";
                    }
                }
            </script>
        </body>

        </html>