package vn.nhom18.shoppingclothes.controller.admin;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import vn.nhom18.shoppingclothes.domain.User;
import vn.nhom18.shoppingclothes.service.UploadService;
import vn.nhom18.shoppingclothes.service.UserService;

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

    @RequestMapping("/admin/user")
    public String getUserPage(
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "size", defaultValue = "5") int size,
            @RequestParam(value = "keyword", required = false) String keyword,
            Model model) {

        Page<User> userPage;
        if (keyword != null && !keyword.isEmpty()) {
            userPage = userService.searchUsersByKeyword(keyword, page, size);
        } else {
            userPage = userService.getUsersByPage(page, size);
        }

        model.addAttribute("users1", userPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", userPage.getTotalPages());
        model.addAttribute("keyword", keyword);
        model.addAttribute("activePage", "user");
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/create") // GET
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") @Valid User user,
            BindingResult newUserBindingResult,
            @RequestParam("fileName") MultipartFile file) {

        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(user.getPassword());

        user.setAvatar(avatar);
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName(user.getRole().getName()));

        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/update/{id}") // GET
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User user,
            @RequestParam("fileName") MultipartFile file) {
        User currentUser = this.userService.getUserById(user.getId());
        if (currentUser != null) {
            String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
            currentUser.setAddress(user.getAddress());
            currentUser.setName(user.getName());
            currentUser.setPhone(user.getPhone());
            currentUser.setAvatar(avatar);

            // bug here
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        // User user = new User();
        // user.setId(id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User eric) {
        this.userService.deleteAUser(eric.getId());
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/manage")
    public String getMethodName(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }

        String name = (String) session.getAttribute("name");
        String avatar = (String) session.getAttribute("avatar");
        String email = (String) session.getAttribute("email");
        String address = (String) session.getAttribute("address");
        String phone = (String) session.getAttribute("phone");
        long userId = (long) session.getAttribute("id");

        model.addAttribute("name", name);
        model.addAttribute("avatar", avatar);
        model.addAttribute("email", email);
        model.addAttribute("address", address);
        model.addAttribute("phone", phone);
        model.addAttribute("userId", userId);

        return "admin/user/edit-account";
    }

    @PostMapping("/admin/update-account")
    public String updateAccount(@RequestParam("userId") long userId,
            @RequestParam("name") String name,
            @RequestParam("address") String address,
            @RequestParam("phone") String phone,
            @RequestParam(value = "avatar", required = false) MultipartFile avatarFile,
            @RequestParam(value = "oldPassword", required = false) String oldPassword,
            @RequestParam(value = "newPassword", required = false) String newPassword,
            HttpServletRequest request, RedirectAttributes redirectAttributes) {

        User user = userService.getUserById(userId);

        if (user != null) {

            user.setName(name);
            user.setAddress(address);
            user.setPhone(phone);

            if (newPassword != null && !newPassword.isEmpty() && oldPassword != null && !oldPassword.isEmpty()) {
                if (passwordEncoder.matches(oldPassword, user.getPassword())) {
                    user.setPassword(passwordEncoder.encode(newPassword));
                } else {

                    return "redirect:/admin/user/manage?error=true";
                }
            }

            if (avatarFile != null && !avatarFile.isEmpty()) {
                String avatarPath = uploadService.handleSaveUploadFile(avatarFile, "avatar");
                user.setAvatar(avatarPath);
            }

            userService.updateUser(user);
        }

        HttpSession session = request.getSession();
        session.setAttribute("name", name);
        session.setAttribute("address", address);
        session.setAttribute("phone", phone);
        redirectAttributes.addFlashAttribute("message", "Sửa thành công!");
        redirectAttributes.addFlashAttribute("alertType", "success");

        return "redirect:/admin/user/manage";
    }

}
