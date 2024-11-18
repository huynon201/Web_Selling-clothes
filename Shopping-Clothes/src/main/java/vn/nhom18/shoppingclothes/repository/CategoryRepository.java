package vn.nhom18.shoppingclothes.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.nhom18.shoppingclothes.domain.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
}
