package org.ruizhu.aiblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Created by Rui Zhu
 */
@Controller
public class MainController {

    @GetMapping("/index.html#/home")
    public String home() {
        return "index";
    }
}
