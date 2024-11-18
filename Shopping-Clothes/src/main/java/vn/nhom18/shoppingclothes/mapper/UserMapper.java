package vn.nhom18.shoppingclothes.mapper;

import vn.nhom18.shoppingclothes.domain.Role;
import vn.nhom18.shoppingclothes.domain.User;
import vn.nhom18.shoppingclothes.dto.UserDto;

public class UserMapper {

    public static UserDto toUserDto(User user) {
        UserDto userDto = new UserDto();
        userDto.setId(user.getId());
        userDto.setEmail(user.getEmail());
        userDto.setName(user.getName());
        userDto.setPassword(user.getPassword()); // Không nên trả mật khẩu khi chuyển sang DTO trong thực tế
        userDto.setAddress(user.getAddress());
        userDto.setPhone(user.getPhone());
        userDto.setRoleId(user.getRole().getId()); // Chỉ lấy ID của Role
        userDto.setAvatar(user.getAvatar());
        return userDto;
    }

    public static User toUser(UserDto userDto) {
        User user = new User();
        user.setId(userDto.getId());
        user.setEmail(userDto.getEmail());
        user.setName(userDto.getName());
        user.setPassword(userDto.getPassword());
        user.setAddress(userDto.getAddress());
        user.setPhone(userDto.getPhone());
        user.setAvatar(userDto.getAvatar());
        // Giả sử roleId có giá trị và bạn có thể lấy Role từ cơ sở dữ liệu
        Role role = new Role();
        role.setId(userDto.getRoleId());
        user.setRole(role); // Lấy đối tượng Role từ roleId
        return user;
    }
}
