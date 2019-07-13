package com.gdufe.controller;

import com.gdufe.entity.User;
import com.gdufe.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(User user, HttpServletRequest request){
        HttpSession session = request.getSession();
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String loginTime = format.format(date);
        User u = userService.login(user.getUser(), user.getPassword());
        if(u != null){
            int uId = u.getuId();
            int result = userService.updateLoginTime(uId, loginTime);
            session.setAttribute("u", u);
            return "index";
        }
        return "login";
    }


    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("u");
        return "index";
    }
}
