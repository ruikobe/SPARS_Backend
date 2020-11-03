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
    public void existsByNicknameTest(){
        assertNotNull(userService.getAllRole());
    }
}
