package vn.nhom18.shoppingclothes.controller;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;
import vn.nhom18.shoppingclothes.domain.Product;
import vn.nhom18.shoppingclothes.domain.Role;
import vn.nhom18.shoppingclothes.domain.User;
import vn.nhom18.shoppingclothes.repository.ProductRepository;
import vn.nhom18.shoppingclothes.repository.RoleRepository;
import vn.nhom18.shoppingclothes.service.UserService;

@Controller
public class LoginController {
    private final UserService userService;
    private final RoleRepository roleRepository;
    private final ProductRepository productRepository;
    public LoginController(UserService userService, RoleRepository roleRepository, ProductRepository productRepository) {
        this.userService = userService;
        this.roleRepository = roleRepository;
        this.productRepository = productRepository;
    }

    @GetMapping("/login")
    public String showLoginPage() {
        return "login/login"; // Điều này sẽ ánh xạ tới /WEB-INF/views/login/login.jsp
    }

    // Xử lý đăng nhập
    @PostMapping("/login/process")
    public String handleLogin(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            Model model) {

        if (email.isEmpty() || password.isEmpty()) {
            model.addAttribute("errorMessage", "Email và mật khẩu không được để trống.");
            return "login/login"; // Quay lại trang login nếu thiếu thông tin
        }

        // Kiểm tra người dùng trong cơ sở dữ liệu
        User user = userService.authenticateUser(email, password);
        if (user != null) {
            // Đăng nhập thành công, chuyển hướng đến trang homepage
            return "redirect:/";
        } else {
            model.addAttribute("errorMessage", "Email hoặc mật khẩu không đúng!");
            return "login/login"; // Quay lại login nếu thông tin sai
        }
    }

    @RequestMapping("/user/homepage")
    public String showHomepage(Model model) {
        List<Product> products = productRepository.findAll(); // Lấy danh sách sản phẩm từ DB
        model.addAttribute("products", products); // Thêm vào model
        return "user/homepage"; // Hiển thị trang homepage
    }

    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("user", new User()); // Để form binding
        return "login/register";
    }

    @PostMapping("/register/process")
    public String handleRegistration(@Valid @ModelAttribute("user") User user,
            BindingResult result,
            Model model) {
        // Kiểm tra lỗi validation
        if (result.hasErrors()) {
            return "login/register"; // Quay lại trang đăng ký nếu có lỗi validation
        }

        // Kiểm tra email đã tồn tại chưa
        if (!userService.registerUser(user)) {
            model.addAttribute("errorMessage", "Email này đã được đăng ký trước đó. Vui lòng chọn email khác.");
            return "login/register"; // Nếu email trùng, quay lại trang đăng ký với thông báo lỗi
        }

        // Gán giá trị mặc định cho role (nếu không được chọn trong form)
        Role defaultRole = roleRepository.findByName("USER");
        if (defaultRole == null) {
            throw new RuntimeException("Vai trò mặc định 'USER' không tồn tại trong cơ sở dữ liệu!");
        }
        user.setRole(defaultRole);

        // Chuyển đến trang đăng nhập sau khi đăng ký thành công
        model.addAttribute("successMessage", "Đăng ký thành công! Vui lòng đăng nhập.");
        return "redirect:/login"; // Chuyển hướng đến trang login sau khi đăng ký thành công
    }

}
