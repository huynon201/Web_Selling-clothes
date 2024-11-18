package vn.nhom18.shoppingclothes.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UploadService {

    public String handleSaveUploadFile(MultipartFile file, String targetFolder) {
        if (file.isEmpty()) {
            return "";
        }

        // Đường dẫn đến thư mục trong static
        String rootPath = "src/main/resources/static/images"; // Chỉnh lại đường dẫn
        String finalName = "";

        try {
            byte[] bytes = file.getBytes();

            // Tạo thư mục lưu trữ nếu chưa tồn tại
            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            // Đặt tên file duy nhất
            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();

            // Tạo file trên server
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);

            try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile))) {
                stream.write(bytes);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Trả về URL tương đối
        return "/images/" + targetFolder + "/" + finalName; // Cập nhật đường dẫn trả về
    }

}
