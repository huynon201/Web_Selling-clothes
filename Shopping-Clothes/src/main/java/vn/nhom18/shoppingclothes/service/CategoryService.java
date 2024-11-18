package vn.nhom18.shoppingclothes.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.nhom18.shoppingclothes.domain.Category;
import vn.nhom18.shoppingclothes.repository.CategoryRepository;
import vn.nhom18.shoppingclothes.repository.ProductRepository;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;
    private final ProductRepository productRepository;
    public CategoryService(CategoryRepository categoryRepository, ProductRepository productRepository) {
        this.categoryRepository = categoryRepository;
        this.productRepository = productRepository;
    }

    public List<Category> getAllCategories() {
        return categoryRepository.findAll(); // Lấy tất cả danh mục
    }

   // Phương thức xóa danh mục theo ID
   @Transactional
   public void deleteById(long id) {
       // Kiểm tra xem có sản phẩm nào liên kết với danh mục này không
       long count = productRepository.countByCategoryId(id);

       if (count > 0) {
           throw new RuntimeException("Không thể xóa danh mục này vì vẫn còn sản phẩm liên kết.");
       }

       // Nếu không có sản phẩm, tiến hành xóa danh mục
       categoryRepository.deleteById(id);
   }
    public Category findById(long id) {
        return categoryRepository.findById(id).orElseThrow(() -> new RuntimeException("Category not found"));
    }
    // Phương thức lưu danh mục
    public void save(Category category) {
        categoryRepository.save(category);
    }
}
