(function ($) {
  "use strict";

  // Spinner
  var spinner = function () {
    setTimeout(function () {
      if ($("#spinner").length > 0) {
        $("#spinner").removeClass("show");
      }
    }, 1);
  };
  spinner(0);

  // Fixed Navbar
  $(window).scroll(function () {
    if ($(window).width() < 992) {
      if ($(this).scrollTop() > 55) {
        $(".fixed-top").addClass("shadow");
      } else {
        $(".fixed-top").removeClass("shadow");
      }
    } else {
      if ($(this).scrollTop() > 55) {
        $(".fixed-top").addClass("shadow").css("top", -55);
      } else {
        $(".fixed-top").removeClass("shadow").css("top", 0);
      }
    }
  });

  // Back to top button
  $(window).scroll(function () {
    if ($(this).scrollTop() > 300) {
      $(".back-to-top").fadeIn("slow");
    } else {
      $(".back-to-top").fadeOut("slow");
    }
  });
  $(".back-to-top").click(function () {
    $("html, body").animate({ scrollTop: 0 }, 1500, "easeInOutExpo");
    return false;
  });

  // Testimonial carousel
  $(".testimonial-carousel").owlCarousel({
    autoplay: true,
    smartSpeed: 2000,
    center: false,
    dots: true,
    loop: true,
    margin: 25,
    nav: true,
    navText: [
      '<i class="bi bi-arrow-left"></i>',
      '<i class="bi bi-arrow-right"></i>',
    ],
    responsiveClass: true,
    responsive: {
      0: {
        items: 1,
      },
      576: {
        items: 1,
      },
      768: {
        items: 1,
      },
      992: {
        items: 2,
      },
      1200: {
        items: 2,
      },
    },
  });

  // Vegetable carousel
  $(".vegetable-carousel").owlCarousel({
    autoplay: true,
    smartSpeed: 1500,
    center: false,
    dots: true,
    loop: true,
    margin: 25,
    nav: true,
    navText: [
      '<i class="bi bi-arrow-left"></i>',
      '<i class="bi bi-arrow-right"></i>',
    ],
    responsiveClass: true,
    responsive: {
      0: {
        items: 1,
      },
      576: {
        items: 1,
      },
      768: {
        items: 2,
      },
      992: {
        items: 3,
      },
      1200: {
        items: 4,
      },
    },
  });

  // Modal Video
  $(document).ready(function () {
    var $videoSrc;
    $(".btn-play").click(function () {
      $videoSrc = $(this).data("src");
    });
    console.log($videoSrc);

    $("#videoModal").on("shown.bs.modal", function (e) {
      $("#video").attr(
        "src",
        $videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0"
      );
    });

    $("#videoModal").on("hide.bs.modal", function (e) {
      $("#video").attr("src", $videoSrc);
    });
  });

  // Product Quantity
  $(".quantity button").on("click", function () {
    var button = $(this);
    var oldValue = button.parent().parent().find("input").val();
    if (button.hasClass("btn-plus")) {
      var newVal = parseFloat(oldValue) + 1;
    } else {
      if (oldValue > 0) {
        var newVal = parseFloat(oldValue) - 1;
      } else {
        newVal = 0;
      }
    }
    button.parent().parent().find("input").val(newVal);
  });

  // Zoom ảnh
  document.querySelectorAll(".zoom-container").forEach((container) => {
    const image = container.querySelector(".zoom-image");

    container.addEventListener("mousemove", (e) => {
      const rect = container.getBoundingClientRect();
      const x = e.clientX - rect.left;
      const y = e.clientY - rect.top;

      const xPercent = (x / rect.width) * 100;
      const yPercent = (y / rect.height) * 100;

      image.style.transformOrigin = `${xPercent}% ${yPercent}%`;
    });

    container.addEventListener("mouseleave", () => {
      image.style.transformOrigin = "center center";
    });
  });

  // Show more content toggle
  document.addEventListener("DOMContentLoaded", function () {
    const showMoreButton = document.querySelector(".show-more-btn");
    const descContent = document.querySelector(".desc-content-js");

    if (showMoreButton && descContent) { // Kiểm tra nếu phần tử tồn tại
      showMoreButton.addEventListener("click", () => {
        if (descContent.style.maxHeight === "none") {
          descContent.style.maxHeight = "230px";
          showMoreButton.textContent = "Xem thêm nội dung";
        } else {
          descContent.style.maxHeight = "none";
          showMoreButton.textContent = "Thu gọn nội dung";
        }
      });
    } else {
      console.error("Phần tử không tồn tại: show-more-btn hoặc desc-content-js");
    }
  });
  // Slick Slider for Page Header
  $(document).ready(function () {
    $('.slider').slick({
      autoplay: true,          // Tự động chuyển slide
      autoplaySpeed: 3000,     // Tốc độ thay đổi slide (3 giây)
      dots: true,              // Hiển thị dot điều hướng dưới slider
      infinite: true,          // Cho phép lặp lại vòng tròn
      arrows: true,            // Hiển thị mũi tên điều hướng
      fade: true,              // Hiệu ứng chuyển fade
      speed: 1000              // Tốc độ chuyển slide
    });
  });



})(jQuery);
$('.quantity1 button').on('click', function () {
  let change = 0;
  var button = $(this);
  var oldValue = button.parent().parent().find('input').val();
  var stockQuantity = parseInt(button.parent().parent().find('input').data('cart-detail-store'));

  if (button.hasClass('btn-plus')) {
    if (parseFloat(oldValue) < stockQuantity) {
      var newVal = parseFloat(oldValue) + 1;
      change = 1;
    } else {
      return;
    }
  } else {
    if (oldValue > 1) {
      var newVal = parseFloat(oldValue) - 1;
      change = -1;
    } else {
      newVal = 1;
    }
  }

  const input = button.parent().parent().find('input');
  input.val(newVal);

  //set form index
  const index = input.attr("data-cart-detail-index")
  const el = document.getElementById(`cartDetails${index}.quantity`);
  $(el).val(newVal);



  //get price
  const price = input.attr("data-cart-detail-price");
  const id = input.attr("data-cart-detail-id");

  const priceElement = $(`p[data-cart-detail-id='${id}']`);
  if (priceElement) {
    const newPrice = +price * newVal;
    priceElement.text(newPrice + " đ");
  }

  //update total cart price
  const totalPriceElement = $(`p[data-cart-total-price]`);

  if (totalPriceElement && totalPriceElement.length) {
    const currentTotal = totalPriceElement.first().attr("data-cart-total-price");
    let newTotal = +currentTotal;
    if (change === 0) {
      newTotal = +currentTotal;
    } else {
      newTotal = change * (+price) + (+currentTotal);
    }

    //reset change
    change = 0;

    //update
    totalPriceElement?.each(function (index, element) {
      //update text
      $(totalPriceElement[index]).text(newTotal + " đ");

      //update data-attribute
      $(totalPriceElement[index]).attr("data-cart-total-price", newTotal);
    });
  }
});