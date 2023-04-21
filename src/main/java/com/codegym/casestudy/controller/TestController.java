package com.codegym.casestudy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class TestController {
    @GetMapping("/")
    public String template(){
        return "template";
    }
    @GetMapping("/index")
    public String index(){
        return "index";
    }
    @GetMapping("/cart")
    public String cart(){
        return "cart";
    }
    @GetMapping("/blog")
    public String blog(){
        return "blog";
    }
}
