package vn.nhom18.shoppingclothes.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import vn.nhom18.shoppingclothes.domain.Category;
import vn.nhom18.shoppingclothes.domain.Product;
import vn.nhom18.shoppingclothes.repository.CategoryRepository;
import vn.nhom18.shoppingclothes.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository; // Thêm repository của danh mục

    public ProductService(ProductRepository productRepository, CategoryRepository categoryRepository) {
        this.productRepository = productRepository;
        this.categoryRepository = categoryRepository; // Inject vào constructor
    }

    public Product createProduct(Product pr) {
        return this.productRepository.save(pr);
    }

    public List<Product> fetchProducts() {
        return this.productRepository.findAll();
    }

    public Optional<Product> fetchProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void deleteProduct(long id) {
        this.productRepository.deleteById(id);
    }

    // Phương thức lấy tất cả danh mục
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    public Product getProductById(long id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy sản phẩm với ID: " + id));
    }

    // Phương thức cập nhật sản phẩm
    public void updateProduct(long id, Product product) {
        Product existingProduct = productRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Không tìm thấy sản phẩm với ID: " + id));

        existingProduct.setName(product.getName());
        existingProduct.setPrice(product.getPrice());
        existingProduct.setQuantity(product.getQuantity());
        existingProduct.setShortDesc(product.getShortDesc());
        existingProduct.setDetailDesc(product.getDetailDesc());
        existingProduct.setCategory(product.getCategory());

        if (product.getImage() != null && !product.getImage().isEmpty()) {
            existingProduct.setImage(product.getImage());
        }

        productRepository.save(existingProduct); // Lưu lại sản phẩm đã cập nhật
    }

}
