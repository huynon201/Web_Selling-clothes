package vn.nhom18.shoppingclothes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.nhom18.shoppingclothes.domain.Role;
import vn.nhom18.shoppingclothes.domain.User;
import vn.nhom18.shoppingclothes.repository.RoleRepository;
import vn.nhom18.shoppingclothes.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
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
    
}
