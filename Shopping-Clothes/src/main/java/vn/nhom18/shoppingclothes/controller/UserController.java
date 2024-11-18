package vn.nhom18.shoppingclothes.controller;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;

import vn.nhom18.shoppingclothes.service.UploadService;
import vn.nhom18.shoppingclothes.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.nhom18.shoppingclothes.domain.Role;
import vn.nhom18.shoppingclothes.domain.User;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class UserController {
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final UploadService uploadService;

    public UserController(UserService userService, PasswordEncoder passwordEncoder, UploadService uploadService) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.uploadService = uploadService;
    }

    // Lấy tất cả user
    @GetMapping("/admin/user")
    public String getFullUser(Model model) {
        List<User> user = this.userService.handlegetAllUser();
        model.addAttribute("users", user);
        return "admin/user/show";
    }

    // Get create page
    @GetMapping("/admin/user/create")
    public String getMethodName(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // Post create user
    @PostMapping("/admin/user/create")
    public String postCreateUser(Model model, @ModelAttribute("newUser") @Valid User user,
            BindingResult newUserBindingResult,
            @RequestParam("avatarFile") MultipartFile file) {

        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");

        user.setAvatar(avatar);
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName(user.getRole().getName()));
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    // Get delete page
    @GetMapping("/admin/user/delete/{id}")
    public String getUserDeletePage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        User user = this.userService.getUserById(id);
        model.addAttribute("newUser", user);
        return "admin/user/delete";
    }

    // Post delete user
    @PostMapping("/admin/user/delete")
    public String postDeleteUser(@ModelAttribute("newUser") User user) {
        // TODO: process POST request
        this.userService.handleDeleteUser(user.getId());
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserId(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("newUser", user);
        return "admin/user/detail";
    }

    // Hiển thị form cập nhật người dùng// Hiển thị form cập nhật người dùng
    @GetMapping("/admin/user/update/{id}")
    public String showUpdateForm(@PathVariable("id") long id, Model model) {
        User user = userService.getUserById(id);
        if (user != null) {
            model.addAttribute("user", user);
            model.addAttribute("roles", userService.getAllRoles());
            return "admin/user/update"; // Đường dẫn tới trang update.jsp
        }
        return "redirect:/admin/user"; // Quay lại danh sách người dùng nếu không tìm thấy người dùng
    }

    // Xử lý cập nhật người dùng
    @PostMapping("/admin/user/update/{id}")
    public String postUpdateUser(@PathVariable Long id, Model model, @ModelAttribute("user") @Valid User user,
            BindingResult bindingResult, @RequestParam("avatarFile") MultipartFile file) {

        if (bindingResult.hasErrors()) {
            return "admin/user/update"; // Trả về trang chỉnh sửa nếu có lỗi
        }

        // Lấy thông tin người dùng hiện tại từ DB để giữ nguyên thông tin cũ
        User existingUser = userService.getUserById(id);

        // Giữ nguyên ngày tạo
        user.setCreateDate(existingUser.getCreateDate());

        // Nếu có ảnh mới, xử lý lưu ảnh và cập nhật
        if (!file.isEmpty()) {
            String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
            user.setAvatar(avatar);
        } else {
            user.setAvatar(existingUser.getAvatar()); // Giữ nguyên ảnh cũ nếu không chọn ảnh mới
        }

        // Kiểm tra mật khẩu và giữ nguyên nếu không thay đổi
        if (user.getPassword() != null && !user.getPassword().isEmpty()) {
            // Mật khẩu mới có, mã hóa và cập nhật
            user.setPassword(passwordEncoder.encode(user.getPassword()));
        } else {
            // Không thay đổi mật khẩu, giữ nguyên mật khẩu cũ
            user.setPassword(existingUser.getPassword());
        }

        // Cập nhật vai trò của người dùng
        user.setRole(this.userService.getRoleByName(user.getRole().getName()));

        // Cập nhật thông tin người dùng vào cơ sở dữ liệu
        this.userService.handleUpdateUser(user); // Lưu vào DB

        return "redirect:/admin/user"; // Chuyển hướng đến danh sách người dùng
    }

    // Xử lý hủy cập nhật, quay lại trang danh sách người dùng
    @GetMapping("/admin/user/cancel")
    public String cancelUpdate() {
        return "redirect:/admin/user";
    }

}
