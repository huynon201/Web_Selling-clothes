package vn.nhom18.shoppingclothes.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.nhom18.shoppingclothes.domain.Discount;

public interface DiscountRepository extends JpaRepository<Discount, Long> {

    Discount findBycode(String code);

    boolean existsByCode(String code);

    
}
