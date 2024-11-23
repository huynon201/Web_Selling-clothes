package vn.nhom18.shoppingclothes.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.nhom18.shoppingclothes.domain.Product;
import vn.nhom18.shoppingclothes.service.ProductService;
import vn.nhom18.shoppingclothes.service.UploadService;

@Controller
public class ProductController {

    private final UploadService uploadService;
    private final ProductService productService;

    public ProductController(UploadService uploadService, ProductService productService) {
        this.uploadService = uploadService;
        this.productService = productService;
    }

    @GetMapping("/admin/product")
    public String getProduct(Model model) {
        List<Product> prs = this.productService.fetchProducts();
        model.addAttribute("products", prs);
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String createProductForm(Model model) {
        // Lấy danh sách các danh mục để hiển thị trong dropdown
        model.addAttribute("categories", productService.getAllCategories());
        model.addAttribute("product", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(
            @Valid @ModelAttribute("product") Product product,
            @RequestParam("imageFile") MultipartFile imageFile,
            BindingResult result,
            Model model) {

        // Kiểm tra nếu có lỗi trong binding
        if (result.hasErrors()) {
            model.addAttribute("categories", productService.getAllCategories());

            // Lấy thông báo lỗi cho từng trường
            if (result.hasFieldErrors("name")) {
                model.addAttribute("nameError", "Tên sản phẩm không được để trống.");
            }
            if (result.hasFieldErrors("price")) {
                model.addAttribute("priceError", "Giá sản phẩm phải lớn hơn 0.");
            }
            if (result.hasFieldErrors("quantity")) {
                model.addAttribute("quantityError", "Số lượng sản phẩm phải lớn hơn 0.");
            }

            return "admin/product/create"; // Trả lại trang tạo nếu có lỗi
        }

        // Xử lý hình ảnh nếu có
        if (!imageFile.isEmpty()) {
            String fileName = uploadService.handleSaveUploadFile(imageFile, "products");
            product.setImage(fileName);
        }

        // Lưu sản phẩm vào cơ sở dữ liệu
        productService.createProduct(product);

        return "redirect:/admin/product"; // Redirect đến trang sản phẩm sau khi tạo thành công
    }

    @GetMapping("/admin/product/detail/{id}")
    public String viewProductDetail(@PathVariable("id") long id, Model model) {
        Product product = productService.getProductById(id); // Lấy sản phẩm theo ID
        model.addAttribute("product", product);
        return "admin/product/detail"; // Trả về trang detail.jsp
    }

    @GetMapping("/admin/product/update/{id}")
    public String updateProductForm(@PathVariable("id") long id, Model model) {
        Product product = productService.getProductById(id); // Lấy thông tin sản phẩm cần sửa
        model.addAttribute("product", product);
        model.addAttribute("categories", productService.getAllCategories()); // Lấy danh sách các danh mục
        return "admin/product/update"; // Trả về trang sửa sản phẩm
    }

    // Phương thức xử lý cập nhật sản phẩm
    @PostMapping("/admin/product/update/{id}")
    public String updateProduct(
            @PathVariable("id") long id,
            @Valid @ModelAttribute("product") Product product,
            @RequestParam("imageFile") MultipartFile imageFile,
            BindingResult result,
            Model model) {

        // Kiểm tra lỗi binding
        if (result.hasErrors()) {
            model.addAttribute("categories", productService.getAllCategories());
            return "admin/product/update"; // Trả về form sửa sản phẩm nếu có lỗi
        }

        // Xử lý hình ảnh nếu có
        if (!imageFile.isEmpty()) {
            String fileName = uploadService.handleSaveUploadFile(imageFile, "products");
            product.setImage(fileName);
        }

        // Cập nhật sản phẩm
        productService.updateProduct(id, product);

        return "redirect:/admin/product"; // Quay lại danh sách sản phẩm sau khi cập nhật
    }

    @GetMapping("/admin/product/delete/{id}")
    public String deleteProduct(@PathVariable("id") long id, Model model) {
        // Xóa sản phẩm bằng id
        productService.deleteProduct(id);

        // Sau khi xóa, chuyển hướng về trang danh sách sản phẩm
        return "redirect:/admin/product";
    }
}