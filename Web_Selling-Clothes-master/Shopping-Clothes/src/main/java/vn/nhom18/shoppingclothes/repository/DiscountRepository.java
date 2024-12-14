package vn.nhom18.shoppingclothes.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nhom18.shoppingclothes.domain.Discount;

@Repository
public interface DiscountRepository extends JpaRepository<Discount, Long> {

    Discount findBycode(String code);

    boolean existsByCode(String code);

    
}
