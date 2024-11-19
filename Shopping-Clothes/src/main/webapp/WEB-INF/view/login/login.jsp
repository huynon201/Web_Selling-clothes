<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <style>
            body {
                background: linear-gradient(to right, #6a11cb, #2575fc);
                /* Gradient background */
                font-family: 'Arial', sans-serif;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
            }

            .form-container {
                background: #fff;
                padding: 40px;
                border-radius: 12px;
                box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 420px;
                transition: transform 0.3s ease-in-out;
            }

            .form-container:hover {
                transform: translateY(-10px);
                /* Hover effect */
            }

            .form-header {
                display: flex;
                align-items: center;
                margin-bottom: 30px;
                justify-content: center;
            }

            .form-header h2 {
                margin-left: 15px;
                color: #333;
                font-size: 28px;
                text-transform: uppercase;
                font-weight: bold;
                letter-spacing: 1px;
            }

            .form-header img {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                /* Logo hình tròn */
                border: 2px solid #2575fc;
            }

            .btn-primary {
                background-color: #2575fc;
                border: none;
                padding: 12px 24px;
                width: 100%;
                border-radius: 5px;
                transition: background-color 0.3s;
            }

            .btn-primary:hover {
                background-color: #6a11cb;
            }

            .form-footer {
                text-align: center;
                margin-top: 15px;
            }

            .form-footer a {
                text-decoration: none;
                color: #2575fc;
            }

            .form-footer a:hover {
                text-decoration: underline;
            }

            .alert-container {
                display: none;
                /* Hidden by default */
            }

            .alert-container.show {
                display: block;
                /* Show when there's a message */
                animation: fadeIn 1s ease-out;
            }

            /* Animation for fadeIn effect */
            @keyframes fadeIn {
                0% {
                    opacity: 0;
                }

                100% {
                    opacity: 1;
                }
            }
        </style>
    </head>

    <body>
        <div class="form-container">
            <div class="form-header">
                <!-- Logo hình tròn -->
                <img src="/images/steaven_logo.webp" alt="Logo">
                <h2>Steaven</h2>
            </div>

            <!-- Hiển thị thông báo lỗi nếu có -->
            <c:if test="${not empty errorMessage}">
                <div class="alert-container show" id="error-alert">
                    <div class="alert alert-danger">${errorMessage}</div>
                </div>
            </c:if>

            <form method="POST" action="/login/process">
                <!-- Email -->
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" name="email" id="email" class="form-control" required
                        placeholder="Nhập email của bạn">
                </div>
                <!-- Password -->
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input type="password" name="password" id="password" class="form-control" required
                        placeholder="Nhập mật khẩu">
                </div>
                <!-- Login Button -->
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">Đăng nhập</button>
                </div>
            </form>

            <!-- Registration Link -->
            <div class="form-footer">
                <p>Bạn chưa có tài khoản? <a href="/register">Đăng ký</a></p>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            // Khi trang tải xong, nếu có thông báo lỗi thì hiển thị thông báo và ẩn sau 3 giây
            window.onload = function () {
                var alertElement = document.getElementById("error-alert");

                // Nếu có thông báo lỗi
                if (alertElement) {
                    // Hiển thị thông báo lỗi ngay lập tức
                    alertElement.classList.add("show");

                    // Sau 3 giây sẽ tự động ẩn
                    setTimeout(function () {
                        alertElement.classList.remove("show");
                    }, 1500);
                }
            };
        </script>
    </body>

    </html>