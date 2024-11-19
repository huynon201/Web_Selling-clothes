package vn.nhom18.shoppingclothes.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nhom18.shoppingclothes.domain.User;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findById(long id);

     // Tìm người dùng dựa trên email
     User findByEmail(String email);  // Thêm phương thức này để tìm người dùng theo email

    boolean existsByEmail(String email); // Optional: Kiểm tra xem email đã tồn tại chưa
}
