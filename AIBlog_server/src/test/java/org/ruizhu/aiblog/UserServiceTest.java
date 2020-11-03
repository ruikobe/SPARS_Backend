package org.ruizhu.aiblog;

import org.junit.Test;
import org.ruizhu.aiblog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


import static org.junit.jupiter.api.Assertions.assertNotNull;



@SpringBootTest
public class UserServiceTest {

    @Autowired
    UserService userService;

    @Test
    void getUserByNickname(){
        assertNotNull(userService.getUserByNickname("Rui"));
    }

    @Test
    void getUserById(){
        assertNotNull(userService.getUserById((long)1));
    }

    @Test
    void getAllRoleTest(){
        assertNotNull(userService.getAllRole());
    }
}
