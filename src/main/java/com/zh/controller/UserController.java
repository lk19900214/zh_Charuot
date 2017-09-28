package com.zh.controller;

import com.zh.entity.UserDo;
import com.zh.service.UserService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by lk on 2017-09-20.
 * 用户得注册登录
 */
@Log4j
@Controller
public class UserController {
    @Autowired
    private UserService user;


    @RequestMapping("/login.do")
    public String login(){
        return "login";
    }
    @RequestMapping("/register.do")
    public String register(){
        return "register";
    }
    @RequestMapping("/insert.do") @PostMapping
    public String insert(UserDo u, HttpServletResponse resp) {
       try {
        PrintWriter out=resp.getWriter();
        int userp=user.insert(u);
        if(userp>0){
            out.print("注册成功");
            return "login";
        }else {
            return "register";
        }
        } catch (IOException e) {
            e.printStackTrace();
        }
       return "";
    }
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
    @RequestMapping(value = "/userlogin.do",method = RequestMethod.POST) @ResponseBody
    public int userLogin(UserDo userdo){
        UserDo ua = user.selectOne(userdo);
        if(ua!=null){
            return 0;//已被注册可以登录
        }else {
            return 1;//未注册
        }
    }

}
