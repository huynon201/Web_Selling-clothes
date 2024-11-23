package vn.nhom18.shoppingclothes.controller;

<<<<<<< HEAD
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
=======
import java.util.List;

>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
<<<<<<< HEAD
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.nhom18.shoppingclothes.domain.Role;
import vn.nhom18.shoppingclothes.domain.User;
import vn.nhom18.shoppingclothes.service.RoleService;
import vn.nhom18.shoppingclothes.service.UploadService;
import vn.nhom18.shoppingclothes.service.UserService;
=======
import org.springframework.validation.FieldError;

import vn.nhom18.shoppingclothes.service.UploadService;
import vn.nhom18.shoppingclothes.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import vn.nhom18.shoppingclothes.domain.User;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.RequestBody;
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f

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
<<<<<<< HEAD

        model.addAttribute("activePage", "user");

=======
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
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
<<<<<<< HEAD
=======

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
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
}
