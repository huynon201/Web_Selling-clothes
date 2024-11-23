package vn.nhom18.shoppingclothes.repository;

<<<<<<< HEAD
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.nhom18.shoppingclothes.domain.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
    List<Role> findAll();
=======
import org.springframework.data.jpa.repository.JpaRepository;

import vn.nhom18.shoppingclothes.domain.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
>>>>>>> db1513353576fc680b5d2ead4b1d76814edb230f
}
