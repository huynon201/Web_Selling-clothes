package vn.nhom18.shoppingclothes.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.nhom18.shoppingclothes.domain.Product;
import vn.nhom18.shoppingclothes.repository.ProductRepository;

@Controller
public class HomeController {
    
    private final ProductRepository productRepository;

    public HomeController(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }
    
    @GetMapping("/")
    public String showHomePage(Model model){
       //Lấy danh sách sản phẩm từ database
        List<Product> products = productRepository.findAll();

        //Thêm danh sách sản phẩm vào model
        model.addAttribute("products", products);
        return "user/homepage";
    }

}
