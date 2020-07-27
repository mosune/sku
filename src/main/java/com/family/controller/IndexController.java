package com.family.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author gcg
 * @create 2020-07-22 18:25
 **/
@Controller
public class IndexController {

    @RequestMapping("index.do")
    public String index() {
        return "index";
    }

}
