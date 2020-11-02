package org.ruizhu.aiblog.controller;

import org.ruizhu.aiblog.bean.RespBean;
import org.ruizhu.aiblog.bean.User;
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
     * 如果自动跳转到这个页面，说明用户未登录，返回相应的提示即可
     * <p>
     * 如果要支持表单登录，可以在这个方法中判断请求的类型，进而决定返回JSON还是HTML页面
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

