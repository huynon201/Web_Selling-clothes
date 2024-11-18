package vn.nhom18.shoppingclothes.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public class UserDto {

    private long id;

    @NotNull
    @NotEmpty(message = "Email không được để trống")
    @Email(message = "Email không hợp lệ", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;

    @NotNull
    @NotEmpty(message = "Họ tên không được để trống")
    @Size(min = 6, message = "Họ tên phải tối thiểu 6 ký tự")
    private String name;

    @NotNull
    @Size(min = 6, message = "Mật khẩu phải tối thiểu 6 ký tự")
    private String password;

    @NotEmpty(message = "Địa chỉ không được để trống")
    private String address;

    @NotEmpty(message = "Số điện thoại không được để trống")
    @Pattern(regexp = "^\\d{10,11}$", message = "Số điện thoại không hợp lệ")
    private String phone;

    @NotNull(message = "Vai trò không được để trống")
    private Long roleId; // Chỉ lưu trữ ID vai trò (thay vì đối tượng Role)

    private String avatar;

    // Getter và Setter

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
