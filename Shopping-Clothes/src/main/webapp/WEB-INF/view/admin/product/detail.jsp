<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Chi Tiết Sản Phẩm</title>
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
            <style>
                .product-image {
                    max-width: 100%;
                    height: auto;
                    border-radius: 5px;
                }

                .product-details {
                    background-color: #f8f9fa;
                    padding: 20px;
                    border-radius: 8px;
                    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                }

                .product-header {
                    background-color: #343a40;
                    color: white;
                    padding: 10px;
                    border-radius: 5px;
                }

                .btn-primary {
                    background-color: #007bff;
                    border-color: #007bff;
                }

                .product-title {
                    font-size: 2rem;
                    font-weight: bold;
                    color: #333;
                }

                .product-price {
                    font-size: 1.5rem;
                    color: #e83e8c;
                    font-weight: bold;
                }

                .product-description {
                    font-size: 1.1rem;
                    color: #6c757d;
                    word-wrap: break-word
                }

                .card-body p {
                    font-size: 1rem;
                    margin-bottom: 10px;
                }

                .back-btn {
                    margin-top: 20px;
                }

                .short-desc-container {
                    margin-top: 15px;
                    word-wrap: break-word;
                }
            </style>
        </head>

        <body>
            <div class="container mt-5">
                <h2 class="product-title mb-4">Chi Tiết Sản Phẩm</h2>
                <div class="card product-details">
                    <div class="card-header product-header">
                        <h4>Thông tin sản phẩm</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <!-- Hình ảnh sản phẩm -->
                                <img src="${product.image}" class="product-image" alt="${product.name}">
                            </div>
                            <div class="col-md-6">
                                <p><strong>ID:</strong> ${product.id}</p>
                                <p><strong>Tên sản phẩm:</strong> ${product.name}</p>
                                <p class="product-price"><strong>Giá:</strong> ${product.price} VND</p>
                                <p><strong>Số lượng:</strong> ${product.quantity}</p>
                                <p><strong>Ngày tạo:</strong> ${product.createDate}</p>
                                <p><strong>Danh mục:</strong> ${product.category.name}</p>
                            </div>
                        </div>
                        <!-- Mô tả ngắn sẽ nằm ngay dưới danh mục -->
                        <div class="short-desc-container">
                            <h5><strong>Mô tả ngắn:</strong></h5>
                            <p>${product.shortDesc}</p>
                        </div>
                        <div class="mt-4">
                            <h5><strong>Mô tả chi tiết:</strong></h5>
                            <p class="product-description">${product.detailDesc}</p>
                        </div>
                        <div class="back-btn text-center">
                            <a href="/admin/product" class="btn btn-primary btn-lg">Trở về danh sách sản phẩm</a>
                        </div>
                    </div>
                </div>
            </div>

            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        </body>

        </html>