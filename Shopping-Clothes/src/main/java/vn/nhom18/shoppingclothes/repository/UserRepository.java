package vn.nhom18.shoppingclothes.repository;

import org.springframework.data.jpa.repository.JpaRepository;
<<<<<<< HEAD
import org.springframework.stereotype.Repository;
=======
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f

import vn.nhom18.shoppingclothes.domain.User;
import java.util.List;

<<<<<<< HEAD
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findById(long id);

     // Tìm người dùng dựa trên email
     User findByEmail(String email);  // Thêm phương thức này để tìm người dùng theo email

    boolean existsByEmail(String email); // Optional: Kiểm tra xem email đã tồn tại chưa
=======
public interface UserRepository extends JpaRepository<User, Long> {
    User findById(long id);
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
}
