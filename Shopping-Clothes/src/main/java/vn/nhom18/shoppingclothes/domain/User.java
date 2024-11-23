package vn.nhom18.shoppingclothes.domain;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;

<<<<<<< HEAD
import org.springframework.web.multipart.MultipartFile;

=======
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
<<<<<<< HEAD
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
=======
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotNull
<<<<<<< HEAD
    @NotEmpty(message = "Email không được để trống")
=======
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
    @Email(message = "Email không hợp lệ", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;

    @NotNull
<<<<<<< HEAD
    @NotEmpty(message = "Họ tên không được để trống")
=======
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
    @Size(min = 6, message = "Họ tên phải tối thiểu 6 ký tự")
    private String name;

    @NotNull
    @Size(min = 6, message = "Password phải tối thiểu 6 ký tự")
    private String password;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss a", timezone = "GMT+7")
    private LocalDateTime createDate;

<<<<<<< HEAD
    @NotNull(message = "Vai trò không được để trống")
=======
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
    @ManyToOne
    @JoinColumn(name = "role_id")
    private Role role;

    private String avatar;
<<<<<<< HEAD

    @NotEmpty(message = "Địa chỉ không được để trống")
    private String address;

    @NotEmpty(message = "Số điện thoại không được để trống")
    @Pattern(regexp = "^\\d{10,11}$", message = "Số điện thoại không hợp lệ")
    private String phone;



=======
    private String address;
    private String phone;

>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public LocalDateTime getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @PrePersist
    public void handleBeforCreate() {
        this.setCreateDate(LocalDateTime.now());
    }
<<<<<<< HEAD

=======
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
<<<<<<< HEAD

    @Override
    public String toString() {
        return "User [id=" + id + ", email=" + email + ", name=" + name + ", password=" + password + ", createDate="
                + createDate + ", role=" + role + ", avatar=" + avatar + ", address=" + address + ", phone=" + phone
                + "]";
    }

=======
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
}
