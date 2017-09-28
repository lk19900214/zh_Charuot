package com.zh.controller;

import com.zh.entity.UserDo;
import com.zh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by webrx on 2017-09-20.
 */
@Controller
public class UserController {
    @Autowired
    private UserService user;
    @RequestMapping("/register.do")
    public String insert(UserDo u, HttpServletResponse resp) {
       /* try {
        PrintWriter out=resp.getWriter();
        int userp=user.insert(u);
        if(userp>0){
            out.print("注册成功");
            return "login";
        }
        } catch (IOException e) {
            e.printStackTrace();
        }*/
        return "";
    }
    @RequestMapping("/verify.do")
    @ResponseBody
    public String verify( HttpSession session, HttpServletRequest req) {
        String code=req.getParameter("code");
        System.out.println(code+"11111111");
        String verify = session.getAttribute("checkM").toString();
        System.out.println(verify+"2222222");
        if (code.equalsIgnoreCase(verify)) {
            return "输入正确";
        } else {
            return "输入不一致";
        }
    }
}
