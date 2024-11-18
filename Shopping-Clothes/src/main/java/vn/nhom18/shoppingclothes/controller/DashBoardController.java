package vn.nhom18.shoppingclothes.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DashBoardController {
    @GetMapping("/admin")
    public String handleDashboard() {
        System.out.println("Accessed /admin");
        return "admin/dashboard/show";
    }

    @GetMapping("/admin/contact/show")
    public String showContactPage() {
        return "admin/contact/show"; // trả về trang liên hệ
    }

    @PostMapping("/admin/contact/submit")
    public String handleContactSubmit(@RequestParam String name, @RequestParam String email,
            @RequestParam String message, Model model) {
        // Xử lý thông tin liên hệ (lưu vào cơ sở dữ liệu, gửi email, v.v.)
        model.addAttribute("message", "Cảm ơn bạn đã liên hệ! Chúng tôi sẽ phản hồi trong thời gian sớm nhất.");
        return "admin/contact/show"; // Trở lại trang liên hệ và hiển thị thông báo
    }

}
