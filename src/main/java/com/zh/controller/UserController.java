package com.zh.controller;

import com.zh.entity.UserDo;
import com.zh.service.UserService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by lk on 2017-09-20.
 * 用户得注册登录
 */
@Log4j
@Controller
public class UserController {
    @Autowired
    private UserService user;

    @RequestMapping()
    public String index() {
        return "index";
    }

    @GetMapping("/login.do")
    public String login() {
        return "/login";
    }

    @RequestMapping("/register.do")
    public String register() {
        return "register";
    }

    /**
     * @param u
     * @param resp
     * @return
     * 注册会员
     */
    @RequestMapping("/insert.do")
    @PostMapping
    public String insert(UserDo u, HttpServletResponse resp) {
        try {
            PrintWriter out = resp.getWriter();
            int userp = user.insert(u);
            if (userp > 0) {
                out.print("注册成功");
                return "/login";
            } else {
                return "register";
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }

    /**
     * @param vcode
     * @param session
     * @return
     * 验证码判断是否一直
     */
    @RequestMapping("/verify.do")
    @ResponseBody
    public String verify(String vcode, HttpSession session) {
        String verify = session.getAttribute("checkM").toString();
        if (vcode.equalsIgnoreCase(verify)) {
            return "输入正确";
        } else {
            return "输入不一致";
        }
    }

    @RequestMapping(value = "/userlogin.do")
    @ResponseBody
    public int userLogin(UserDo userdo) {
        UserDo ua = user.selectOne(userdo);
        if (ua != null) {
            return 0;//已被注册可以登录
        } else {
            return 1;//未注册
        }
    }
    @RequestMapping("/uLogin.action") @ResponseBody
    public int uLogin(UserDo userDo,HttpSession session){
        UserDo ud = user.selectOne(userDo);
        if(ud!=null){
            session.setAttribute("userLogin",ud);
            return 1;
        }else {
            return 0;
        }

    }
    @RequestMapping("/forget.do") @ResponseBody
    public int forget(UserDo userDo){
     return 1;
    }

}
