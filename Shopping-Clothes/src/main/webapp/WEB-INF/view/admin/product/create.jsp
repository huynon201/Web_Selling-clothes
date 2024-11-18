<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Thêm sản phẩm</title>
            <link rel="stylesheet" href="/css/bootstrap.min.css">
            <style>
                .image-preview {
                    max-width: 300px;
                    max-height: 300px;
                    margin-top: 15px;
                    border: 1px solid #ddd;
                    padding: 10px;
                    display: none;
                }

                .form-actions {
                    display: flex;
                    justify-content: center;
                    gap: 15px;
                    margin-top: 20px;
                }
            </style>
        </head>

        <body>
            <div class="container mt-5">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white text-center">
                        <h3>Thêm sản phẩm mới</h3>
                    </div>
                    <div class="card-body">
                        <form action="/admin/product/create" method="post" enctype="multipart/form-data"
                            id="productForm">

                            <div class="form-group">
                                <label for="name"><strong>Tên sản phẩm</strong></label>
                                <input type="text" name="name" id="name" class="form-control"
                                    placeholder="Nhập tên sản phẩm" required>
                            </div>

                            <div class="form-group mt-3">
                                <label for="price"><strong>Giá sản phẩm</strong></label>
                                <input type="number" name="price" id="price" class="form-control"
                                    placeholder="Nhập giá sản phẩm" required>
                            </div>

                            <div class="form-group mt-3">
                                <label for="quantity"><strong>Số lượng</strong></label>
                                <input type="number" name="quantity" id="quantity" class="form-control"
                                    placeholder="Nhập số lượng sản phẩm" required>
                            </div>

                            <div class="form-group mt-3">
                                <label for="imageFile"><strong>Hình ảnh sản phẩm</strong></label>
                                <input type="file" name="imageFile" id="imageFile" class="form-control"
                                    onchange="previewImage(event)">
                                <img id="imagePreview" class="image-preview" alt="Xem trước hình ảnh">
                            </div>

                            <div class="form-group mt-3">
                                <label for="shortDesc"><strong>Mô tả ngắn</strong></label>
                                <textarea name="shortDesc" id="shortDesc" class="form-control"
                                    placeholder="Nhập mô tả ngắn" rows="3" required></textarea>
                            </div>

                            <div class="form-group mt-3">
                                <label for="detailDesc"><strong>Mô tả chi tiết</strong></label>
                                <textarea name="detailDesc" id="detailDesc" class="form-control"
                                    placeholder="Nhập mô tả chi tiết" rows="5" required></textarea>
                            </div>

                            <div class="form-group mt-3">
                                <label for="category"><strong>Danh mục</strong></label>
                                <select name="category.id" id="category" class="form-control">
                                    <c:forEach var="category" items="${categories}">
                                        <option value="${category.id}">${category.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <!-- Nút hành động: Lưu và Trở về -->
                            <div class="form-actions">
                                <a href="/admin/product" class="btn btn-secondary">Trở về</a>
                                <button type="submit" class="btn btn-success">Lưu sản phẩm</button>
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
                            preview.style.display = "block";
                        };

                        reader.readAsDataURL(input.files[0]);
                    } else {
                        preview.style.display = "none";
                    }
                }
            </script>
        </body>

        </html>