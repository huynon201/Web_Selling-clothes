package vn.nhom18.shoppingclothes.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nhom18.shoppingclothes.domain.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    // Phương thức đếm số lượng sản phẩm thuộc danh mục
    long countByCategoryId(long categoryId);
}
