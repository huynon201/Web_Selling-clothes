<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!-- Spinner Start -->
  <div id="spinner"
    class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
  </div>
  <!-- Spinner End -->

  <!-- Navbar start -->
  <div class="container-fluid fixed-top">
    <div class="container topbar bg-primary d-none d-lg-block">
      <div class="d-flex justify-content-between">
        <div class="top-info ps-2">
          <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i>
            <a href="#" class="text-white">132 Nguyên Xá, Cầu Diễn</a></small>
          <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#"
              class="text-white">doanhvipnvn@gmail.com</a></small>
        </div>
        
      </div>
    </div>
    <div class="container px-0">
      <nav class="navbar navbar-light bg-white navbar-expand-xl">
        <a style="display: flex" href="${pageContext.request.contextPath}/home" class="navbar-brand">
          <img style="height:50px; width: 50px; border-radius: 50%; margin-right: 20px"
            src="${pageContext.request.contextPath}/images/steaven_logo.webp" class="img-fluid" alt="Logo Steamen" />
          <h1 class="text-primary display-6">Steaven</h1>
        </a>

        <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
          data-bs-target="#navbarCollapse">
          <span class="fa fa-bars text-primary"></span>
        </button>
        <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
          <div class="navbar-nav mx-auto">
            <a href="homepage" class="nav-item nav-link">Trang chủ</a>
            <a href="shop.html" class="nav-item nav-link">Sản phẩm</a>
            <div class="nav-item dropdown">
              <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Danh Mục Sản Phẩm</a>
              <div class="dropdown-menu ms-4 bg-secondary rounded-0">
                <!-- Liên kết đến trang sản phẩm cho Nam -->
                <!-- Các liên kết đến sản phẩm Nam và Nữ -->
                <a href="product-list.jsp?target=Nam" class="dropdown-item">Nam</a>
                <a href="product-list.jsp?target=Nữ" class="dropdown-item">Nữ</a>

              </div>
            </div>
            <a href="shop.html" class="nav-item nav-link">Giỏ hàng</a>
            <a href="shop.html" class="nav-item nav-link">Khuyến mãi</a>
            <a href="contact.html" class="nav-item nav-link">Liên hệ</a>
          </div>
          <div class="d-flex m-3 me-0">
            <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4"
              data-bs-toggle="modal" data-bs-target="#searchModal">
              <i class="fas fa-search text-primary"></i>
            </button>
            <a href="cart.jsp" class="position-relative me-4 my-auto">
              <i class="fa fa-shopping-bag fa-2x"></i>
              <span id="cartQuantity"
                class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                style="top: -5px; left: 15px; height: 20px; min-width: 20px;">0</span>
            </a>
            <a href="#" class="my-auto">
              <i class="fas fa-user fa-2x"></i>
            </a>
          </div>
        </div>
      </nav>
    </div>
  </div>
  <!-- Navbar End -->

  <!-- Modal Search Start -->
  <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
      <div class="modal-content rounded-0">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">
            Search by keyword
          </h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body d-flex align-items-center">
          <div class="input-group w-75 mx-auto d-flex">
            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1" />
            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Single Page Header End -->