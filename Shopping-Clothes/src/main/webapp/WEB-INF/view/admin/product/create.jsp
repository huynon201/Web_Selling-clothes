<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="vi">

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

                .text-danger {
                    color: red;
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
                                    placeholder="Nhập tên sản phẩm" value="${product.name}">
                                <div id="nameError" class="text-danger mt-2"></div>
                            </div>

                            <div class="form-group mt-3">
                                <label for="price"><strong>Giá sản phẩm</strong></label>
                                <input type="number" name="price" id="price" class="form-control"
                                    placeholder="Nhập giá sản phẩm" value="${product.price}">
                                <div id="priceError" class="text-danger mt-2"></div>
                            </div>

                            <div class="form-group mt-3">
                                <label for="quantity"><strong>Số lượng</strong></label>
                                <input type="number" name="quantity" id="quantity" class="form-control"
                                    placeholder="Nhập số lượng sản phẩm" value="${product.quantity}">
                                <div id="quantityError" class="text-danger mt-2"></div>
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
                                    placeholder="Nhập mô tả ngắn" rows="3"></textarea>
                                <div id="shortDescError" class="text-danger mt-2"></div>
                            </div>

                            <div class="form-group mt-3">
                                <label for="detailDesc"><strong>Mô tả chi tiết</strong></label>
                                <textarea name="detailDesc" id="detailDesc" class="form-control"
                                    placeholder="Nhập mô tả chi tiết" rows="5"></textarea>
                                <div id="detailDescError" class="text-danger mt-2"></div>
                            </div>

                            <div class="form-group mt-3">
                                <label for="category"><strong>Danh mục</strong></label>
                                <select name="category.id" id="category" class="form-control">
                                    <c:forEach var="category" items="${categories}">
                                        <option value="${category.id}">${category.name}</option>
                                    </c:forEach>
                                </select>
                                <div id="categoryError" class="text-danger mt-2"></div>
                            </div>

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

            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    const form = document.getElementById("productForm");
                    const nameField = document.getElementById("name");
                    const priceField = document.getElementById("price");
                    const quantityField = document.getElementById("quantity");
                    const shortDescField = document.getElementById("shortDesc");
                    const detailDescField = document.getElementById("detailDesc");

                    // Thêm kiểm tra cho các trường khác
                    nameField.addEventListener("input", () => validateField(nameField, "nameError", "Tên sản phẩm không được để trống."));
                    priceField.addEventListener("input", () => validateFieldWithCondition(priceField, "priceError", "Giá sản phẩm phải lớn hơn 0.", (value) => value > 0));
                    quantityField.addEventListener("input", () => validateFieldWithCondition(quantityField, "quantityError", "Số lượng phải lớn hơn hoặc bằng 1.", (value) => value >= 1));
                    shortDescField.addEventListener("input", () => validateField(shortDescField, "shortDescError", "Mô tả ngắn không được để trống."));
                    detailDescField.addEventListener("input", () => validateField(detailDescField, "detailDescError", "Mô tả chi tiết không được để trống."));

                    function validateField(field, errorId, errorMessage) {
                        const errorElement = document.getElementById(errorId);
                        if (!field.value.trim()) {
                            errorElement.innerText = errorMessage;
                        } else {
                            errorElement.innerText = "";
                        }
                    }

                    function validateFieldWithCondition(field, errorId, errorMessage, condition) {
                        const errorElement = document.getElementById(errorId);
                        const value = parseFloat(field.value);
                        if (isNaN(value) || !condition(value)) {
                            errorElement.innerText = errorMessage;
                        } else {
                            errorElement.innerText = "";
                        }
                    }
                    // Xem trước hình ảnh
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

                    // Xử lý gửi form
                    form.addEventListener("submit", function (event) {
                        let valid = true;

                        // Kiểm tra tất cả các trường
                        if (!nameField.value.trim()) {
                            document.getElementById("nameError").innerText = "Tên sản phẩm không được để trống.";
                            valid = false;
                        }

                        const priceValue = parseFloat(priceField.value);
                        if (isNaN(priceValue) || priceValue <= 0) {
                            document.getElementById("priceError").innerText = "Giá sản phẩm phải lớn hơn 0.";
                            valid = false;
                        }

                        const quantityValue = parseFloat(quantityField.value);
                        if (isNaN(quantityValue) || quantityValue < 1) {
                            document.getElementById("quantityError").innerText = "Số lượng phải lớn hơn hoặc bằng 1.";
                            valid = false;
                        }

                        if (!shortDescField.value.trim()) {
                            document.getElementById("shortDescError").innerText = "Mô tả ngắn không được để trống.";
                            valid = false;
                        }

                        if (!detailDescField.value.trim()) {
                            document.getElementById("detailDescError").innerText = "Mô tả chi tiết không được để trống.";
                            valid = false;
                        }

                        if (!valid) {
                            event.preventDefault(); // Ngừng gửi form nếu có lỗi
                        }
                    });
                });
            </script>
        </body>

        </html>