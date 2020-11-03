package org.ruizhu.aiblog.controller;

import org.ruizhu.aiblog.model.RespBean;
import org.ruizhu.aiblog.model.User;
import org.ruizhu.aiblog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Rui Zhu
 */
@RestController
public class LoginRegController {

    @Autowired
    UserService userService;

    @RequestMapping("/login_error")
    public RespBean loginError() {
        return new RespBean("error", "Login Failed!");
    }

    @RequestMapping("/login_success")
    public RespBean loginSuccess() {
        return new RespBean("success", "Login Successfully!");
    }

    /**
     * If the user is not logged in, it would automatically jump to this page, return the message to the user.
     * <p>
     * This method decides to return JSON or HTML page based on the type of request.
     *
     * @return
     */
    @RequestMapping("/login_page")
    public RespBean loginPage() {
        return new RespBean("error", "Please login first!");
    }

    @PostMapping("/reg")
    public RespBean reg(User user) {
        int result = userService.reg(user);
        if (result == 0) {
            //Success
            return new RespBean("success", "Register Successfully!");
        } else if (result == 1) {
            return new RespBean("error", "User exists. Register Failed!");
        } else {
            //Failed
            return new RespBean("error", "Register Failed!");
        }
    }
}

