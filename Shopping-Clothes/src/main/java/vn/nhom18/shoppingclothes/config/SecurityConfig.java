package vn.nhom18.shoppingclothes.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
<<<<<<< HEAD
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
=======
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
<<<<<<< HEAD
// @EnableWebSecurity
=======
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
public class SecurityConfig {
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
<<<<<<< HEAD

=======
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
}
