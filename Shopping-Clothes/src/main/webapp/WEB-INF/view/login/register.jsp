<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Đăng Ký</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
                rel="stylesheet">
            <style>
                /* Thiết lập cho body */
                body {
                    background-color: #f7f7f7;
                    font-family: 'Arial', sans-serif;
                    margin: 0;
                    padding: 0;
                }

                /* Container chính */
                .container {
                    background-color: #ffffff;
                    padding: 40px;
                    border-radius: 15px;
                    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
                    max-width: 500px;
                    margin-top: 80px;
                }

                h2 {
                    color: #333;
                    margin-bottom: 30px;
                    text-align: center;
                    font-weight: bold;
                }

                .form-label {
                    font-weight: 500;
                }

                /* Các input text và password */
                .form-control {
                    border-radius: 8px;
                    box-shadow: none;
                    transition: all 0.3s ease-in-out;
                }

                .form-control:focus {
                    border-color: #0069d9;
                    box-shadow: 0 0 5px rgba(0, 105, 217, 0.5);
                }

                /* Hiệu ứng hover cho các button */
                .btn-primary {
                    background-color: #0069d9;
                    border: none;
                    padding: 12px 25px;
                    border-radius: 8px;
                    width: 100%;
                    transition: background-color 0.3s ease;
                }

                .btn-primary:hover {
                    background-color: #0056b3;
                }

                /* Định dạng thông báo */
                .alert-container {
                    display: none;
                    margin-bottom: 20px;
                    animation: fadeIn 0.5s ease-in-out;
                }

                /* Cải thiện cho avatar */
                .avatar-container {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    margin-top: 15px;
                    position: relative;
                }

                .avatar-wrapper {
                    position: absolute;
                    top: 0;
                    left: 0;
                    z-index: 1;
                    cursor: pointer;
                    background-color: #0069d9;
                    padding: 8px 20px;
                    border-radius: 25px;
                    color: white;
                    font-size: 14px;
                    transition: background-color 0.3s ease;
                }

                .avatar-wrapper:hover {
                    background-color: #0056b3;
                }

                #avatar-preview {
                    width: 90px;
                    height: 90px;
                    border-radius: 50%;
                    object-fit: cover;
                    transition: opacity 0.3s ease;
                }

                #avatar {
                    display: none;
                }

                /* Animation cho fadeIn */
                @keyframes fadeIn {
                    from {
                        opacity: 0;
                    }

                    to {
                        opacity: 1;
                    }
                }

                /* Hiệu ứng hover cho các link */
                .btn-link {
                    text-decoration: none;
                    color: #0069d9;
                    font-weight: bold;
                    transition: color 0.3s ease;
                }

                .btn-link:hover {
                    color: #0056b3;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <h2>Đăng Ký Tài Khoản</h2>

                <!-- Thông báo lỗi -->
                <div id="error-message" class="alert-container">
                    <div class="alert alert-danger">${errorMessage}</div>
                </div>

                <!-- Thông báo thành công -->
                <div id="success-message" class="alert-container">
                    <div class="alert alert-success">${successMessage}</div>
                </div>

                <!-- Form Đăng ký -->
                <form id="registerForm" action="/register/process" method="POST">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" id="email" name="email" class="form-control" required
                            pattern="^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$"
                            title="Vui lòng nhập email hợp lệ">
                    </div>
                    <div class="mb-3">
                        <label for="name" class="form-label">Họ Tên</label>
                        <input type="text" id="name" name="name" class="form-control" required minlength="6"
                            title="Họ tên phải tối thiểu 6 ký tự">
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Mật Khẩu</label>
                        <input type="password" id="password" name="password" class="form-control" required minlength="6"
                            title="Mật khẩu phải tối thiểu 6 ký tự">
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Địa chỉ</label>
                        <input type="text" id="address" name="address" class="form-control" required
                            title="Vui lòng nhập địa chỉ">
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Số Điện Thoại</label>
                        <input type="text" id="phone" name="phone" class="form-control" required pattern="^\d{10,11}$"
                            title="Số điện thoại phải gồm 10-11 chữ số">
                    </div>

                    <!-- Avatar Section -->
                    <div class="avatar-container">
                        <label class="avatar-wrapper" for="avatar">Chọn Avatar</label>
                        <input type="file" id="avatar" name="avatar" accept="image/*" onchange="previewAvatar(event)">
                        <img id="avatar-preview" src="#" alt="Avatar Preview">
                    </div>

                    <div>
                        <button type="submit" class="btn btn-primary">Đăng Ký</button>
                    </div>

                    <!-- Nút trở về trang login -->
                    <div class="text-center mt-3">
                        <a href="/login" class="btn-link">Trở về trang đăng nhập</a>
                    </div>
                </form>
            </div>

            <script>
                // Kiểm tra và hiển thị thông báo nếu có
                window.onload = function () {
                    var errorMessage = "${errorMessage}";
                    var successMessage = "${successMessage}";

                    if (errorMessage) {
                        document.getElementById("error-message").style.display = "block";
                        setTimeout(function () {
                            document.getElementById("error-message").style.display = "none";
                        }, 3000);  // Thông báo sẽ biến mất sau 3 giây
                    } else {
                        document.getElementById("error-message").style.display = "none";
                    }

                    if (successMessage) {
                        document.getElementById("success-message").style.display = "block";
                        setTimeout(function () {
                            document.getElementById("success-message").style.display = "none";
                        }, 3000);  // Thông báo sẽ biến mất sau 3 giây
                    } else {
                        document.getElementById("success-message").style.display = "none";
                    }
                };

                // Hiển thị ảnh avatar
                function previewAvatar(event) {
                    var output = document.getElementById('avatar-preview');
                    var file = event.target.files[0];
                    if (file) {
                        var reader = new FileReader();
                        reader.onload = function () {
                            output.src = reader.result;
                            output.style.display = 'block';
                        };
                        reader.readAsDataURL(file);
                    }
                }
            </script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>