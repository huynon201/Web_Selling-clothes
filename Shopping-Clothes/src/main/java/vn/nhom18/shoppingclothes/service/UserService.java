package vn.nhom18.shoppingclothes.service;

<<<<<<< HEAD
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
=======
import java.util.List;

>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
import org.springframework.stereotype.Service;

import vn.nhom18.shoppingclothes.domain.Role;
import vn.nhom18.shoppingclothes.domain.User;
import vn.nhom18.shoppingclothes.repository.RoleRepository;
import vn.nhom18.shoppingclothes.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
<<<<<<< HEAD
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
=======

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
    }

    public List<User> handlegetAllUser() {
        return this.userRepository.findAll();
    }

    public void handleSaveUser(User user) {
        this.userRepository.save(user);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public void handleDeleteUser(long id) {
        this.userRepository.deleteById(id);
    }

<<<<<<< HEAD
    public List<Role> getAllRoles() {
        return roleRepository.findAll();
    }

    public void handleUpdateUser(User user) {
        // Lấy vai trò từ cơ sở dữ liệu theo tên
        Role role = roleRepository.findByName(user.getRole().getName());
        if (role == null) {
            throw new IllegalArgumentException("Vai trò không hợp lệ: " + user.getRole().getName());
        }

        // Gán vai trò cho người dùng
        user.setRole(role);

        // Lưu người dùng đã cập nhật vào cơ sở dữ liệu
        userRepository.save(user);
    }

    public Role getRoleById(long id) {
        return roleRepository.findById(id).orElse(null);
    }

    public boolean registerUser(User user) {
        // Kiểm tra email đã tồn tại chưa
        if (userRepository.existsByEmail(user.getEmail())) {
            return false;
        }

        // Mã hóa mật khẩu
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        // Gán ngày tạo
        user.setCreateDate(LocalDateTime.now());

        // Gán vai trò cho người dùng (Role)
        Role defaultRole = roleRepository.findByName("USER");
        if (defaultRole == null) {
            throw new RuntimeException("Vai trò mặc định 'USER' không tồn tại trong cơ sở dữ liệu!");
        }
        user.setRole(defaultRole); // Gán role vào user

        // Lưu thông tin vào cơ sở dữ liệu
        userRepository.save(user);
        return true;
    }

    public User authenticateUser(String email, String password) {
        // Tìm người dùng qua email
        User user = userRepository.findByEmail(email);

        // Kiểm tra mật khẩu
        if (user != null && passwordEncoder.matches(password, user.getPassword())) {
            return user; // Trả về người dùng nếu thành công
        }
        return null; // Nếu email không tồn tại hoặc mật khẩu sai
    }

    public boolean existsByEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false; // Email trống không tồn tại
        }
        return userRepository.existsByEmail(email);
    }

  

=======
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
}
