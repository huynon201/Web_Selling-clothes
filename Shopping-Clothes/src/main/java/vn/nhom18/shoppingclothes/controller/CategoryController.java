package vn.nhom18.shoppingclothes.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import vn.nhom18.shoppingclothes.domain.Category;
import vn.nhom18.shoppingclothes.service.CategoryService;

@Controller
public class CategoryController {
    private final CategoryService categoryService;

    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping("/admin/category")
    public String getAllCategories(Model model) {
        List<Category> categories = categoryService.getAllCategories(); // Lấy tất cả danh mục từ service
        model.addAttribute("categories", categories); // Truyền danh mục vào model
        return "admin/category/show"; // Trả về trang show.jsp trong thư mục admin/category
    }

    // Phương thức xóa danh mục
    @GetMapping("/admin/category/delete/{id}")
    public String deleteCategory(@PathVariable("id") long id, Model model) {
        // Kiểm tra nếu danh mục tồn tại
        Category category = categoryService.findById(id);

        // Kiểm tra xem danh mục có sản phẩm không
        if (category.getProducts().isEmpty()) {
            // Nếu không có sản phẩm, xóa danh mục
            categoryService.deleteById(id);
            return "redirect:/admin/category"; // Chuyển hướng về danh sách danh mục sau khi xóa
        } else {
            // Nếu có sản phẩm, thông báo lỗi
            model.addAttribute("error",
                    "Danh mục này có " + category.getProducts().size() + " sản phẩm và không thể xóa.");

            // Tải lại danh sách danh mục
            List<Category> categories = categoryService.getAllCategories();
            model.addAttribute("categories", categories);

            return "admin/category/show"; // Quay lại trang danh mục với thông báo lỗi
        }
    }

    // Phương thức hiển thị form sửa
    @GetMapping("/admin/category/update/{id}")
    public String editCategory(@PathVariable("id") long id, Model model) {
        // Lấy thông tin danh mục theo ID và hiển thị trong form
        Category category = categoryService.findById(id);
        model.addAttribute("category", category);
        return "admin/category/update"; // Trả về view
    }

    // Phương thức xử lý khi người dùng gửi form sửa
    @PostMapping("/admin/category/update/{id}")
    public String updateCategory(@PathVariable("id") long id, Category category) {
        // Lấy danh mục từ cơ sở dữ liệu theo ID
        Category existingCategory = categoryService.findById(id);

        // Cập nhật thông tin danh mục
        existingCategory.setName(category.getName());
        existingCategory.setDescription(category.getDescription());

        // Lưu lại thay đổi
        categoryService.save(existingCategory);

        return "redirect:/admin/category"; // Chuyển hướng về danh sách danh mục sau khi sửa
    }
}
